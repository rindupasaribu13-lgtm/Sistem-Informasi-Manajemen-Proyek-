<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('project_team', function (Blueprint $table) {
            $table->id('id_team');
            $table->foreignId('id_project')->constrained('project', 'id_project');
            $table->foreignId('id_user')->constrained('user', 'id_user');
            $table->string('jabatan')->nullable();
            $table->string('peran')->nullable();
            $table->date('tanggal_mulai')->nullable();
            $table->date('tanggal_selesai')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('project_team');
    }
};
