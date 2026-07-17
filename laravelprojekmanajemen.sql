-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Jul 2026 pada 07.10
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravelprojekmanajemen`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `client`
--

CREATE TABLE `client` (
  `id_client` bigint(20) UNSIGNED NOT NULL,
  `nama_client` varchar(255) NOT NULL,
  `alamat` text DEFAULT NULL,
  `no_telepon` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `kontak_person` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `client`
--

INSERT INTO `client` (`id_client`, `nama_client`, `alamat`, `no_telepon`, `email`, `kontak_person`, `created_at`, `updated_at`) VALUES
(1, 'PT. Maju Jaya', 'Jl. Industri No. 10, Batam', '0812-3456-7890', 'info@majujaya.co.id', 'Rudi Hartono', '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(2, 'PT. Sejahtera Abadi', 'Jl. Sudirman No. 25, Batam', '0813-4567-8901', 'admin@sejahteraabadi.co.id', 'Siti Aminah', '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(3, 'PT. Energi Mandiri', 'Jl. Ahmad Yani No. 88, Batam', '0811-2233-4455', 'contact@energimandiri.co.id', 'Hendra Wijaya', '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(4, 'PT. Bangun Persada', 'Jl. Diponegoro No. 5, Batam', '0814-5566-7788', 'info@bangunpersada.co.id', 'Dewi Kartika', '2026-07-13 11:37:06', '2026-07-13 11:37:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokumen_project`
--

CREATE TABLE `dokumen_project` (
  `id_dokumen` bigint(20) UNSIGNED NOT NULL,
  `id_project` bigint(20) UNSIGNED NOT NULL,
  `nama_dokumen` varchar(255) NOT NULL,
  `jenis_dokumen` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `tanggal_upload` timestamp NOT NULL DEFAULT current_timestamp(),
  `diunggah_oleh` bigint(20) UNSIGNED NOT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `dokumen_project`
--

INSERT INTO `dokumen_project` (`id_dokumen`, `id_project`, `nama_dokumen`, `jenis_dokumen`, `file_path`, `tanggal_upload`, `diunggah_oleh`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 1, 'Rencana Kerja Proyek (RKP).pdf', 'Perencanaan', 'dokumen-project/seed-1-0.pdf', '2026-07-03 11:37:06', 2, NULL, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(2, 1, 'Gambar Desain Arsitektur.dwg', 'Desain', 'dokumen-project/seed-1-1.dwg', '2026-07-04 11:37:06', 3, NULL, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(3, 1, 'Laporan Progress Mingguan.xlsx', 'Laporan', 'dokumen-project/seed-1-2.xlsx', '2026-07-05 11:37:06', 1, NULL, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(4, 2, 'Rencana Kerja Proyek (RKP).pdf', 'Perencanaan', 'dokumen-project/seed-2-0.pdf', '2026-07-03 11:37:06', 2, NULL, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(5, 2, 'Gambar Desain Arsitektur.dwg', 'Desain', 'dokumen-project/seed-2-1.dwg', '2026-07-04 11:37:06', 3, NULL, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(6, 2, 'Laporan Progress Mingguan.xlsx', 'Laporan', 'dokumen-project/seed-2-2.xlsx', '2026-07-05 11:37:06', 1, NULL, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(7, 3, 'Rencana Kerja Proyek (RKP).pdf', 'Perencanaan', 'dokumen-project/seed-3-0.pdf', '2026-07-03 11:37:06', 2, NULL, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(8, 3, 'Gambar Desain Arsitektur.dwg', 'Desain', 'dokumen-project/seed-3-1.dwg', '2026-07-04 11:37:06', 3, NULL, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(9, 3, 'Laporan Progress Mingguan.xlsx', 'Laporan', 'dokumen-project/seed-3-2.xlsx', '2026-07-05 11:37:06', 1, NULL, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(10, 4, 'Rencana Kerja Proyek (RKP).pdf', 'Perencanaan', 'dokumen-project/seed-4-0.pdf', '2026-07-03 11:37:06', 2, NULL, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(11, 4, 'Gambar Desain Arsitektur.dwg', 'Desain', 'dokumen-project/seed-4-1.dwg', '2026-07-04 11:37:06', 3, NULL, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(12, 4, 'Laporan Progress Mingguan.xlsx', 'Laporan', 'dokumen-project/seed-4-2.xlsx', '2026-07-05 11:37:06', 1, NULL, '2026-07-13 11:37:06', '2026-07-13 11:37:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `invoice`
--

CREATE TABLE `invoice` (
  `id_invoice` bigint(20) UNSIGNED NOT NULL,
  `id_project` bigint(20) UNSIGNED NOT NULL,
  `nomor_invoice` varchar(255) NOT NULL,
  `tanggal_invoice` date NOT NULL,
  `nilai_invoice` decimal(18,2) NOT NULL DEFAULT 0.00,
  `ppn` decimal(18,2) NOT NULL DEFAULT 0.00,
  `total` decimal(18,2) NOT NULL DEFAULT 0.00,
  `status` varchar(255) NOT NULL DEFAULT 'Belum Dibayar',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `invoice`
--

INSERT INTO `invoice` (`id_invoice`, `id_project`, `nomor_invoice`, `tanggal_invoice`, `nilai_invoice`, `ppn`, `total`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'INV-2025-001', '2026-06-23', 250000000.00, 27500000.00, 277500000.00, 'Lunas', '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(2, 2, 'INV-2025-002', '2026-06-23', 325000000.00, 35750000.00, 360750000.00, 'Belum Dibayar', '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(3, 3, 'INV-2025-003', '2026-06-23', 400000000.00, 44000000.00, 444000000.00, 'Belum Dibayar', '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(4, 4, 'INV-2025-004', '2026-06-23', 475000000.00, 52250000.00, 527250000.00, 'Belum Dibayar', '2026-07-13 11:37:06', '2026-07-13 11:37:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan_progress`
--

CREATE TABLE `laporan_progress` (
  `id_laporan` bigint(20) UNSIGNED NOT NULL,
  `id_progress` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `tanggal_upload` timestamp NOT NULL DEFAULT current_timestamp(),
  `dibuat_oleh` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `laporan_progress`
--

INSERT INTO `laporan_progress` (`id_laporan`, `id_progress`, `judul`, `deskripsi`, `file_path`, `tanggal_upload`, `dibuat_oleh`, `created_at`, `updated_at`) VALUES
(1, 3, 'Laporan Progress Mingguan', 'Laporan progress terbaru proyek.', 'laporan-progress/seed-laporan-1.txt', '2026-06-11 17:00:00', 2, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(2, 5, 'Laporan Progress Mingguan', 'Laporan progress terbaru proyek.', 'laporan-progress/seed-laporan-2.txt', '2026-05-27 17:00:00', 3, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(3, 9, 'Laporan Progress Mingguan', 'Laporan progress terbaru proyek.', 'laporan-progress/seed-laporan-3.txt', '2026-06-26 17:00:00', 2, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(4, 10, 'Laporan Progress Mingguan', 'Laporan progress terbaru proyek.', 'laporan-progress/seed-laporan-4.txt', '2026-05-12 17:00:00', 3, '2026-07-13 11:37:06', '2026-07-13 11:37:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_aktivitas`
--

CREATE TABLE `log_aktivitas` (
  `id_log` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `aktivitas` varchar(255) NOT NULL,
  `tabel_terkait` varchar(255) DEFAULT NULL,
  `id_referensi` bigint(20) UNSIGNED DEFAULT NULL,
  `tanggal_waktu` timestamp NOT NULL DEFAULT current_timestamp(),
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_01_01_000001_create_client_table', 1),
(5, '2025_01_01_000002_create_rfq_table', 1),
(6, '2025_01_01_000003_create_quotation_table', 1),
(7, '2025_01_01_000004_create_purchase_order_table', 1),
(8, '2025_01_01_000005_create_supervisor_table', 1),
(9, '2025_01_01_000006_create_project_table', 1),
(10, '2025_01_01_000007_create_project_team_table', 1),
(11, '2025_01_01_000008_create_progress_project_table', 1),
(12, '2025_01_01_000009_create_laporan_progress_table', 1),
(13, '2025_01_01_000010_create_dokumen_project_table', 1),
(14, '2025_01_01_000011_create_invoice_table', 1),
(15, '2025_01_01_000012_create_pembayaran_table', 1),
(16, '2025_01_01_000013_create_log_aktivitas_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` bigint(20) UNSIGNED NOT NULL,
  `id_invoice` bigint(20) UNSIGNED NOT NULL,
  `tanggal_bayar` date NOT NULL,
  `jumlah_bayar` decimal(18,2) NOT NULL DEFAULT 0.00,
  `metode_pembayaran` varchar(255) DEFAULT NULL,
  `no_referensi` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Terkonfirmasi',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_invoice`, `tanggal_bayar`, `jumlah_bayar`, `metode_pembayaran`, `no_referensi`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '2026-07-03', 277500000.00, 'Transfer Bank', 'TRF-000123', 'Terkonfirmasi', '2026-07-13 11:37:06', '2026-07-13 11:37:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `progress_project`
--

CREATE TABLE `progress_project` (
  `id_progress` bigint(20) UNSIGNED NOT NULL,
  `id_project` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `persentase` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `keterangan` text DEFAULT NULL,
  `dibuat_oleh` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `progress_project`
--

INSERT INTO `progress_project` (`id_progress`, `id_project`, `tanggal`, `persentase`, `keterangan`, `dibuat_oleh`, `created_at`, `updated_at`) VALUES
(1, 1, '2026-05-13', 20, 'Progress pekerjaan mencapai 20%.', 2, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(2, 1, '2026-05-28', 40, 'Progress pekerjaan mencapai 40%.', 2, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(3, 1, '2026-06-12', 60, 'Progress pekerjaan mencapai 60%.', 2, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(4, 2, '2026-05-13', 20, 'Progress pekerjaan mencapai 20%.', 3, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(5, 2, '2026-05-28', 40, 'Progress pekerjaan mencapai 40%.', 3, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(6, 3, '2026-05-13', 20, 'Progress pekerjaan mencapai 20%.', 2, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(7, 3, '2026-05-28', 40, 'Progress pekerjaan mencapai 40%.', 2, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(8, 3, '2026-06-12', 60, 'Progress pekerjaan mencapai 60%.', 2, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(9, 3, '2026-06-27', 90, 'Progress pekerjaan mencapai 90%.', 2, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(10, 4, '2026-05-13', 20, 'Progress pekerjaan mencapai 20%.', 3, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(11, 4, '2026-05-28', 40, 'Progress pekerjaan mencapai 40%.', 3, '2026-07-13 11:37:06', '2026-07-13 11:37:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `project`
--

CREATE TABLE `project` (
  `id_project` bigint(20) UNSIGNED NOT NULL,
  `id_client` bigint(20) UNSIGNED NOT NULL,
  `id_pm` bigint(20) UNSIGNED NOT NULL,
  `id_po` bigint(20) UNSIGNED DEFAULT NULL,
  `id_supervisor` bigint(20) UNSIGNED DEFAULT NULL,
  `nomor_project` varchar(255) NOT NULL,
  `nama_project` varchar(255) NOT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai_plan` date DEFAULT NULL,
  `nilai_kontrak` decimal(18,2) NOT NULL DEFAULT 0.00,
  `status` varchar(255) NOT NULL DEFAULT 'Perencanaan',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `project`
--

INSERT INTO `project` (`id_project`, `id_client`, `id_pm`, `id_po`, `id_supervisor`, `nomor_project`, `nama_project`, `lokasi`, `deskripsi`, `tanggal_mulai`, `tanggal_selesai_plan`, `nilai_kontrak`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 1, 'PRJ-2025-001', 'Proyek Pembangunan Pabrik XYZ', 'Batam', 'Deskripsi singkat untuk Proyek Pembangunan Pabrik XYZ.', '2026-05-13', '2026-10-13', 500000000.00, 'Berjalan', '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(2, 2, 2, 2, 1, 'PRJ-2025-002', 'Proyek Instalasi Pipa ABC', 'Batam', 'Deskripsi singkat untuk Proyek Instalasi Pipa ABC.', '2026-05-13', '2026-10-13', 650000000.00, 'Berjalan', '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(3, 3, 2, 3, 1, 'PRJ-2025-003', 'Proyek Revamping Sistem DEF', 'Batam', 'Deskripsi singkat untuk Proyek Revamping Sistem DEF.', '2026-05-13', '2026-10-13', 800000000.00, 'Hampir Selesai', '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(4, 4, 2, 4, 1, 'PRJ-2025-004', 'Proyek Konstruksi Gedung GHI', 'Batam', 'Deskripsi singkat untuk Proyek Konstruksi Gedung GHI.', '2026-05-13', '2026-10-13', 950000000.00, 'Berjalan', '2026-07-13 11:37:06', '2026-07-13 11:37:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `project_team`
--

CREATE TABLE `project_team` (
  `id_team` bigint(20) UNSIGNED NOT NULL,
  `id_project` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `peran` varchar(255) DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `project_team`
--

INSERT INTO `project_team` (`id_team`, `id_project`, `id_user`, `jabatan`, `peran`, `tanggal_mulai`, `tanggal_selesai`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Project Manager', 'Penanggung Jawab', '2026-05-13', NULL, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(2, 1, 3, 'Supervisor', 'Pengawas Lapangan', '2026-05-13', NULL, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(3, 2, 2, 'Project Manager', 'Penanggung Jawab', '2026-05-13', NULL, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(4, 2, 3, 'Supervisor', 'Pengawas Lapangan', '2026-05-13', NULL, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(5, 3, 2, 'Project Manager', 'Penanggung Jawab', '2026-05-13', NULL, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(6, 3, 3, 'Supervisor', 'Pengawas Lapangan', '2026-05-13', NULL, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(7, 4, 2, 'Project Manager', 'Penanggung Jawab', '2026-05-13', NULL, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(8, 4, 3, 'Supervisor', 'Pengawas Lapangan', '2026-05-13', NULL, '2026-07-13 11:37:06', '2026-07-13 11:37:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchase_order`
--

CREATE TABLE `purchase_order` (
  `id_po` bigint(20) UNSIGNED NOT NULL,
  `id_quotation` bigint(20) UNSIGNED NOT NULL,
  `nomor_po` varchar(255) NOT NULL,
  `tanggal_po` date NOT NULL,
  `nilai_po` decimal(18,2) NOT NULL DEFAULT 0.00,
  `status` varchar(255) NOT NULL DEFAULT 'Diterima',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `purchase_order`
--

INSERT INTO `purchase_order` (`id_po`, `id_quotation`, `nomor_po`, `tanggal_po`, `nilai_po`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'PO-2025-001', '2026-04-13', 500000000.00, 'Diterima', '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(2, 2, 'PO-2025-002', '2026-04-13', 650000000.00, 'Diterima', '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(3, 3, 'PO-2025-003', '2026-04-13', 800000000.00, 'Diterima', '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(4, 4, 'PO-2025-004', '2026-04-13', 950000000.00, 'Diterima', '2026-07-13 11:37:06', '2026-07-13 11:37:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `quotation`
--

CREATE TABLE `quotation` (
  `id_quotation` bigint(20) UNSIGNED NOT NULL,
  `id_rfq` bigint(20) UNSIGNED NOT NULL,
  `nomor_quotation` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `valid_sampai` date DEFAULT NULL,
  `total_nilai` decimal(18,2) NOT NULL DEFAULT 0.00,
  `status` varchar(255) NOT NULL DEFAULT 'Draft',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `quotation`
--

INSERT INTO `quotation` (`id_quotation`, `id_rfq`, `nomor_quotation`, `tanggal`, `valid_sampai`, `total_nilai`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'QUO-2025-001', '2026-03-24', '2026-05-13', 500000000.00, 'Disetujui', '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(2, 2, 'QUO-2025-002', '2026-03-24', '2026-05-13', 650000000.00, 'Disetujui', '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(3, 3, 'QUO-2025-003', '2026-03-24', '2026-05-13', 800000000.00, 'Disetujui', '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(4, 4, 'QUO-2025-004', '2026-03-24', '2026-05-13', 950000000.00, 'Disetujui', '2026-07-13 11:37:06', '2026-07-13 11:37:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rfq`
--

CREATE TABLE `rfq` (
  `id_rfq` bigint(20) UNSIGNED NOT NULL,
  `id_client` bigint(20) UNSIGNED NOT NULL,
  `nomor_rfq` varchar(255) NOT NULL,
  `tanggal_rfq` date NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Baru',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `rfq`
--

INSERT INTO `rfq` (`id_rfq`, `id_client`, `nomor_rfq`, `tanggal_rfq`, `deskripsi`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'RFQ-2025-001', '2026-03-13', 'Permintaan penawaran untuk Proyek Pembangunan Pabrik XYZ', 'Selesai', '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(2, 2, 'RFQ-2025-002', '2026-03-13', 'Permintaan penawaran untuk Proyek Instalasi Pipa ABC', 'Selesai', '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(3, 3, 'RFQ-2025-003', '2026-03-13', 'Permintaan penawaran untuk Proyek Revamping Sistem DEF', 'Selesai', '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(4, 4, 'RFQ-2025-004', '2026-03-13', 'Permintaan penawaran untuk Proyek Konstruksi Gedung GHI', 'Selesai', '2026-07-13 11:37:06', '2026-07-13 11:37:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id_role` bigint(20) UNSIGNED NOT NULL,
  `nama_role` varchar(255) NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`id_role`, `nama_role`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'Akses penuh ke seluruh sistem.', '2026-07-13 11:37:05', '2026-07-13 11:37:05'),
(2, 'Project Manager', 'Mengelola proyek, dokumen, progress, dan laporan.', '2026-07-13 11:37:05', '2026-07-13 11:37:05'),
(3, 'Supervisor', 'Memantau dan melaporkan progress proyek di lapangan.', '2026-07-13 11:37:05', '2026-07-13 11:37:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('lNTqzAsKBzoq2uf3i6lUfcws1itexgCn2etNbPgs', 1, '127.0.0.1', 'curl/8.21.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiY3A3d3d4b0VCUnRIaGxvUDNDdjhOS1A0WXJJa2JXME02NmNJZ2VKQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9sYXBvcmFuIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1783998830),
('mmIVQ0vGGHzYEn9Kp7vSRAW8D27O3a5RkzhMoeqa', 1, '127.0.0.1', 'curl/8.21.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVFJ5ejRPT1VkN1hjbkNmT2VWSnNCRnVIbE55SEdMb3VYSUhEWG5sRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9wcm9qZWN0LzEvZWRpdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjE6e2k6MDtzOjc6InN1Y2Nlc3MiO31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo3OiJzdWNjZXNzIjtzOjI3OiJQcm95ZWsgYmVyaGFzaWwgZGlwZXJiYXJ1aS4iO30=', 1784003660),
('NOhH4Uahxy06syPBvosPzsKQzQiDjYQHiAtcIQqy', NULL, '127.0.0.1', 'curl/8.21.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMW43ZDRBRnNLd25SMnE1U1BRdTJhUEdDVGNVMmVrU3pLMHpPV0JZRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784003068),
('q7vQGzDZNrr7xDywdINZt53ZDIqZr53HE55hW63N', NULL, '127.0.0.1', 'curl/8.21.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFV2Ulc0bUZyUjZ1ZENLSUlDTFhaTzdPSFVjVktuWnVTcWpOSGFHbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1783998476),
('shaHyb14AsKEDTChIvgU9XpiS6fOtkFJmNDiqrDZ', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOTVNMmw2TnBNTEgxRFpHNnI3OFVYNVpEOFM5SXdpRjRiMENHSmNDdyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9wcm9qZWN0Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1784003333);

-- --------------------------------------------------------

--
-- Struktur dari tabel `supervisor`
--

CREATE TABLE `supervisor` (
  `id_supervisor` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `nama_supervisor` varchar(255) NOT NULL,
  `departemen` varchar(255) DEFAULT NULL,
  `no_telepon` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `supervisor`
--

INSERT INTO `supervisor` (`id_supervisor`, `id_user`, `nama_supervisor`, `departemen`, `no_telepon`, `email`, `created_at`, `updated_at`) VALUES
(1, 3, 'Budi Santoso', 'Konstruksi', '081200000003', 'budi@mail.com', '2026-07-13 11:37:06', '2026-07-13 11:37:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_role` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `no_telepon` varchar(255) DEFAULT NULL,
  `status_aktif` enum('aktif','nonaktif') NOT NULL DEFAULT 'aktif',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `id_role`, `nama`, `username`, `password`, `email`, `no_telepon`, `status_aktif`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Cindy Lestari', 'cindy.lestari', '$2y$12$/xKo8nGh7vq0pfA133vxvOkwieWVy39lp4TFWQcm/TT09ucxAHlem', 'cindy@mail.com', '081200000001', 'aktif', NULL, '2026-07-13 11:37:05', '2026-07-13 11:37:05'),
(2, 2, 'Andi Pratama', 'andi.pratama', '$2y$12$DVq3nkqNXi5zCds6BF3S3Orow7wW8.mZiNQnu/KEp0/oQ2oXQTYCO', 'andi@mail.com', '081200000002', 'aktif', NULL, '2026-07-13 11:37:06', '2026-07-13 11:37:06'),
(3, 3, 'Budi Santoso', 'budi.santoso', '$2y$12$AMtvHvRanpAGPwYrC4OxZ.qJAO.OB4bPZaKhlP8rTjds4Umvg2Yom', 'budi@mail.com', '081200000003', 'aktif', NULL, '2026-07-13 11:37:06', '2026-07-13 11:37:06');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Indeks untuk tabel `dokumen_project`
--
ALTER TABLE `dokumen_project`
  ADD PRIMARY KEY (`id_dokumen`),
  ADD KEY `dokumen_project_id_project_foreign` (`id_project`),
  ADD KEY `dokumen_project_diunggah_oleh_foreign` (`diunggah_oleh`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id_invoice`),
  ADD UNIQUE KEY `invoice_nomor_invoice_unique` (`nomor_invoice`),
  ADD KEY `invoice_id_project_foreign` (`id_project`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `laporan_progress`
--
ALTER TABLE `laporan_progress`
  ADD PRIMARY KEY (`id_laporan`),
  ADD KEY `laporan_progress_id_progress_foreign` (`id_progress`),
  ADD KEY `laporan_progress_dibuat_oleh_foreign` (`dibuat_oleh`);

--
-- Indeks untuk tabel `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `log_aktivitas_id_user_foreign` (`id_user`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `pembayaran_id_invoice_foreign` (`id_invoice`);

--
-- Indeks untuk tabel `progress_project`
--
ALTER TABLE `progress_project`
  ADD PRIMARY KEY (`id_progress`),
  ADD KEY `progress_project_id_project_foreign` (`id_project`),
  ADD KEY `progress_project_dibuat_oleh_foreign` (`dibuat_oleh`);

--
-- Indeks untuk tabel `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id_project`),
  ADD UNIQUE KEY `project_nomor_project_unique` (`nomor_project`),
  ADD KEY `project_id_client_foreign` (`id_client`),
  ADD KEY `project_id_pm_foreign` (`id_pm`),
  ADD KEY `project_id_po_foreign` (`id_po`),
  ADD KEY `project_id_supervisor_foreign` (`id_supervisor`);

--
-- Indeks untuk tabel `project_team`
--
ALTER TABLE `project_team`
  ADD PRIMARY KEY (`id_team`),
  ADD KEY `project_team_id_project_foreign` (`id_project`),
  ADD KEY `project_team_id_user_foreign` (`id_user`);

--
-- Indeks untuk tabel `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD PRIMARY KEY (`id_po`),
  ADD UNIQUE KEY `purchase_order_nomor_po_unique` (`nomor_po`),
  ADD KEY `purchase_order_id_quotation_foreign` (`id_quotation`);

--
-- Indeks untuk tabel `quotation`
--
ALTER TABLE `quotation`
  ADD PRIMARY KEY (`id_quotation`),
  ADD UNIQUE KEY `quotation_nomor_quotation_unique` (`nomor_quotation`),
  ADD KEY `quotation_id_rfq_foreign` (`id_rfq`);

--
-- Indeks untuk tabel `rfq`
--
ALTER TABLE `rfq`
  ADD PRIMARY KEY (`id_rfq`),
  ADD UNIQUE KEY `rfq_nomor_rfq_unique` (`nomor_rfq`),
  ADD KEY `rfq_id_client_foreign` (`id_client`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `supervisor`
--
ALTER TABLE `supervisor`
  ADD PRIMARY KEY (`id_supervisor`),
  ADD KEY `supervisor_id_user_foreign` (`id_user`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `user_username_unique` (`username`),
  ADD UNIQUE KEY `user_email_unique` (`email`),
  ADD KEY `user_id_role_foreign` (`id_role`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `client`
--
ALTER TABLE `client`
  MODIFY `id_client` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `dokumen_project`
--
ALTER TABLE `dokumen_project`
  MODIFY `id_dokumen` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id_invoice` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `laporan_progress`
--
ALTER TABLE `laporan_progress`
  MODIFY `id_laporan` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  MODIFY `id_log` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `progress_project`
--
ALTER TABLE `progress_project`
  MODIFY `id_progress` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `project`
--
ALTER TABLE `project`
  MODIFY `id_project` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `project_team`
--
ALTER TABLE `project_team`
  MODIFY `id_team` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `purchase_order`
--
ALTER TABLE `purchase_order`
  MODIFY `id_po` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `quotation`
--
ALTER TABLE `quotation`
  MODIFY `id_quotation` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `rfq`
--
ALTER TABLE `rfq`
  MODIFY `id_rfq` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id_role` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `supervisor`
--
ALTER TABLE `supervisor`
  MODIFY `id_supervisor` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `dokumen_project`
--
ALTER TABLE `dokumen_project`
  ADD CONSTRAINT `dokumen_project_diunggah_oleh_foreign` FOREIGN KEY (`diunggah_oleh`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `dokumen_project_id_project_foreign` FOREIGN KEY (`id_project`) REFERENCES `project` (`id_project`);

--
-- Ketidakleluasaan untuk tabel `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_id_project_foreign` FOREIGN KEY (`id_project`) REFERENCES `project` (`id_project`);

--
-- Ketidakleluasaan untuk tabel `laporan_progress`
--
ALTER TABLE `laporan_progress`
  ADD CONSTRAINT `laporan_progress_dibuat_oleh_foreign` FOREIGN KEY (`dibuat_oleh`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `laporan_progress_id_progress_foreign` FOREIGN KEY (`id_progress`) REFERENCES `progress_project` (`id_progress`);

--
-- Ketidakleluasaan untuk tabel `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  ADD CONSTRAINT `log_aktivitas_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_id_invoice_foreign` FOREIGN KEY (`id_invoice`) REFERENCES `invoice` (`id_invoice`);

--
-- Ketidakleluasaan untuk tabel `progress_project`
--
ALTER TABLE `progress_project`
  ADD CONSTRAINT `progress_project_dibuat_oleh_foreign` FOREIGN KEY (`dibuat_oleh`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `progress_project_id_project_foreign` FOREIGN KEY (`id_project`) REFERENCES `project` (`id_project`);

--
-- Ketidakleluasaan untuk tabel `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_id_client_foreign` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `project_id_pm_foreign` FOREIGN KEY (`id_pm`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `project_id_po_foreign` FOREIGN KEY (`id_po`) REFERENCES `purchase_order` (`id_po`),
  ADD CONSTRAINT `project_id_supervisor_foreign` FOREIGN KEY (`id_supervisor`) REFERENCES `supervisor` (`id_supervisor`);

--
-- Ketidakleluasaan untuk tabel `project_team`
--
ALTER TABLE `project_team`
  ADD CONSTRAINT `project_team_id_project_foreign` FOREIGN KEY (`id_project`) REFERENCES `project` (`id_project`),
  ADD CONSTRAINT `project_team_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD CONSTRAINT `purchase_order_id_quotation_foreign` FOREIGN KEY (`id_quotation`) REFERENCES `quotation` (`id_quotation`);

--
-- Ketidakleluasaan untuk tabel `quotation`
--
ALTER TABLE `quotation`
  ADD CONSTRAINT `quotation_id_rfq_foreign` FOREIGN KEY (`id_rfq`) REFERENCES `rfq` (`id_rfq`);

--
-- Ketidakleluasaan untuk tabel `rfq`
--
ALTER TABLE `rfq`
  ADD CONSTRAINT `rfq_id_client_foreign` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Ketidakleluasaan untuk tabel `supervisor`
--
ALTER TABLE `supervisor`
  ADD CONSTRAINT `supervisor_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_id_role_foreign` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
