<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('rfq', function (Blueprint $table) {
            $table->id('id_rfq');
            $table->foreignId('id_client')->constrained('client', 'id_client');
            $table->string('nomor_rfq')->unique();
            $table->date('tanggal_rfq');
            $table->text('deskripsi')->nullable();
            $table->string('status')->default('Baru');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('rfq');
    }
};
