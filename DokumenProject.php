<?php

namespace App\Models;

use App\Models\Concerns\LogsActivity;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class DokumenProject extends Model
{
    use LogsActivity;

    protected $table = 'dokumen_project';
    protected $primaryKey = 'id_dokumen';

    protected $fillable = ['id_project', 'nama_dokumen', 'jenis_dokumen', 'file_path', 'tanggal_upload', 'diunggah_oleh', 'keterangan'];

    protected function casts(): array
    {
        return ['tanggal_upload' => 'datetime'];
    }

    public function project(): BelongsTo
    {
        return $this->belongsTo(Project::class, 'id_project', 'id_project');
    }

    public function uploader(): BelongsTo
    {
        return $this->belongsTo(User::class, 'diunggah_oleh', 'id_user');
    }
}
