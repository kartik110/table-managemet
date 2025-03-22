<?php

namespace App\Http\Controllers;

use App\DailyTableMapping;
use App\ProductionTable;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

class DailyHistoryController extends Controller
{
    /**
     * Display the daily mapping page.
     */
    public function index(Request $request)
    {
        $date = $request->date ? Carbon::parse($request->date) : Carbon::today();
        $formattedDate = $date->format('Y-m-d');
        
        // Get all tables grouped by floor
        $tables = ProductionTable::all()->groupBy('floor');
        
        // Get all users
        $users = User::all();
        
        // Get daily mappings for the selected date
        $dailyMappings = DailyTableMapping::where('mapping_date', $formattedDate)
            ->get()
            ->keyBy('user_id');
        
        // Organize users by table
        $usersByTable = [];
        
        foreach ($users as $user) {
            // Check if user has a daily mapping for this date
            if (isset($dailyMappings[$user->id])) {
                $tableId = $dailyMappings[$user->id]->table_id;
            } else {
                // Use default table if no daily mapping
                $tableId = $user->table_id;
            }
            
            if ($tableId) {
                if (!isset($usersByTable[$tableId])) {
                    $usersByTable[$tableId] = [];
                }
                $usersByTable[$tableId][] = $user;
            }
        }
        
        return view('daily-history.index', compact('tables', 'usersByTable', 'date', 'formattedDate'));
    }
    
    /**
     * Save the daily mapping.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'mappings' => 'required|array',
            'mappings.*.user_id' => 'required|exists:tbl_users,id',
            'mappings.*.table_id' => 'required|exists:production_tables,id',
            'date' => 'required|date',
        ]);
        
        $date = $validated['date'];
        
        // Delete existing mappings for this date
        DailyTableMapping::where('mapping_date', $date)->delete();
        
        // Create new mappings
        foreach ($validated['mappings'] as $mapping) {
            DailyTableMapping::create([
                'user_id' => $mapping['user_id'],
                'table_id' => $mapping['table_id'],
                'mapping_date' => $date,
            ]);
        }
        
        return response()->json(['success' => true]);
    }
    
    /**
     * Reset mappings for a specific date.
     */
    public function reset(Request $request)
    {
        $validated = $request->validate([
            'date' => 'required|date',
        ]);
        
        // Delete all mappings for this date
        DailyTableMapping::where('mapping_date', $validated['date'])->delete();
        
        return response()->json(['success' => true]);
    }
}
