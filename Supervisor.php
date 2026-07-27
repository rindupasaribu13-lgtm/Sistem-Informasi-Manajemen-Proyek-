<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Supervisor extends Model
{
    protected $table = 'supervisor';
    protected $primaryKey = 'id_supervisor';

    protected $fillable = ['id_user', 'nama_supervisor', 'departemen', 'no_telepon', 'email'];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'id_user', 'id_user');
    }

    public function projects(): HasMany
    {
        return $this->hasMany(Project::class, 'id_supervisor', 'id_supervisor');
    }
}
