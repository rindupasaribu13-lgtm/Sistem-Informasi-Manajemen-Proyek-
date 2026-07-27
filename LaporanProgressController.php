<?php

namespace App\Http\Controllers;

use App\Models\LaporanProgress;
use App\Models\ProgressProject;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class LaporanProgressController extends Controller
{
    public function create(Request $request)
    {
        $progress = ProgressProject::with('project')->findOrFail($request->progress);

        return view('laporan-progress.create', compact('progress'));
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'id_progress' => 'required|exists:progress_project,id_progress',
            'judul' => 'required|string|max:255',
            'deskripsi' => 'nullable|string',
            'file' => 'required|file|max:20480',
        ]);

        $path = $request->file('file')->store('laporan-progress', 'public');
        $progress = ProgressProject::findOrFail($data['id_progress']);

        LaporanProgress::create([
            'id_progress' => $data['id_progress'],
            'judul' => $data['judul'],
            'deskripsi' => $data['deskripsi'] ?? null,
            'file_path' => $path,
            'tanggal_upload' => now(),
            'dibuat_oleh' => Auth::id(),
        ]);

        return redirect()->route('progress-project.show', $progress->id_project)->with('success', 'Laporan progress berhasil ditambahkan.');
    }

    public function destroy(LaporanProgress $laporanProgress)
    {
        $idProject = $laporanProgress->progress->id_project;
        Storage::disk('public')->delete($laporanProgress->file_path);
        $laporanProgress->delete();

        return redirect()->route('progress-project.show', $idProject)->with('success', 'Laporan progress berhasil dihapus.');
    }
}
