<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('pembayaran', function (Blueprint $table) {
            $table->id('id_pembayaran');
            $table->foreignId('id_invoice')->constrained('invoice', 'id_invoice');
            $table->date('tanggal_bayar');
            $table->decimal('jumlah_bayar', 18, 2)->default(0);
            $table->string('metode_pembayaran')->nullable();
            $table->string('no_referensi')->nullable();
            $table->string('status')->default('Terkonfirmasi');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('pembayaran');
    }
};
