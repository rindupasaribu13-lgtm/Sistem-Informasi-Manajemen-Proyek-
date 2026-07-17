<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('invoice', function (Blueprint $table) {
            $table->id('id_invoice');
            $table->foreignId('id_project')->constrained('project', 'id_project');
            $table->string('nomor_invoice')->unique();
            $table->date('tanggal_invoice');
            $table->decimal('nilai_invoice', 18, 2)->default(0);
            $table->decimal('ppn', 18, 2)->default(0);
            $table->decimal('total', 18, 2)->default(0);
            $table->string('status')->default('Belum Dibayar');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('invoice');
    }
};
