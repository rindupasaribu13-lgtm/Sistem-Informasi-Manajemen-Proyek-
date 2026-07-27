<?php

namespace App\Http\Controllers;

use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function index(Request $request)
    {
        $users = User::with('role')
            ->when($request->search, fn ($q) => $q->where('nama', 'like', "%{$request->search}%"))
            ->orderBy('nama')
            ->paginate(10)
            ->withQueryString();

        return view('user.index', compact('users'));
    }

    public function create()
    {
        return view('user.create', ['roles' => Role::orderBy('nama_role')->get()]);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'id_role' => 'required|exists:role,id_role',
            'nama' => 'required|string|max:255',
            'username' => 'required|string|max:255|unique:user,username',
            'email' => 'required|email|max:255|unique:user,email',
            'no_telepon' => 'nullable|string|max:30',
            'password' => 'required|string|min:6',
            'status_aktif' => 'required|in:aktif,nonaktif',
        ]);

        $data['password'] = Hash::make($data['password']);

        User::create($data);

        return redirect()->route('user.index')->with('success', 'User berhasil ditambahkan.');
    }

    public function edit(User $user)
    {
        return view('user.edit', ['user' => $user, 'roles' => Role::orderBy('nama_role')->get()]);
    }

    public function update(Request $request, User $user)
    {
        $data = $request->validate([
            'id_role' => 'required|exists:role,id_role',
            'nama' => 'required|string|max:255',
            'username' => 'required|string|max:255|unique:user,username,'.$user->id_user.',id_user',
            'email' => 'required|email|max:255|unique:user,email,'.$user->id_user.',id_user',
            'no_telepon' => 'nullable|string|max:30',
            'password' => 'nullable|string|min:6',
            'status_aktif' => 'required|in:aktif,nonaktif',
        ]);

        if (!empty($data['password'])) {
            $data['password'] = Hash::make($data['password']);
        } else {
            unset($data['password']);
        }

        $user->update($data);

        return redirect()->route('user.index')->with('success', 'User berhasil diperbarui.');
    }

    public function destroy(User $user)
    {
        if ($user->id_user === auth()->id()) {
            return back()->with('error', 'Anda tidak dapat menghapus akun Anda sendiri.');
        }

        $user->delete();

        return redirect()->route('user.index')->with('success', 'User berhasil dihapus.');
    }
}
