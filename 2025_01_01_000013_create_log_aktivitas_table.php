<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('log_aktivitas', function (Blueprint $table) {
            $table->id('id_log');
            $table->foreignId('id_user')->constrained('user', 'id_user');
            $table->string('aktivitas');
            $table->string('tabel_terkait')->nullable();
            $table->unsignedBigInteger('id_referensi')->nullable();
            $table->timestamp('tanggal_waktu')->useCurrent();
            $table->text('keterangan')->nullable();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('log_aktivitas');
    }
};
