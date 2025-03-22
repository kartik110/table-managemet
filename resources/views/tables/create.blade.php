@extends('layouts.app')

@section('content')
<section class="main-content-wrapper">
    @include('utilities.messages')
        <section class="content-header">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="mb-4">Create New Table</h1>
            </div>
    </section>


    <div class="box-wrapper">
        <div class="card-header">
            <h5 class="card-title mb-0">Table Details</h5>
        </div>
        <div class="card-body">
            <form action="{{ route('tables.store') }}" method="POST">
                @csrf
                
                <div class="mb-3">
                    <label for="name" class="form-label">Table Name</label>
                    <input type="text" class="form-control @error('name') is-invalid @enderror" id="name" name="name" value="{{ old('name') }}" required>
                    @error('name')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>
                
                <div class="mb-3">
                    <label for="floor" class="form-label">Floor</label>
                    <select class="form-select @error('floor') is-invalid @enderror" id="floor" name="floor" required>
                        <option value="" disabled {{ old('floor') ? '' : 'selected' }}>Select floor</option>
                        <option value="1st floor" {{ old('floor') == '1st floor' ? 'selected' : '' }}>1st floor</option>
                        <option value="2nd floor" {{ old('floor') == '2nd floor' ? 'selected' : '' }}>2nd floor</option>
                        <option value="3rd floor" {{ old('floor') == '3rd floor' ? 'selected' : '' }}>3rd floor</option>
                    </select>
                    @error('floor')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>
                
                <div class="mb-3">
                    <label for="seats" class="form-label">Number of Seats</label>
                    <input type="number" class="form-control @error('seats') is-invalid @enderror" id="seats" name="seats" value="{{ old('seats', 1) }}" min="1" required>
                    <div class="form-text">How many users can sit at this table</div>
                    @error('seats')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>
                
                <div class="mb-3">
                    <label for="description" class="form-label">Description</label>
                    <textarea class="form-control @error('description') is-invalid @enderror" id="description" name="description" rows="3">{{ old('description') }}</textarea>
                    @error('description')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>
                
                <div class="d-flex gap-2">
                    <button type="submit" class="btn btn-primary">Create Table</button>
                    <a href="{{ route('tables.index') }}" class="btn btn-outline-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</section>
@endsection