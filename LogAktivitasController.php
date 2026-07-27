<?php

namespace App\Http\Controllers;

use App\Models\LogAktivitas;
use Illuminate\Http\Request;

class LogAktivitasController extends Controller
{
    public function index(Request $request)
    {
        $logs = LogAktivitas::with('user')
            ->when($request->search, fn ($q) => $q->where('aktivitas', 'like', "%{$request->search}%"))
            ->latest('tanggal_waktu')
            ->paginate(15)
            ->withQueryString();

        return view('log-aktivitas.index', compact('logs'));
    }
}
