<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Str;

class Role extends Model
{
    protected $table = 'role';
    protected $primaryKey = 'id_role';

    protected $fillable = ['nama_role', 'deskripsi'];

    public function users(): HasMany
    {
        return $this->hasMany(User::class, 'id_role', 'id_role');
    }

    public function getSlugAttribute(): string
    {
        return Str::slug($this->nama_role, '_');
    }
}
