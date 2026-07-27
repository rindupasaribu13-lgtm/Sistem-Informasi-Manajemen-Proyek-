<?php

namespace App\Http\Controllers;

use App\Models\Client;
use App\Models\DokumenProject;
use App\Models\Project;

class DashboardController extends Controller
{
    public function index()
    {
        $projects = Project::with(['client', 'progress'])->latest('id_project')->get();

        $proyekAktif = $projects->where('status', '!=', 'Selesai')->count();
        $totalKlien = Client::count();
        $totalDokumen = DokumenProject::count();

        $averageProgress = $projects->isEmpty()
            ? 0
            : (int) round($projects->map(fn ($p) => optional($p->progress->sortByDesc('tanggal')->first())->persentase ?? 0)->avg());

        $recentProjects = $projects->take(4);

        return view('dashboard.index', compact('proyekAktif', 'totalKlien', 'totalDokumen', 'averageProgress', 'recentProjects'));
    }
}
