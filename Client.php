<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Client extends Model
{
    protected $table = 'client';
    protected $primaryKey = 'id_client';

    protected $fillable = ['nama_client', 'alamat', 'no_telepon', 'email', 'kontak_person'];

    public function rfqs(): HasMany
    {
        return $this->hasMany(Rfq::class, 'id_client', 'id_client');
    }

    public function projects(): HasMany
    {
        return $this->hasMany(Project::class, 'id_client', 'id_client');
    }
}
