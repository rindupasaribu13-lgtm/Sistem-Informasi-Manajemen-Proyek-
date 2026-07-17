<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('project', function (Blueprint $table) {
            $table->id('id_project');
            $table->foreignId('id_client')->constrained('client', 'id_client');
            $table->foreignId('id_pm')->constrained('user', 'id_user');
            $table->foreignId('id_po')->nullable()->constrained('purchase_order', 'id_po');
            $table->foreignId('id_supervisor')->nullable()->constrained('supervisor', 'id_supervisor');
            $table->string('nomor_project')->unique();
            $table->string('nama_project');
            $table->string('lokasi')->nullable();
            $table->text('deskripsi')->nullable();
            $table->date('tanggal_mulai')->nullable();
            $table->date('tanggal_selesai_plan')->nullable();
            $table->decimal('nilai_kontrak', 18, 2)->default(0);
            $table->string('status')->default('Perencanaan');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('project');
    }
};
