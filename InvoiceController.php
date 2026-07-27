<?php

namespace App\Http\Controllers;

use App\Models\Invoice;
use App\Models\Project;
use Illuminate\Http\Request;

class InvoiceController extends Controller
{
    public function index(Request $request)
    {
        $invoices = Invoice::with('project')
            ->when($request->search, fn ($q) => $q->where('nomor_invoice', 'like', "%{$request->search}%"))
            ->latest('id_invoice')
            ->paginate(10)
            ->withQueryString();

        return view('invoice.index', compact('invoices'));
    }

    public function create(Request $request)
    {
        return view('invoice.create', [
            'projects' => Project::orderBy('nama_project')->get(),
            'selectedProject' => $request->project,
        ]);
    }

    public function store(Request $request)
    {
        Invoice::create($this->validated($request));

        return redirect()->route('invoice.index')->with('success', 'Invoice berhasil ditambahkan.');
    }

    public function show(Invoice $invoice)
    {
        $invoice->load('project.client', 'pembayaran');

        return view('invoice.show', compact('invoice'));
    }

    public function edit(Invoice $invoice)
    {
        return view('invoice.edit', ['invoice' => $invoice, 'projects' => Project::orderBy('nama_project')->get()]);
    }

    public function update(Request $request, Invoice $invoice)
    {
        $invoice->update($this->validated($request));

        return redirect()->route('invoice.index')->with('success', 'Invoice berhasil diperbarui.');
    }

    public function destroy(Invoice $invoice)
    {
        $invoice->delete();

        return redirect()->route('invoice.index')->with('success', 'Invoice berhasil dihapus.');
    }

    private function validated(Request $request): array
    {
        $data = $request->validate([
            'id_project' => 'required|exists:project,id_project',
            'nomor_invoice' => 'required|string|max:255',
            'tanggal_invoice' => 'required|date',
            'nilai_invoice' => 'required|numeric',
            'ppn' => 'nullable|numeric',
            'status' => 'required|in:Belum Dibayar,Terkonfirmasi,Lunas',
        ]);

        $data['ppn'] = $data['ppn'] ?? 0;
        $data['total'] = $data['nilai_invoice'] + $data['ppn'];

        return $data;
    }
}
