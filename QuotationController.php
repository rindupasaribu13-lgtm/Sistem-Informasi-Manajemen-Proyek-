<?php

namespace App\Http\Controllers;

use App\Models\Quotation;
use App\Models\Rfq;
use Illuminate\Http\Request;

class QuotationController extends Controller
{
    public function index(Request $request)
    {
        $quotations = Quotation::with('rfq.client')
            ->when($request->search, fn ($q) => $q->where('nomor_quotation', 'like', "%{$request->search}%"))
            ->latest('id_quotation')
            ->paginate(10)
            ->withQueryString();

        return view('quotation.index', compact('quotations'));
    }

    public function create()
    {
        return view('quotation.create', ['rfqs' => Rfq::with('client')->orderBy('nomor_rfq')->get()]);
    }

    public function store(Request $request)
    {
        Quotation::create($this->validated($request));

        return redirect()->route('quotation.index')->with('success', 'Quotation berhasil ditambahkan.');
    }

    public function edit(Quotation $quotation)
    {
        return view('quotation.edit', ['quotation' => $quotation, 'rfqs' => Rfq::with('client')->orderBy('nomor_rfq')->get()]);
    }

    public function update(Request $request, Quotation $quotation)
    {
        $quotation->update($this->validated($request));

        return redirect()->route('quotation.index')->with('success', 'Quotation berhasil diperbarui.');
    }

    public function destroy(Quotation $quotation)
    {
        $quotation->delete();

        return redirect()->route('quotation.index')->with('success', 'Quotation berhasil dihapus.');
    }

    private function validated(Request $request): array
    {
        return $request->validate([
            'id_rfq' => 'required|exists:rfq,id_rfq',
            'nomor_quotation' => 'required|string|max:255',
            'tanggal' => 'required|date',
            'valid_sampai' => 'nullable|date',
            'total_nilai' => 'nullable|numeric',
            'status' => 'required|in:Draft,Dikirim,Disetujui,Ditolak',
        ]);
    }
}
