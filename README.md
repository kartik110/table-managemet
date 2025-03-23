# Table Management System

## Installation Guide

1. Clone the repository
```bash
git clone https://github.com/kartik110/table-managemet.git
```

2. Install Dependencies
```bash
cd table-managemet
composer install
```

3. Database Configuration
- Open `config/database.php`
- Update database credentials:
```php
'mysql' => [
    'host' => 'localhost',
    'database' => 'your_database_name',
    'username' => 'your_username',
    'password' => 'your_password',
]
```

4. Database Setup
- Run migrations:
```bash
php artisan migrate
```
- If migrations fail, import the provided SQL file manually from the `database` folder.

5. Running the Application
- Move project to your web server directory (e.g., htdocs, www)
- Access via browser: `http://localhost/table-managemet`

## Requirements
- PHP >= 8.1
- MySQL >= 5.7
- Composer

## Features
- Table Management System
- User Authentication
- Data Visualization

## Database Schema

The application uses three main database tables:

### production_tables

```php
Schema::create('production_tables', function (Blueprint $table) {
    $table->id();
    $table->string('name');
    $table->enum('floor', ['1st floor', '2nd floor', '3rd floor']);
    $table->integer('seats');
    $table->text('description')->nullable();
    $table->timestamps();
});
```

This table stores information about physical tables in the workspace, including their name, floor location, number of seats, and an optional description.

### users

```php
Schema::table('users', function (Blueprint $table) {
    $table->foreignId('table_id')->nullable()->constrained('production_tables')->nullOnDelete();
});
```

The standard Laravel users table is extended with a `table_id` field that references the user's default table assignment.

### daily_table_mappings

```php
Schema::create('daily_table_mappings', function (Blueprint $table) {
    $table->id();
    $table->foreignId('user_id')->constrained()->cascadeOnDelete();
    $table->foreignId('table_id')->constrained('production_tables')->cascadeOnDelete();
    $table->date('mapping_date');
    $table->timestamps();
    
    // Ensure a user can only have one mapping per day
    $table->unique(['user_id', 'mapping_date']);
});
```

This table stores temporary table assignments for specific dates. The unique constraint ensures a user can only be assigned to one table per day.

## Models

### ProductionTable Model

```php
class ProductionTable extends Model
{
    protected $fillable = [
        'name',
        'floor',
        'seats',
        'description',
    ];

    /**
     * Get the users assigned to this table.
     */
    public function users(): HasMany
    {
        return $this->hasMany(User::class, 'table_id');
    }

    /**
     * Get the daily mappings for this table.
     */
    public function dailyMappings(): HasMany
    {
        return $this->hasMany(DailyTableMapping::class, 'table_id');
    }
}
```

The `ProductionTable` model represents a physical table in the workspace. It defines relationships to users (who have this table as their default) and daily mappings (temporary assignments to this table).

### User Model

```php
class User extends Authenticatable
{
    protected $fillable = [
        'name',
        'email',
        'password',
        'role',
        'table_id',
    ];

    /**
     * Get the table that the user is assigned to.
     */
    public function table(): BelongsTo
    {
        return $this->belongsTo(ProductionTable::class, 'table_id');
    }

    /**
     * Get the daily mappings for this user.
     */
    public function dailyMappings(): HasMany
    {
        return $this->hasMany(DailyTableMapping::class);
    }

    /**
     * Check if user is an admin or super admin
     */
    public function isAdmin(): bool
    {
        return in_array($this->role, ['admin', 'super_admin']);
    }
}
```

The `User` model extends Laravel's `Authenticatable` class and adds relationships to tables and daily mappings. It also includes helper methods for role checking.

### DailyTableMapping Model

```php
class DailyTableMapping extends Model
{
    protected $fillable = [
        'user_id',
        'table_id',
        'mapping_date',
    ];

    protected $casts = [
        'mapping_date' => 'date',
    ];

    /**
     * Get the user for this mapping.
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Get the table for this mapping.
     */
    public function table(): BelongsTo
    {
        return $this->belongsTo(ProductionTable::class, 'table_id');
    }
}
```

The `DailyTableMapping` model represents a temporary assignment of a user to a table for a specific date. It uses the `$casts` property to automatically convert the `mapping_date` to a Carbon date instance.

## Controllers

### ProductionTableController

This controller handles CRUD operations for tables:

```php
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

    // Other methods: create(), edit(), update(), destroy()
}
```

The controller uses Laravel's validation system to ensure data integrity before database operations.

### UserController

This controller manages user accounts and their default table assignments:

```php
class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $users = User::with('table')->get();
        return view('users.index', compact('users'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
            'role' => ['required', Rule::in(['admin', 'super_admin', 'user'])],
            'table_id' => 'nullable|exists:production_tables,id',
        ]);

        $validated['password'] = Hash::make($validated['password']);

        User::create($validated);

        return redirect()->route('users.index')
            ->with('success', 'User created successfully.');
    }

    // Other methods: create(), edit(), update(), destroy()
}
```

The controller uses eager loading (`with('table')`) to prevent N+1 query problems and hashes passwords before storage.

### DailyMappingController

This controller manages daily table assignments:

```php
class DailyMappingController extends Controller
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
        
        return view('daily-mapping.index', compact('tables', 'usersByTable', 'date', 'formattedDate'));
    }
    
    /**
     * Save the daily mapping.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'mappings' => 'required|array',
            'mappings.*.user_id' => 'required|exists:users,id',
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
```

The `index()` method organizes users by table, using daily mappings if available or default tables if not. The `store()` method deletes existing mappings for the date to avoid duplicates and creates new mappings based on the submitted data.

### HistoryController

This controller provides historical view of table assignments:

```php
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
```

The `index()` method groups mappings by date and then by table for hierarchical display. The `showDate()` method shows a detailed view for a specific date. The `export()` method generates a CSV file with mapping data.

## JavaScript for Drag-and-Drop

```javascript
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
```

This JavaScript code implements drag-and-drop functionality for the daily mapping interface:

1. The `dragUser()` function stores the user ID and current table ID in the drag event's data transfer object.
2. The `dropUser()` function:

1. Retrieves the user ID and current table ID from the data transfer object
2. Moves the user element to the new table in the DOM
3. Records the change in the `currentMappings` object
4. Updates visual feedback



3. The save button event listener:

1. Converts the tracking object to an array
2. If no changes were made, collects the current state
3. Sends the data to the server via fetch API
4. Provides feedback to the user





## Routes

```php
// Dashboard
Route::get('/', function () {
    return view('dashboard');
})->name('dashboard');

// Table routes
Route::resource('tables', ProductionTableController::class);

// User routes
Route::resource('users', UserController::class);

// Daily Mapping routes
Route::get('/daily-mapping', [DailyMappingController::class, 'index'])->name('daily-mapping.index');
Route::post('/daily-mapping', [DailyMappingController::class, 'store'])->name('daily-mapping.store');
Route::post('/daily-mapping/reset', [DailyMappingController::class, 'reset'])->name('daily-mapping.reset');

// History routes
Route::get('/history', [HistoryController::class, 'index'])->name('history.index');
Route::get('/history/{date}', [HistoryController::class, 'showDate'])->name('history.show');
Route::get('/history/export/csv', [HistoryController::class, 'export'])->name('history.export');
```

The application uses Laravel's resource routing for standard CRUD operations and defines custom routes for specialized functionality like daily mapping and history viewing.

## Views Structure

The application uses Blade templates organized into several sections:

```plaintext
resources/views/
├── layouts/
│   └── app.blade.php         # Main layout template
├── dashboard.blade.php       # Home page
├── tables/                   # Table management views
│   ├── index.blade.php
│   ├── create.blade.php
│   └── edit.blade.php
├── users/                    # User management views
│   ├── index.blade.php
│   ├── create.blade.php
│   └── edit.blade.php
├── daily-mapping/            # Daily mapping views
│   └── index.blade.php
└── history/                  # History views
    ├── index.blade.php
    └── show.blade.php
```

## Usage Guide

### Setting Up Tables

1. Navigate to the Tables section
2. Click "Add New Table"
3. Fill in the table details:

1. Name (e.g., "Table 1")
2. Floor (select from dropdown)
3. Number of seats
4. Optional description



4. Click "Create Table"


### Managing Users

1. Navigate to the Users section
2. Click "Add New User"
3. Fill in the user details:

1. Name
2. Email
3. Password
4. Role (user, admin, or super_admin)
5. Default table assignment



4. Click "Create User"


### Creating Daily Mappings

1. Navigate to the Daily Mapping section
2. The interface shows users at their default tables
3. Drag users to different tables as needed
4. Click "Save Daily Mapping" to save changes
5. Changes will apply only for the selected date


### Viewing History

1. Navigate to the History section
2. Browse the list of dates with custom mappings
3. Click "View" on any date to see the detailed floor plan
4. Use the date filters to narrow down the history
5. Click "Export to CSV" to download the data


## Best Practices Implemented

### 1. Data Validation

All input is validated using Laravel's validation system:

```php
$validated = $request->validate([
    'name' => 'required|string|max:255',
    'floor' => ['required', Rule::in(['1st floor', '2nd floor', '3rd floor'])],
    'seats' => 'required|integer|min:1',
    'description' => 'nullable|string',
]);
```

### 2. Eager Loading

Relationships are eager loaded to prevent N+1 query problems:

```php
$mappings = DailyTableMapping::with(['user', 'table'])
    ->where('mapping_date', $formattedDate)
    ->get();
```

### 3. CSRF Protection

All forms include CSRF tokens to prevent cross-site request forgery:

```php
<form action="{{ route('tables.store') }}" method="POST">
    @csrf
    <!-- Form fields -->
</form>
```

### 4. Password Hashing

User passwords are hashed before storage:

```php
$validated['password'] = Hash::make($validated['password']);
```

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request


## License

This project is licensed under the MIT License - see the LICENSE file for details.
