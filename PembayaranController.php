<?php

namespace App\Http\Controllers;

use App\Models\Invoice;
use App\Models\Pembayaran;
use Illuminate\Http\Request;

class PembayaranController extends Controller
{
    public function store(Request $request, Invoice $invoice)
    {
        $data = $request->validate([
            'tanggal_bayar' => 'required|date',
            'jumlah_bayar' => 'required|numeric',
            'metode_pembayaran' => 'nullable|string|max:255',
            'no_referensi' => 'nullable|string|max:255',
            'status' => 'required|in:Terkonfirmasi,Menunggu Verifikasi',
        ]);

        $data['id_invoice'] = $invoice->id_invoice;

        Pembayaran::create($data);

        if ($invoice->pembayaran()->sum('jumlah_bayar') >= $invoice->total) {
            $invoice->update(['status' => 'Lunas']);
        }

        return back()->with('success', 'Pembayaran berhasil dicatat.');
    }

    public function destroy(Invoice $invoice, Pembayaran $pembayaran)
    {
        $pembayaran->delete();

        return back()->with('success', 'Pembayaran berhasil dihapus.');
    }
}
