@extends('layouts.app')

@section('content')
<section class="main-content-wrapper">
    @include('utilities.messages')
        <section class="content-header">
            <h1>Table Mapping for {{ $date->format('d M Y') }}</h1>
            <div>
                <a href="{{ route('history.index') }}" class="btn btn-outline-secondary">
                    <i class="fas fa-arrow-left me-2"></i> Back to History
                </a>
            </div>
    </section>


    <div class="box-wrapper">
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
                                <div class="table-card">
                                    <div class="table-title">{{ $table->name }}</div>
                                    <div class="user-container">
                                        @if(isset($usersByTable[$table->id]))
                                            @foreach($usersByTable[$table->id] as $user)
                                            <div class="user-item">
                                                {{ $user->name }}
                                            </div>
                                            @endforeach
                                        @else
                                            <div class="text-muted fst-italic">No users assigned</div>
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
        </div>
    </div>
</section>
@endsection

@push('styles')
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
        background-color: white;
    }
    
    .user-container {
        min-height: 100px;
    }
    
    .nav-tabs .nav-link.active {
        font-weight: 600;
    }
</style>
@endpush