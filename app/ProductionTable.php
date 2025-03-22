<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class ProductionTable extends Model
{
    use HasFactory;

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
