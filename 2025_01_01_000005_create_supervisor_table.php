<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('supervisor', function (Blueprint $table) {
            $table->id('id_supervisor');
            $table->foreignId('id_user')->constrained('user', 'id_user');
            $table->string('nama_supervisor');
            $table->string('departemen')->nullable();
            $table->string('no_telepon')->nullable();
            $table->string('email')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('supervisor');
    }
};
