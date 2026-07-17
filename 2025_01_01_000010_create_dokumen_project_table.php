<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('dokumen_project', function (Blueprint $table) {
            $table->id('id_dokumen');
            $table->foreignId('id_project')->constrained('project', 'id_project');
            $table->string('nama_dokumen');
            $table->string('jenis_dokumen')->nullable();
            $table->string('file_path');
            $table->timestamp('tanggal_upload')->useCurrent();
            $table->foreignId('diunggah_oleh')->constrained('user', 'id_user');
            $table->text('keterangan')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('dokumen_project');
    }
};
