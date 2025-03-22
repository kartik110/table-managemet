<?php

namespace App\Http\Controllers;

use App\{DailyTableMapping, ProductionTable};
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class HistoryController extends Controller
{
    /**
     * Display the history of table mappings.
     */
    public function index(Request $request)
    {
        // Get unique dates from daily mappings
        $dates = DailyTableMapping::select('mapping_date')
            ->distinct()
            ->orderBy('mapping_date', 'desc')
            ->get()
            ->pluck('mapping_date');
        
        // If no dates found, return empty history
        if ($dates->isEmpty()) {
            return view('history.index', [
                'dates' => [],
                'mappingHistory' => []
            ]);
        }
        
        // Get date range for filtering
        $startDate = $request->input('start_date') ? Carbon::parse($request->input('start_date')) : null;
        $endDate = $request->input('end_date') ? Carbon::parse($request->input('end_date')) : null;
        
        // Apply date filters if provided
        $query = DailyTableMapping::with(['user', 'table'])
            ->orderBy('mapping_date', 'desc');
            
        if ($startDate) {
            $query->where('mapping_date', '>=', $startDate->format('Y-m-d'));
        }
        
        if ($endDate) {
            $query->where('mapping_date', '<=', $endDate->format('Y-m-d'));
        }
        
        // Get all mappings
        $mappings = $query->get();
        
        // Group mappings by date and then by table
        $mappingHistory = [];
        
        foreach ($mappings as $mapping) {
            $date = $mapping->mapping_date->format('Y-m-d');
            $tableId = $mapping->table_id;
            
            if (!isset($mappingHistory[$date])) {
                $mappingHistory[$date] = [];
            }
            
            if (!isset($mappingHistory[$date][$tableId])) {
                $mappingHistory[$date][$tableId] = [
                    'table_name' => $mapping->table->name,
                    'users' => []
                ];
            }
            
            $mappingHistory[$date][$tableId]['users'][] = $mapping->user;
        }
        
        return view('history.index', [
            'dates' => $dates,
            'mappingHistory' => $mappingHistory,
            'startDate' => $startDate,
            'endDate' => $endDate
        ]);
    }
    
    /**
     * Display the history for a specific date.
     */
    public function showDate($date)
    {
        try {
            $parsedDate = Carbon::parse($date);
        } catch (\Exception $e) {
            return redirect()->route('history.index')
                ->with('error', 'Invalid date format');
        }
        
        // Get all tables
        $tables = ProductionTable::all()->groupBy('floor');
        
        // Get mappings for the specific date
        $mappings = DailyTableMapping::with(['user', 'table'])
            ->where('mapping_date', $parsedDate->format('Y-m-d'))
            ->get();
        
        // Group users by table
        $usersByTable = [];
        
        foreach ($mappings as $mapping) {
            $tableId = $mapping->table_id;
            
            if (!isset($usersByTable[$tableId])) {
                $usersByTable[$tableId] = [];
            }
            
            $usersByTable[$tableId][] = $mapping->user;
        }
        
        return view('history.show', [
            'date' => $parsedDate,
            'tables' => $tables,
            'usersByTable' => $usersByTable
        ]);
    }
    
    /**
     * Export history data to CSV.
     */
    public function export(Request $request)
    {
        $startDate = $request->input('start_date') ? Carbon::parse($request->input('start_date')) : null;
        $endDate = $request->input('end_date') ? Carbon::parse($request->input('end_date')) : null;
        
        $query = DailyTableMapping::with(['user', 'table'])
            ->orderBy('mapping_date', 'asc');
            
        if ($startDate) {
            $query->where('mapping_date', '>=', $startDate->format('Y-m-d'));
        }
        
        if ($endDate) {
            $query->where('mapping_date', '<=', $endDate->format('Y-m-d'));
        }
        
        $mappings = $query->get();
        
        // Create CSV content
        $headers = [
            'Content-Type' => 'text/csv',
            'Content-Disposition' => 'attachment; filename="table_mapping_history.csv"',
        ];
        
        $callback = function() use ($mappings) {
            $file = fopen('php://output', 'w');
            
            // Add headers
            fputcsv($file, ['Date', 'Table', 'Floor', 'User']);
            
            // Add data
            foreach ($mappings as $mapping) {
                fputcsv($file, [
                    $mapping->mapping_date->format('d/m/Y'),
                    $mapping->table->name,
                    $mapping->table->floor,
                    $mapping->user->name
                ]);
            }
            
            fclose($file);
        };
        
        return response()->stream($callback, 200, $headers);
    }
}
