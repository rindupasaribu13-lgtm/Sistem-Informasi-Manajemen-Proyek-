<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function login()
    {
        if (Auth::check()) {
            return redirect('dashboard');
        }

        return view('auth.login');
    }

    public function loginProses(Request $request)
    {
        $credentials = $request->validate([
            'username' => 'required',
            'password' => 'required',
        ]);

        if (!Auth::attempt($credentials, $request->boolean('remember'))) {
            return back()->withInput()->with('error', 'Username atau password salah.');
        }

        if (Auth::user()->status_aktif !== 'aktif') {
            Auth::logout();

            return back()->with('error', 'Akun Anda tidak aktif, silahkan hubungi administrator.');
        }

        $request->session()->regenerate();

        return redirect()->intended('dashboard')->with('success', 'Login berhasil.');
    }

    public function logout(Request $request)
    {
        Auth::logout();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect('login')->with('success', 'Logout berhasil.');
    }
}
