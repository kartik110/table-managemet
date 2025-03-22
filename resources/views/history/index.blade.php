@extends('layouts.app')

@section('content')
<section class="main-content-wrapper">
    @include('utilities.messages')
        <section class="content-header">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1>Table Mapping History</h1>
                <a href="{{ route('history.export') }}" class="btn btn-success">
                    <i class="fas fa-file-export me-2"></i> Export to CSV
                </a>
            </div>
    </section>


    <div class="box-wrapper">
        <div class="card-body">
            @if(count($mappingHistory) > 0)
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead class="table-light">
                            <tr>
                                <th style="width: 150px;">Date</th>
                                <th>Table Assignments</th>
                                <th style="width: 100px;">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($mappingHistory as $date => $tables)
                                <tr>
                                    <td class="align-middle">{{ \Carbon\Carbon::parse($date)->format('d/m/Y') }}</td>
                                    <td>
                                        @foreach($tables as $tableId => $tableData)
                                            <div class="mb-2">
                                                <strong>{{ $tableData['table_name'] }}:</strong>
                                                @foreach($tableData['users'] as $index => $user)
                                                    {{ $user->name }}{{ $index < count($tableData['users']) - 1 ? ',' : '' }}
                                                @endforeach
                                            </div>
                                        @endforeach
                                    </td>
                                    <td class="text-center">
                                        <a href="{{ route('history.show', $date) }}" class="btn btn-sm btn-outline-primary">
                                            <i class="fas fa-eye"></i> View
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            @else
                <div class="alert alert-info">
                    No mapping history found. Please adjust your filter criteria or create some daily mappings first.
                </div>
            @endif
        </div>
    </div>
</section>
@endsection