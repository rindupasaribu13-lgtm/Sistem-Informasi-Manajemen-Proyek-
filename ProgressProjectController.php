<?php

namespace App\Http\Controllers;

use App\Models\Project;
use App\Models\ProgressProject;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProgressProjectController extends Controller
{
    public function index(Request $request)
    {
        $projects = Project::with('progress')
            ->when($request->project, fn ($q) => $q->where('id_project', $request->project))
            ->when($request->search, fn ($q) => $q->where('nama_project', 'like', "%{$request->search}%"))
            ->with('client')
            ->latest('id_project')
            ->paginate(10)
            ->withQueryString();

        $all = Project::all();
        $stats = [
            'total' => $all->count(),
            'berjalan' => $all->where('status', 'Berjalan')->count(),
            'hampir_selesai' => $all->where('status', 'Hampir Selesai')->count(),
            'selesai' => $all->where('status', 'Selesai')->count(),
        ];

        return view('progress-project.index', compact('projects', 'stats'));
    }

    public function show(Project $project)
    {
        $project->load(['progress' => fn ($q) => $q->with('creator', 'laporan')->orderByDesc('tanggal')]);

        return view('progress-project.show', compact('project'));
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'id_project' => 'required|exists:project,id_project',
            'tanggal' => 'required|date',
            'persentase' => 'required|integer|min:0|max:100',
            'keterangan' => 'nullable|string',
        ]);

        $data['dibuat_oleh'] = Auth::id();

        $progress = ProgressProject::create($data);

        return redirect()->route('progress-project.show', $progress->id_project)->with('success', 'Progress berhasil ditambahkan.');
    }

    public function edit(ProgressProject $progressProject)
    {
        $this->authorizeOwner($progressProject);

        return view('progress-project.edit', ['progress' => $progressProject]);
    }

    public function update(Request $request, ProgressProject $progressProject)
    {
        $this->authorizeOwner($progressProject);

        $data = $request->validate([
            'tanggal' => 'required|date',
            'persentase' => 'required|integer|min:0|max:100',
            'keterangan' => 'nullable|string',
        ]);

        $progressProject->update($data);

        return redirect()->route('progress-project.show', $progressProject->id_project)->with('success', 'Progress berhasil diperbarui.');
    }

    public function destroy(ProgressProject $progressProject)
    {
        $idProject = $progressProject->id_project;
        $progressProject->delete();

        return redirect()->route('progress-project.show', $idProject)->with('success', 'Progress berhasil dihapus.');
    }

    private function authorizeOwner(ProgressProject $progressProject): void
    {
        $user = Auth::user();

        if ($user->role->slug === 'supervisor' && $progressProject->dibuat_oleh !== $user->id_user) {
            abort(403, 'Anda hanya dapat mengubah progress yang Anda buat sendiri.');
        }
    }
}
