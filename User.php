<?php

namespace App\Models;

use App\Models\Concerns\LogsActivity;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable, LogsActivity;

    protected $table = 'user';
    protected $primaryKey = 'id_user';

    protected $fillable = [
        'id_role',
        'nama',
        'username',
        'password',
        'email',
        'no_telepon',
        'status_aktif',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected function casts(): array
    {
        return [
            'password' => 'hashed',
        ];
    }

    public function role(): BelongsTo
    {
        return $this->belongsTo(Role::class, 'id_role', 'id_role');
    }

    public function projectsAsPm(): HasMany
    {
        return $this->hasMany(Project::class, 'id_pm', 'id_user');
    }

    public function activityLogs(): HasMany
    {
        return $this->hasMany(LogAktivitas::class, 'id_user', 'id_user');
    }

    public function isRole(string ...$roles): bool
    {
        return in_array($this->role->slug, $roles, true);
    }
}
