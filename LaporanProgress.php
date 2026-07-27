<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class LaporanProgress extends Model
{
    protected $table = 'laporan_progress';
    protected $primaryKey = 'id_laporan';

    protected $fillable = ['id_progress', 'judul', 'deskripsi', 'file_path', 'tanggal_upload', 'dibuat_oleh'];

    protected function casts(): array
    {
        return ['tanggal_upload' => 'datetime'];
    }

    public function progress(): BelongsTo
    {
        return $this->belongsTo(ProgressProject::class, 'id_progress', 'id_progress');
    }

    public function creator(): BelongsTo
    {
        return $this->belongsTo(User::class, 'dibuat_oleh', 'id_user');
    }
}
