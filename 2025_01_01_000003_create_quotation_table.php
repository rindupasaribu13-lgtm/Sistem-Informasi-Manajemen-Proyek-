<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('quotation', function (Blueprint $table) {
            $table->id('id_quotation');
            $table->foreignId('id_rfq')->constrained('rfq', 'id_rfq');
            $table->string('nomor_quotation')->unique();
            $table->date('tanggal');
            $table->date('valid_sampai')->nullable();
            $table->decimal('total_nilai', 18, 2)->default(0);
            $table->string('status')->default('Draft');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('quotation');
    }
};
