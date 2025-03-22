@extends('layouts.app')

@section('content')
<section class="main-content-wrapper">
    @include('utilities.messages')
        <section class="content-header">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1>Production Tables</h1>
                <a href="{{ route('tables.create') }}" class="btn btn-primary">
                    <i class="fas fa-plus-circle me-2"></i> Add New Table
                </a>
            </div>
    </section>


    <div class="box-wrapper">
        <div class="card-header">
            <h5 class="card-title mb-0">All Tables</h5>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Table Name</th>
                            <th>Floor</th>
                            <th>Number of Seats</th>
                            <th>Description</th>
                            <th class="text-end">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($tables as $table)
                            <tr>
                                <td>{{ $table->name }}</td>
                                <td>{{ $table->floor }}</td>
                                <td>{{ $table->seats }}</td>
                                <td>{{ $table->description }}</td>
                                <td class="text-end">
                                    <div class="btn-group" role="group">
                                        <a href="{{ route('tables.edit', $table) }}" class="btn btn-sm btn-outline-primary">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <form action="{{ route('tables.destroy', $table) }}" method="POST" class="d-inline" onsubmit="return confirm('Are you sure you want to delete this table?');">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-sm btn-outline-danger">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="5" class="text-center">No tables found. Create your first table.</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
@endsection