<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class DailyTableMapping extends Model
{
    use HasFactory;

    protected $table = 'daily_table_history';

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
