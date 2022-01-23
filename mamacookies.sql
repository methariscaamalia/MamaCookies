-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Bulan Mei 2021 pada 05.24
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokoteratai`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'teratai', 'admin123', 'Admin Teratai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ongkir`
--

CREATE TABLE `ongkir` (
  `id_ongkir` int(5) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `nama_kota`, `tarif`) VALUES
(1, 'Palembang', 50000),
(2, 'Bengkulu', 60000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `pass_pelanggan` varchar(100) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `telepon_pelanggan` varchar(25) NOT NULL,
  `alamat_pelanggan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `pass_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`) VALUES
(1, 'pelanggan@gmail.com', 'pelanggan', 'pelanggan', '085314554220', ''),
(2, 'metha@gmail.com', 'metha', 'Metha Risca Amalia', '085314554220', ''),
(5, 'anggara@gmail.com', '12345', 'Anggara Putra Pradana Apriansyah', '0895604876459', '																																																												jalan salak 2 pagar alam																																																																						');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `bank` varchar(100) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `bank`, `jumlah`, `tanggal`, `bukti`) VALUES
(2, 18, 'Metha', 'BNI', 200000, '2021-05-25', '20210525074504bakteri.png'),
(3, 20, 'Anggara Putra Pradana Apriansyah', 'Mandiri', 550000, '2021-05-25', '20210525111829kambing.JPG');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_ongkir` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `status_pembelian` varchar(100) NOT NULL DEFAULT 'pending',
  `resi_pengiriman` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `id_ongkir`, `tanggal_pembelian`, `total_pembelian`, `nama_kota`, `tarif`, `alamat_pengiriman`, `status_pembelian`, `resi_pengiriman`) VALUES
(1, 2, 1, '2021-04-24', 100000, '', 0, '', 'pending', ''),
(2, 2, 1, '2021-04-24', 100000, '', 0, '', 'pending', ''),
(5, 2, 1, '2021-05-17', 2100000, '', 0, '', 'pending', ''),
(11, 2, 1, '2021-05-17', 4100000, '', 0, '', 'pending', ''),
(12, 2, 2, '2021-05-17', 4110000, '', 0, '', 'pending', ''),
(13, 2, 1, '2021-05-17', 4100000, '', 0, '', 'pending', ''),
(14, 2, 1, '2021-05-17', 4100000, '', 0, '', 'pending', ''),
(15, 2, 2, '2021-05-17', 4110000, '', 0, '', 'pending', ''),
(16, 2, 1, '2021-05-17', 100000, '', 0, '', 'pending', ''),
(17, 2, 1, '2021-05-24', 2100000, '', 0, '', 'pending', ''),
(18, 5, 1, '2021-05-24', 200000, 'Palembang', 50000, '', 'Selesai/Lunas', ''),
(19, 5, 1, '2021-05-24', 200000, 'Palembang', 50000, 'Jl. Salah 2 Kota Pagar Alam', 'pending', ''),
(20, 5, 1, '2021-05-25', 550000, 'Palembang', 50000, 'jalan salah 2', 'Dikirim', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `subberat` int(11) NOT NULL,
  `subharga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`, `nama`, `harga`, `berat`, `subberat`, `subharga`) VALUES
(1, 1, 1, 1, '', 0, 0, 0, 0),
(2, 1, 2, 2, '', 0, 0, 0, 0),
(3, 0, 2, 1, '', 0, 0, 0, 0),
(4, 0, 6, 1, '', 0, 0, 0, 0),
(5, 0, 3, 1, '', 0, 0, 0, 0),
(6, 14, 2, 1, '', 0, 0, 0, 0),
(7, 14, 6, 1, '', 0, 0, 0, 0),
(8, 14, 3, 1, '', 0, 0, 0, 0),
(9, 15, 2, 1, '', 0, 0, 0, 0),
(10, 15, 6, 1, '', 0, 0, 0, 0),
(11, 15, 3, 1, '', 0, 0, 0, 0),
(12, 16, 2, 1, '', 0, 0, 0, 0),
(13, 17, 2, 1, 'Galon Aqua', 50000, 5000, 5000, 50000),
(14, 17, 6, 1, 'kucing', 2000000, 5000, 5000, 2000000),
(15, 18, 2, 1, 'Galon Aqua', 50000, 5000, 5000, 50000),
(16, 18, 6, 1, 'kucing', 100000, 5000, 5000, 100000),
(17, 19, 2, 1, 'Galon Aqua', 50000, 5000, 5000, 50000),
(18, 19, 6, 1, 'kucing', 100000, 5000, 5000, 100000),
(19, 20, 2, 2, 'Galon Aqua', 50000, 5000, 10000, 100000),
(20, 20, 6, 4, 'kucing', 100000, 5000, 20000, 400000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `berat_produk` int(11) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `stok_produk` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi_produk`, `stok_produk`) VALUES
(2, 'Galon Baru', 52000, 19000, 'Galon.png', 'Galon Aqua Baru \r\nUkuran 19Liter', 3),
(3, 'Tissue Galon CC2', 7500, 100, 'Tissue galon CC2.jpg', 'Isi : per pack 100 tisu\r\nUkuran : 6cm x 7cm\r\n\r\ndapat di simpan dalam janga waktu yang lama di area yang kering, dan tidak terkena paparan sinar matahari langsung.\r\n', 5),
(6, 'Refill Galon', 5000, 0, 'refill.jpg', 'Refill Galon 5000/galon\r\n', 1000),
(7, 'Dispenser Miyako', 243000, 15000, 'Dispenser miyako wd-19 px.png', 'Miyako WD-19EX Water Portable Dispenser merupakan dispenser yang dilengkapi dengan dua pilihan tombol extra panas dan normal dengan suhu extra panas 91 °C dan 96 °C. Dispenser ini memiliki kapasitas tanki untuk air panas dan normal sebesar 3.5 L. Dispenser ini juga didesain dengan bentuk top loading sehingga dispenser masih dapat digunakan walaupun volume air di dalam galon tinggal sedikit dan Anda tidak perlu khawatir akan kekurangan air ketika isi dari galon tinggal sedikit.\r\n\r\nSpesifikasi : \r\n- Bisa Hot & Normal\r\n- Daya 350 Watt\r\n- Material Plastik', 10),
(8, 'Standing Dispenser', 1699000, 18000, 'Dispenser Cosmos CWD5808R.jpg', 'COSMOS - STANDING DISPENSER CCWD5808R\r\nSPECIFICATION :\r\n\r\nHot and Cold\r\nDaya: 470 watt\r\nDaya Pemanas : 350 watt\r\nDaya Pendingin : 120 watt\r\nKapasitas Panas : 4 L\r\nKapasitas Dingin : 2 L', 6),
(9, 'Pompa Galon Elektrik', 25000, 500, 'pompa elektrik galon.jpg', 'dispenser air rumah tangga dispenser air mini listrik botol air pompa dispenser klasik Antar muka pengisian USB, jalur pengisian distribusi, Pipa air silikon food grade (dapat diganti dengan pipa air untuk waktu yang lama, dan lebih bersih dan sehat) Pengisian penuh dengan listrik cepat, menyentuh air, nyaman dan nyaman. 304 pipa stopkontak stainless steel, dengan desain tubuh modis dan kecil, menunjukkan kualitas! Fitur produk: bahan rekayasa ABS, tidak berbau, gloss baik, anti-abrasi ', 20),
(10, 'Pompa Galon Manual', 15000, 200, 'pompa manual galon.jpg', 'Pompa Galon Manual', 30);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  ADD PRIMARY KEY (`id_ongkir`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indeks untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id_ongkir` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
