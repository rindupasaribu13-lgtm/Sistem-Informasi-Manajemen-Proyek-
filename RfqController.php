<?php

namespace App\Http\Controllers;

use App\Models\Client;
use App\Models\Rfq;
use Illuminate\Http\Request;

class RfqController extends Controller
{
    public function index(Request $request)
    {
        $rfqs = Rfq::with('client')
            ->when($request->search, fn ($q) => $q->where('nomor_rfq', 'like', "%{$request->search}%"))
            ->latest('id_rfq')
            ->paginate(10)
            ->withQueryString();

        return view('rfq.index', compact('rfqs'));
    }

    public function create()
    {
        return view('rfq.create', ['clients' => Client::orderBy('nama_client')->get()]);
    }

    public function store(Request $request)
    {
        Rfq::create($this->validated($request));

        return redirect()->route('rfq.index')->with('success', 'RFQ berhasil ditambahkan.');
    }

    public function edit(Rfq $rfq)
    {
        return view('rfq.edit', ['rfq' => $rfq, 'clients' => Client::orderBy('nama_client')->get()]);
    }

    public function update(Request $request, Rfq $rfq)
    {
        $rfq->update($this->validated($request));

        return redirect()->route('rfq.index')->with('success', 'RFQ berhasil diperbarui.');
    }

    public function destroy(Rfq $rfq)
    {
        $rfq->delete();

        return redirect()->route('rfq.index')->with('success', 'RFQ berhasil dihapus.');
    }

    private function validated(Request $request): array
    {
        return $request->validate([
            'id_client' => 'required|exists:client,id_client',
            'nomor_rfq' => 'required|string|max:255',
            'tanggal_rfq' => 'required|date',
            'deskripsi' => 'nullable|string',
            'status' => 'required|in:Baru,Diproses,Selesai,Ditolak',
        ]);
    }
}
