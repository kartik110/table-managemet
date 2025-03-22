@extends('layouts.app')

@push('styles')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
    .floor-container {
        margin-bottom: 2rem;
    }
    
    .table-card {
        border: 1px solid #dee2e6;
        border-radius: 0.5rem;
        padding: 1rem;
        height: 100%;
        background-color: white;
    }
    
    .table-title {
        font-weight: 600;
        font-size: 1.1rem;
        margin-bottom: 1rem;
    }
    
    .user-item {
        padding: 0.5rem;
        margin-bottom: 0.5rem;
        border: 1px solid #dee2e6;
        border-radius: 0.375rem;
        background-color: rgba(139, 92, 246, 0.1);
        cursor: move;
    }
    
    .user-container {
        min-height: 100px;
    }
    
    .table-card.drag-over {
        background-color: rgba(13, 110, 253, 0.1);
    }
    
    .nav-tabs .nav-link.active {
        font-weight: 600;
    }
</style>
@endpush

@section('content')
<section class="main-content-wrapper">
    @include('utilities.messages')
    <section class="content-header">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1>Table Mapping for {{ $date->format('d M Y') }}</h1>
            <div>
                <input type="date" id="mapping-date" class="form-control" value="{{ $date->format('Y-m-d') }}">
            </div>
        </div>
    </section>


    <div class="box-wrapper">
        <div class="card mb-4">
            <div class="card-body">
                <ul class="nav nav-tabs" id="floorTabs" role="tablist">
                    @foreach($tables->keys() as $index => $floor)
                    <li class="nav-item" role="presentation">
                        <button class="nav-link {{ $index === 0 ? 'active' : '' }}" 
                                id="{{ Str::slug($floor) }}-tab" 
                                data-bs-toggle="tab" 
                                data-bs-target="#{{ Str::slug($floor) }}" 
                                type="button" 
                                role="tab" 
                                aria-controls="{{ Str::slug($floor) }}" 
                                aria-selected="{{ $index === 0 ? 'true' : 'false' }}">
                            {{ $floor }}
                        </button>
                    </li>
                    @endforeach
                </ul>
                
                <div class="tab-content p-3" id="floorTabsContent">
                    @foreach($tables->keys() as $index => $floor)
                    <div class="tab-pane fade {{ $index === 0 ? 'show active' : '' }}" 
                         id="{{ Str::slug($floor) }}" 
                         role="tabpanel" 
                         aria-labelledby="{{ Str::slug($floor) }}-tab">
                        
                        <div class="floor-container">
                            <h2 class="mb-4">{{ $floor }}</h2>
                            
                            <div class="row g-4">
                                @foreach($tables[$floor] as $table)
                                <div class="col-md-6 col-lg-4">
                                    <div class="table-card" 
                                         data-table-id="{{ $table->id }}" 
                                         ondragover="event.preventDefault();" 
                                         ondrop="dropUser(event, {{ $table->id }})"
                                         ondragenter="this.classList.add('drag-over')"
                                         ondragleave="this.classList.remove('drag-over')">
                                        <div class="table-title">{{ $table->name }}</div>
                                        <div class="user-container" id="table-{{ $table->id }}-users">
                                            @if(isset($usersByTable[$table->id]))
                                                @foreach($usersByTable[$table->id] as $user)
                                                <div class="user-item" 
                                                     draggable="true" 
                                                     ondragstart="dragUser(event, {{ $user->id }}, {{ $table->id }})"
                                                     data-user-id="{{ $user->id }}">
                                                    {{ $user->name }}
                                                </div>
                                                @endforeach
                                            @endif
                                        </div>
                                    </div>
                                </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
                
                <div class="d-flex justify-content-end gap-2 mt-4">
                    <button id="reset-button" class="btn btn-outline-secondary">
                        Reset to Default
                    </button>
                    <button id="save-button" class="btn btn-primary">
                        Save Daily Mapping
                    </button>
                </div>
            </div>
        </div>
        {{-- <div class="table-box">
            <div class="table-responsive">
                <table id="datatable" class="table text-nowrap">
                    <thead>
                        <tr>
                            <th class="ir_w_1">@lang('index.sn')</th>
                            <th class="ir_w_12">@lang('index.name')</th>
                            <th class="ir_w_12">@lang('index.designation')</th>
                            <th class="ir_w_12">@lang('index.email')</th>
                            <th class="ir_w_12">@lang('index.phone')</th>
                            <th class="ir_w_12">@lang('index.roles')</th>
                            <th class="ir_w_12">@lang('index.status')</th>

                            <th class="ir_w_1_txt_center">@lang('index.actions')</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($obj as $key => $value)
                            <tr>
                                <td class="ir_txt_center">{{ ++$key }}</td>
                                <td>{{ $value->name ?? '' }}</td>
                                <td>{{ $value->designation ?? '' }}</td>
                                <td>{{ $value->email ?? '' }}</td>
                                <td>{{ $value->phone_number ?? '' }}</td>
                                <td>{{ getRolePermissionName($value->permission_role) ?? 'N/A' }}</td>
                                <td>
                                    <span
                                        class="text-{{ $value->status == 'Active' ? 'success' : 'danger' }}">{{ $value->status }}</span>
                                </td>

                                <td class="ir_txt_center">
                                    @if (routePermission('user.edit'))
                                        <a href="{{ route('user.edit', encrypt_decrypt($value->id, 'encrypt')) }}" class="button-success"
                                            data-bs-toggle="tooltip" data-bs-placement="top"
                                            title="@lang('index.edit')"><i class="fa fa-edit"></i></a>
                                    @endif
                                    @if (routePermission('user.delete'))
                                        <a href="#" class="delete button-danger"
                                            data-form_class="alertDelete{{ $value->id }}" type="submit"
                                            data-bs-toggle="tooltip" data-bs-placement="top" title="@lang('index.delete')">
                                            <form action="{{ route('user.destroy', $value) }}"
                                                class="alertDelete{{ $value->id }}" method="post">
                                                @csrf
                                                @method('DELETE')
                                                <i class="c_padding_13 fa fa-trash tiny-icon"></i>
                                            </form>
                                        </a>
                                    @endif
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div> --}}
    </div>

</section>
@endsection

@section('script')
<script>
    // Current mappings to track changes
    let currentMappings = {};
    
    // Drag and drop functionality
    function dragUser(event, userId, currentTableId) {
        event.dataTransfer.setData('userId', userId);
        event.dataTransfer.setData('currentTableId', currentTableId);
    }
    
    function dropUser(event, newTableId) {
        event.preventDefault();
        const userId = event.dataTransfer.getData('userId');
        const currentTableId = event.dataTransfer.getData('currentTableId');
        
        if (currentTableId != newTableId) {
            const userElement = document.querySelector(`[data-user-id="${userId}"]`);
            const newTableContainer = document.getElementById(`table-${newTableId}-users`);
            
            if (userElement && newTableContainer) {
                newTableContainer.appendChild(userElement);
                
                // Update mappings
                currentMappings[userId] = newTableId;
            }
        }
        
        event.target.closest('.table-card').classList.remove('drag-over');
    }
    
    // Date change handler
    document.getElementById('mapping-date').addEventListener('change', function() {
        window.location.href = "{{ route('daily-mapping.index') }}?date=" + this.value;
    });
    
    // Save mappings
    document.getElementById('save-button').addEventListener('click', function() {
        const mappings = [];
        
        // Convert currentMappings object to array
        for (const userId in currentMappings) {
            mappings.push({
                user_id: parseInt(userId),
                table_id: currentMappings[userId]
            });
        }
        
        // If no changes, collect current state
        if (mappings.length === 0) {
            document.querySelectorAll('.user-item').forEach(userElement => {
                const userId = userElement.dataset.userId;
                const tableId = userElement.closest('.table-card').dataset.tableId;
                
                mappings.push({
                    user_id: parseInt(userId),
                    table_id: parseInt(tableId)
                });
            });
        }
        
        // Send to server
        fetch("{{ route('daily-mapping.store') }}", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            body: JSON.stringify({
                mappings: mappings,
                date: '{{ $formattedDate }}'
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Daily mapping saved successfully!');
                // Reset tracking
                currentMappings = {};
            }
        })
        .catch(error => {
            console.error('Error saving mappings:', error);
            alert('Failed to save mappings. Please try again.');
        });
    });
    
    // Reset to default
    document.getElementById('reset-button').addEventListener('click', function() {
        if (confirm('Are you sure you want to reset to default table assignments?')) {
            fetch("{{ route('daily-mapping.reset') }}", {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                body: JSON.stringify({
                    date: '{{ $formattedDate }}'
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    window.location.reload();
                }
            })
            .catch(error => {
                console.error('Error resetting mappings:', error);
                alert('Failed to reset mappings. Please try again.');
            });
        }
    });
</script>
@endsection