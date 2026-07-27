<?php

namespace App\Http\Controllers;

use App\Models\Client;
use App\Models\Project;
use App\Models\PurchaseOrder;
use App\Models\Supervisor;
use App\Models\User;
use Illuminate\Http\Request;

class ProjectController extends Controller
{
    public function index(Request $request)
    {
        $projects = Project::with('client')
            ->when($request->search, fn ($q) => $q->where('nama_project', 'like', "%{$request->search}%"))
            ->when($request->status, fn ($q) => $q->where('status', $request->status))
            ->latest('id_project')
            ->paginate(10)
            ->withQueryString();

        return view('project.index', compact('projects'));
    }

    public function create()
    {
        return view('project.create', [
            'clients' => Client::orderBy('nama_client')->get(),
            'pms' => User::whereHas('role', fn ($q) => $q->where('nama_role', 'Project Manager'))->orderBy('nama')->get(),
            'purchaseOrders' => PurchaseOrder::with('quotation.rfq')->orderBy('nomor_po')->get(),
            'supervisors' => Supervisor::orderBy('nama_supervisor')->get(),
        ]);
    }

    public function store(Request $request)
    {
        $data = $this->validated($request);

        Project::create($data);

        return redirect()->route('project.index')->with('success', 'Proyek berhasil ditambahkan.');
    }

    public function show(Project $project)
    {
        $project->load(['client', 'pm', 'purchaseOrder.quotation.rfq', 'supervisor', 'team.user', 'progress.creator', 'dokumen.uploader', 'invoices.pembayaran']);

        return view('project.show', [
            'project' => $project,
            'users' => User::orderBy('nama')->get(),
        ]);
    }

    public function edit(Project $project)
    {
        return view('project.edit', [
            'project' => $project,
            'clients' => Client::orderBy('nama_client')->get(),
            'pms' => User::whereHas('role', fn ($q) => $q->where('nama_role', 'Project Manager'))->orderBy('nama')->get(),
            'purchaseOrders' => PurchaseOrder::with('quotation.rfq')->orderBy('nomor_po')->get(),
            'supervisors' => Supervisor::orderBy('nama_supervisor')->get(),
        ]);
    }

    public function update(Request $request, Project $project)
    {
        $data = $this->validated($request);

        $project->update($data);

        return redirect()->route('project.index')->with('success', 'Proyek berhasil diperbarui.');
    }

    public function destroy(Project $project)
    {
        $project->delete();

        return redirect()->route('project.index')->with('success', 'Proyek berhasil dihapus.');
    }

    private function validated(Request $request): array
    {
        return $request->validate([
            'id_client' => 'required|exists:client,id_client',
            'id_pm' => 'required|exists:user,id_user',
            'id_po' => 'nullable|exists:purchase_order,id_po',
            'id_supervisor' => 'nullable|exists:supervisor,id_supervisor',
            'nomor_project' => 'required|string|max:255|unique:project,nomor_project,'.($request->route('project')?->id_project ?? 'NULL').',id_project',
            'nama_project' => 'required|string|max:255',
            'lokasi' => 'nullable|string|max:255',
            'deskripsi' => 'nullable|string',
            'tanggal_mulai' => 'nullable|date',
            'tanggal_selesai_plan' => 'nullable|date',
            'nilai_kontrak' => 'nullable|numeric',
            'status' => 'required|in:Perencanaan,Berjalan,Hampir Selesai,Selesai',
        ]);
    }
}
