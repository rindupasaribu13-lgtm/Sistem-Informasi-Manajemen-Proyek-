<?php

namespace App\Http\Controllers;

use App\Models\Supervisor;
use App\Models\User;
use Illuminate\Http\Request;

class SupervisorController extends Controller
{
    public function index(Request $request)
    {
        $supervisors = Supervisor::with('user')
            ->when($request->search, fn ($q) => $q->where('nama_supervisor', 'like', "%{$request->search}%"))
            ->orderBy('nama_supervisor')
            ->paginate(10)
            ->withQueryString();

        return view('supervisor.index', compact('supervisors'));
    }

    public function create()
    {
        return view('supervisor.create', ['users' => User::whereHas('role', fn ($q) => $q->where('nama_role', 'Supervisor'))->orderBy('nama')->get()]);
    }

    public function store(Request $request)
    {
        Supervisor::create($this->validated($request));

        return redirect()->route('supervisor.index')->with('success', 'Supervisor berhasil ditambahkan.');
    }

    public function edit(Supervisor $supervisor)
    {
        return view('supervisor.edit', [
            'supervisor' => $supervisor,
            'users' => User::whereHas('role', fn ($q) => $q->where('nama_role', 'Supervisor'))->orderBy('nama')->get(),
        ]);
    }

    public function update(Request $request, Supervisor $supervisor)
    {
        $supervisor->update($this->validated($request));

        return redirect()->route('supervisor.index')->with('success', 'Supervisor berhasil diperbarui.');
    }

    public function destroy(Supervisor $supervisor)
    {
        $supervisor->delete();

        return redirect()->route('supervisor.index')->with('success', 'Supervisor berhasil dihapus.');
    }

    private function validated(Request $request): array
    {
        return $request->validate([
            'id_user' => 'required|exists:user,id_user',
            'nama_supervisor' => 'required|string|max:255',
            'departemen' => 'nullable|string|max:255',
            'no_telepon' => 'nullable|string|max:30',
            'email' => 'nullable|email|max:255',
        ]);
    }
}
