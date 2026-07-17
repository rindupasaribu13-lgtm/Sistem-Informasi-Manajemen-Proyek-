<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('laporan_progress', function (Blueprint $table) {
            $table->id('id_laporan');
            $table->foreignId('id_progress')->constrained('progress_project', 'id_progress');
            $table->string('judul');
            $table->text('deskripsi')->nullable();
            $table->string('file_path')->nullable();
            $table->timestamp('tanggal_upload')->useCurrent();
            $table->foreignId('dibuat_oleh')->constrained('user', 'id_user');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('laporan_progress');
    }
};
