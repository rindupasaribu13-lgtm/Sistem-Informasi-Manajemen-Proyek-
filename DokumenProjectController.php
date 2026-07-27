<?php

namespace App\Http\Controllers;

use App\Models\DokumenProject;
use App\Models\Project;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class DokumenProjectController extends Controller
{
    public function index(Request $request)
    {
        $dokumen = DokumenProject::with(['project', 'uploader'])
            ->when($request->project, fn ($q) => $q->where('id_project', $request->project))
            ->when($request->kategori, fn ($q) => $q->where('jenis_dokumen', $request->kategori))
            ->when($request->search, fn ($q) => $q->where('nama_dokumen', 'like', "%{$request->search}%"))
            ->latest('tanggal_upload')
            ->paginate(10)
            ->withQueryString();

        return view('dokumen-project.index', [
            'dokumen' => $dokumen,
            'projects' => Project::orderBy('nama_project')->get(),
            'kategoris' => DokumenProject::query()->distinct()->pluck('jenis_dokumen')->filter(),
        ]);
    }

    public function create(Request $request)
    {
        return view('dokumen-project.create', [
            'projects' => Project::orderBy('nama_project')->get(),
            'selectedProject' => $request->project,
        ]);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'id_project' => 'required|exists:project,id_project',
            'nama_dokumen' => 'required|string|max:255',
            'jenis_dokumen' => 'nullable|string|max:255',
            'keterangan' => 'nullable|string',
            'file' => 'required|file|max:20480',
        ]);

        $path = $request->file('file')->store('dokumen-project', 'public');

        DokumenProject::create([
            'id_project' => $data['id_project'],
            'nama_dokumen' => $data['nama_dokumen'],
            'jenis_dokumen' => $data['jenis_dokumen'] ?? null,
            'file_path' => $path,
            'tanggal_upload' => now(),
            'diunggah_oleh' => Auth::id(),
            'keterangan' => $data['keterangan'] ?? null,
        ]);

        return redirect()->route('dokumen-project.index')->with('success', 'Dokumen berhasil diunggah.');
    }

    public function show(DokumenProject $dokumenProject)
    {
        return redirect(Storage::disk('public')->url($dokumenProject->file_path));
    }

    public function download(DokumenProject $dokumenProject)
    {
        $filename = $this->withExtension($dokumenProject->nama_dokumen, $dokumenProject->file_path);

        return Storage::disk('public')->download($dokumenProject->file_path, $filename);
    }

    private function withExtension(string $name, string $path): string
    {
        $ext = pathinfo($path, PATHINFO_EXTENSION);

        if ($ext === '' || str_ends_with(strtolower($name), '.'.strtolower($ext))) {
            return $name;
        }

        return $name.'.'.$ext;
    }

    public function destroy(DokumenProject $dokumenProject)
    {
        Storage::disk('public')->delete($dokumenProject->file_path);
        $dokumenProject->delete();

        return redirect()->route('dokumen-project.index')->with('success', 'Dokumen berhasil dihapus.');
    }
}
