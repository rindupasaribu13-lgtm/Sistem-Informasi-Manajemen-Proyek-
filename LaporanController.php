<?php

namespace App\Http\Controllers;

use App\Mail\LaporanShared;
use App\Models\LaporanProgress;
use App\Models\Project;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Storage;

class LaporanController extends Controller
{
    public function index(Request $request)
    {
        $laporan = $this->filtered($request)->paginate(10)->withQueryString();

        return view('laporan.index', [
            'laporan' => $laporan,
            'projects' => Project::orderBy('nama_project')->get(),
        ]);
    }

    public function export(Request $request)
    {
        $laporan = $this->filtered($request)->get();

        $pdf = Pdf::loadView('laporan.pdf', compact('laporan'))->setPaper('a4', 'landscape');

        return $pdf->download('laporan-progress-'.now()->format('Ymd-His').'.pdf');
    }

    public function share(Request $request)
    {
        $data = $request->validate([
            'email' => 'required|email',
        ]);

        $laporan = $this->filtered($request)->get();

        $pdf = Pdf::loadView('laporan.pdf', compact('laporan'))->setPaper('a4', 'landscape');
        $fileName = 'laporan-progress-'.now()->format('Ymd-His').'.pdf';

        Mail::to($data['email'])->send(new LaporanShared($pdf->output(), $fileName, Auth::user()->nama));

        return redirect()->route('laporan.index', $request->query())
            ->with('success', 'Laporan berhasil dikirim ke '.$data['email'].'.');
    }

    public function download(LaporanProgress $laporanProgress)
    {
        $filename = $this->withExtension($laporanProgress->judul, $laporanProgress->file_path);

        return Storage::disk('public')->download($laporanProgress->file_path, $filename);
    }

    private function withExtension(string $name, string $path): string
    {
        $ext = pathinfo($path, PATHINFO_EXTENSION);

        if ($ext === '' || str_ends_with(strtolower($name), '.'.strtolower($ext))) {
            return $name;
        }

        return $name.'.'.$ext;
    }

    private function filtered(Request $request)
    {
        return LaporanProgress::with(['progress.project', 'creator'])
            ->when($request->search, fn ($q) => $q->where('judul', 'like', "%{$request->search}%"))
            ->when($request->project, fn ($q) => $q->whereHas('progress', fn ($p) => $p->where('id_project', $request->project)))
            ->when($request->from, fn ($q) => $q->whereDate('tanggal_upload', '>=', $request->from))
            ->when($request->to, fn ($q) => $q->whereDate('tanggal_upload', '<=', $request->to))
            ->latest('tanggal_upload');
    }
}
