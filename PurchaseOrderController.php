<?php

namespace App\Http\Controllers;

use App\Models\PurchaseOrder;
use App\Models\Quotation;
use Illuminate\Http\Request;

class PurchaseOrderController extends Controller
{
    public function index(Request $request)
    {
        $purchaseOrders = PurchaseOrder::with('quotation.rfq.client')
            ->when($request->search, fn ($q) => $q->where('nomor_po', 'like', "%{$request->search}%"))
            ->latest('id_po')
            ->paginate(10)
            ->withQueryString();

        return view('purchase-order.index', compact('purchaseOrders'));
    }

    public function create()
    {
        return view('purchase-order.create', ['quotations' => Quotation::with('rfq.client')->orderBy('nomor_quotation')->get()]);
    }

    public function store(Request $request)
    {
        PurchaseOrder::create($this->validated($request));

        return redirect()->route('purchase-order.index')->with('success', 'Purchase Order berhasil ditambahkan.');
    }

    public function edit(PurchaseOrder $purchaseOrder)
    {
        return view('purchase-order.edit', ['purchaseOrder' => $purchaseOrder, 'quotations' => Quotation::with('rfq.client')->orderBy('nomor_quotation')->get()]);
    }

    public function update(Request $request, PurchaseOrder $purchaseOrder)
    {
        $purchaseOrder->update($this->validated($request));

        return redirect()->route('purchase-order.index')->with('success', 'Purchase Order berhasil diperbarui.');
    }

    public function destroy(PurchaseOrder $purchaseOrder)
    {
        $purchaseOrder->delete();

        return redirect()->route('purchase-order.index')->with('success', 'Purchase Order berhasil dihapus.');
    }

    private function validated(Request $request): array
    {
        return $request->validate([
            'id_quotation' => 'required|exists:quotation,id_quotation',
            'nomor_po' => 'required|string|max:255',
            'tanggal_po' => 'required|date',
            'nilai_po' => 'nullable|numeric',
            'status' => 'required|in:Diterima,Selesai,Dibatalkan',
        ]);
    }
}
