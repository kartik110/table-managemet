<?php

namespace App\Http\Controllers;

use App\{ProductionTable};
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class ProductionTableController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $tables = ProductionTable::all();
        return view('tables.index', compact('tables'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('tables.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'floor' => ['required', Rule::in(['1st floor', '2nd floor', '3rd floor'])],
            'seats' => 'required|integer|min:1',
            'description' => 'nullable|string',
        ]);

        ProductionTable::create($validated);

        return redirect()->route('tables.index')
            ->with('success', 'Table created successfully.');
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(ProductionTable $table)
    {
        return view('tables.edit', compact('table'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, ProductionTable $table)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'floor' => ['required', Rule::in(['1st floor', '2nd floor', '3rd floor'])],
            'seats' => 'required|integer|min:1',
            'description' => 'nullable|string',
        ]);

        $table->update($validated);

        return redirect()->route('tables.index')
            ->with('success', 'Table updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ProductionTable $table)
    {
        $table->delete();

        return redirect()->route('tables.index')
            ->with('success', 'Table deleted successfully.');
    }
}
