<?php

namespace App\Http\Controllers;

use App\Models\Project;
use App\Models\ProjectTeam;
use Illuminate\Http\Request;

class ProjectTeamController extends Controller
{
    public function store(Request $request, Project $project)
    {
        $data = $request->validate([
            'id_user' => 'required|exists:user,id_user',
            'jabatan' => 'nullable|string|max:255',
            'peran' => 'nullable|string|max:255',
            'tanggal_mulai' => 'nullable|date',
            'tanggal_selesai' => 'nullable|date',
        ]);

        $data['id_project'] = $project->id_project;

        ProjectTeam::create($data);

        return back()->with('success', 'Anggota tim berhasil ditambahkan.');
    }

    public function destroy(Project $project, ProjectTeam $team)
    {
        $team->delete();

        return back()->with('success', 'Anggota tim berhasil dihapus.');
    }
}
