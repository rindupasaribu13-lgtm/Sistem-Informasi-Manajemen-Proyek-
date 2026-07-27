<?php

namespace App\Http\Controllers;

use App\Models\Client;
use Illuminate\Http\Request;

class ClientController extends Controller
{
    public function index(Request $request)
    {
        $clients = Client::query()
            ->when($request->search, fn ($q) => $q->where('nama_client', 'like', "%{$request->search}%"))
            ->orderBy('nama_client')
            ->paginate(10)
            ->withQueryString();

        return view('client.index', compact('clients'));
    }

    public function create()
    {
        return view('client.create');
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'nama_client' => 'required|string|max:255',
            'alamat' => 'nullable|string',
            'no_telepon' => 'nullable|string|max:30',
            'email' => 'nullable|email|max:255',
            'kontak_person' => 'nullable|string|max:255',
        ]);

        Client::create($data);

        return redirect()->route('client.index')->with('success', 'Klien berhasil ditambahkan.');
    }

    public function edit(Client $client)
    {
        return view('client.edit', compact('client'));
    }

    public function update(Request $request, Client $client)
    {
        $data = $request->validate([
            'nama_client' => 'required|string|max:255',
            'alamat' => 'nullable|string',
            'no_telepon' => 'nullable|string|max:30',
            'email' => 'nullable|email|max:255',
            'kontak_person' => 'nullable|string|max:255',
        ]);

        $client->update($data);

        return redirect()->route('client.index')->with('success', 'Klien berhasil diperbarui.');
    }

    public function destroy(Client $client)
    {
        $client->delete();

        return redirect()->route('client.index')->with('success', 'Klien berhasil dihapus.');
    }
}
