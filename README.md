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

## License
This project is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
