<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('purchase_order', function (Blueprint $table) {
            $table->id('id_po');
            $table->foreignId('id_quotation')->constrained('quotation', 'id_quotation');
            $table->string('nomor_po')->unique();
            $table->date('tanggal_po');
            $table->decimal('nilai_po', 18, 2)->default(0);
            $table->string('status')->default('Diterima');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('purchase_order');
    }
};
