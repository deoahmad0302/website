-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 24, 2023 at 10:47 PM
-- Server version: 10.3.38-MariaDB-0ubuntu0.20.04.1
-- PHP Version: 7.2.34-38+ubuntu20.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buku_saku`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_agama`
--

CREATE TABLE `t_agama` (
  `id_agama` int(11) NOT NULL,
  `agama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_agama`
--

INSERT INTO `t_agama` (`id_agama`, `agama`) VALUES
(1, 'Islam'),
(2, 'Kristen(Protestan)'),
(3, 'Katholik'),
(4, 'Budha'),
(6, 'Hindu'),
(7, 'Konghucu');

-- --------------------------------------------------------

--
-- Table structure for table `t_biodata`
--

CREATE TABLE `t_biodata` (
  `id_biodata` varchar(255) NOT NULL,
  `nik` varchar(255) DEFAULT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `jk` int(11) DEFAULT NULL,
  `id_agama` int(11) DEFAULT NULL,
  `nim` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_jawaban`
--

CREATE TABLE `t_jawaban` (
  `id_jawaban` varchar(255) NOT NULL,
  `id_user` varchar(255) NOT NULL,
  `id_soal` varchar(255) NOT NULL,
  `jawaban` varchar(255) NOT NULL,
  `id_nilai` int(11) DEFAULT NULL,
  `createt_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_jenis_kelamin`
--

CREATE TABLE `t_jenis_kelamin` (
  `id_jk` int(11) NOT NULL,
  `jenis_kelamin` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_jenis_kelamin`
--

INSERT INTO `t_jenis_kelamin` (`id_jk`, `jenis_kelamin`) VALUES
(1, 'Laki-Laki'),
(2, 'Perempuan');

-- --------------------------------------------------------

--
-- Table structure for table `t_login`
--

CREATE TABLE `t_login` (
  `id_login` varchar(255) NOT NULL,
  `id_role` int(11) NOT NULL,
  `nim` varchar(255) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `jk` int(11) DEFAULT NULL,
  `agama` int(11) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` int(11) DEFAULT NULL,
  `status_mhs` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_mahasiswa`
--

CREATE TABLE `t_mahasiswa` (
  `id_biodata` varchar(255) DEFAULT NULL,
  `status_mhs` int(11) NOT NULL DEFAULT 1,
  `id_prodi` int(11) DEFAULT NULL,
  `idmhs` varchar(255) NOT NULL,
  `nim` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_mahasiswa_seq`
--

CREATE TABLE `t_mahasiswa_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_mahasiswa_seq`
--

INSERT INTO `t_mahasiswa_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `t_materi`
--

CREATE TABLE `t_materi` (
  `id_materi` varchar(255) NOT NULL,
  `materi` varchar(255) DEFAULT NULL,
  `file_materi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_materi`
--

INSERT INTO `t_materi` (`id_materi`, `materi`, `file_materi`) VALUES
('eb51b84a-f5db-4093-91c0-3f8e8b464963', 'konsep ketun\nhanan,pdf', 'MODUL_1_KONSEP_KETUHANAN_YANG_MAHA_ESA-1.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `t_nilai`
--

CREATE TABLE `t_nilai` (
  `id_nilai` int(11) NOT NULL,
  `nilai` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_nilai`
--

INSERT INTO `t_nilai` (`id_nilai`, `nilai`) VALUES
(1, 'Sangat Baik'),
(2, 'Baik'),
(3, 'Cukup'),
(4, 'Kurang'),
(5, 'Sangat Kurang');

-- --------------------------------------------------------

--
-- Table structure for table `t_periode`
--

CREATE TABLE `t_periode` (
  `id_periode` varchar(255) NOT NULL,
  `id_prodi` int(11) NOT NULL,
  `mulai_periode` date NOT NULL,
  `selesai_periode` date NOT NULL,
  `status_periode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_periode`
--

INSERT INTO `t_periode` (`id_periode`, `id_prodi`, `mulai_periode`, `selesai_periode`, `status_periode`) VALUES
('433c5f76-3aba-11ee-824b-0242ac120002', 1, '2023-09-11', '2023-12-31', 1),
('608f7124-3aba-11ee-824b-0242ac120002', 3, '2023-09-11', '2024-12-31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_prodi`
--

CREATE TABLE `t_prodi` (
  `id_prodi` int(11) NOT NULL,
  `prodi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_prodi`
--

INSERT INTO `t_prodi` (`id_prodi`, `prodi`) VALUES
(1, 'Teknik Informatika'),
(2, 'Teknologi Hasil Pertanian'),
(3, 'Mesin dan Peralatan Pertanian'),
(4, 'Teknologi Rekayasa Pangan');

-- --------------------------------------------------------

--
-- Table structure for table `t_role`
--

CREATE TABLE `t_role` (
  `id_role` int(11) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_role`
--

INSERT INTO `t_role` (`id_role`, `role`) VALUES
(1, 'dosen'),
(2, 'mahasiswa');

-- --------------------------------------------------------

--
-- Table structure for table `t_soal`
--

CREATE TABLE `t_soal` (
  `id_soal` varchar(255) NOT NULL,
  `id_materi` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `soal` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_soal`
--

INSERT INTO `t_soal` (`id_soal`, `id_materi`, `status`, `created_at`, `soal`) VALUES
('d726b962-6916-11ee-89c4-c9e00a8ea9a4', 'eb51b84a-f5db-4093-91c0-3f8e8b464963', 1, '2023-10-12 23:48:52.000000', 'apa itu tuhan\r\ntuhan\r\napa tuhan itu ada\r\nbagaimana bentuk tuhan\r\nkenapa ada tuhan');

-- --------------------------------------------------------

--
-- Table structure for table `t_user`
--

CREATE TABLE `t_user` (
  `id_useradmin` varchar(255) NOT NULL,
  `id_role` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_user`
--

INSERT INTO `t_user` (`id_useradmin`, `id_role`, `username`, `password`, `created_at`, `status`) VALUES
('5b461a02-481f-11ee-baf5-0242ac120002', 1, 'admin', '202cb962ac59075b964b07152d234b70', '2023-08-31 16:56:40', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_agama`
--
ALTER TABLE `t_agama`
  ADD PRIMARY KEY (`id_agama`);

--
-- Indexes for table `t_biodata`
--
ALTER TABLE `t_biodata`
  ADD PRIMARY KEY (`id_biodata`),
  ADD UNIQUE KEY `nik` (`nik`),
  ADD KEY `agama` (`id_agama`),
  ADD KEY `id_agama` (`id_agama`),
  ADD KEY `jk` (`jk`);

--
-- Indexes for table `t_jawaban`
--
ALTER TABLE `t_jawaban`
  ADD PRIMARY KEY (`id_jawaban`),
  ADD KEY `id_soal` (`id_soal`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_nilai` (`id_nilai`);

--
-- Indexes for table `t_jenis_kelamin`
--
ALTER TABLE `t_jenis_kelamin`
  ADD PRIMARY KEY (`id_jk`);

--
-- Indexes for table `t_login`
--
ALTER TABLE `t_login`
  ADD PRIMARY KEY (`id_login`),
  ADD KEY `id_role` (`id_role`),
  ADD KEY `jk` (`jk`),
  ADD KEY `agama` (`agama`);

--
-- Indexes for table `t_mahasiswa`
--
ALTER TABLE `t_mahasiswa`
  ADD PRIMARY KEY (`idmhs`),
  ADD KEY `nik` (`id_biodata`),
  ADD KEY `id_prodi` (`id_prodi`);

--
-- Indexes for table `t_materi`
--
ALTER TABLE `t_materi`
  ADD PRIMARY KEY (`id_materi`);

--
-- Indexes for table `t_nilai`
--
ALTER TABLE `t_nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `t_periode`
--
ALTER TABLE `t_periode`
  ADD PRIMARY KEY (`id_periode`),
  ADD KEY `id_prodi` (`id_prodi`);

--
-- Indexes for table `t_prodi`
--
ALTER TABLE `t_prodi`
  ADD PRIMARY KEY (`id_prodi`);

--
-- Indexes for table `t_role`
--
ALTER TABLE `t_role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `t_soal`
--
ALTER TABLE `t_soal`
  ADD PRIMARY KEY (`id_soal`),
  ADD KEY `id_materi` (`id_materi`);

--
-- Indexes for table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`id_useradmin`),
  ADD KEY `id_role` (`id_role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_agama`
--
ALTER TABLE `t_agama`
  MODIFY `id_agama` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `t_jenis_kelamin`
--
ALTER TABLE `t_jenis_kelamin`
  MODIFY `id_jk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_nilai`
--
ALTER TABLE `t_nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `t_prodi`
--
ALTER TABLE `t_prodi`
  MODIFY `id_prodi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `t_role`
--
ALTER TABLE `t_role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_biodata`
--
ALTER TABLE `t_biodata`
  ADD CONSTRAINT `t_biodata_ibfk_1` FOREIGN KEY (`id_agama`) REFERENCES `t_agama` (`id_agama`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_biodata_ibfk_2` FOREIGN KEY (`jk`) REFERENCES `t_jenis_kelamin` (`id_jk`) ON UPDATE CASCADE;

--
-- Constraints for table `t_login`
--
ALTER TABLE `t_login`
  ADD CONSTRAINT `t_login_ibfk_2` FOREIGN KEY (`id_role`) REFERENCES `t_role` (`id_role`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_login_ibfk_3` FOREIGN KEY (`agama`) REFERENCES `t_agama` (`id_agama`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_login_ibfk_4` FOREIGN KEY (`jk`) REFERENCES `t_jenis_kelamin` (`id_jk`) ON UPDATE CASCADE;

--
-- Constraints for table `t_mahasiswa`
--
ALTER TABLE `t_mahasiswa`
  ADD CONSTRAINT `FKe8pmr3qjl4pte38injkpqft5y` FOREIGN KEY (`id_prodi`) REFERENCES `t_prodi` (`id_prodi`),
  ADD CONSTRAINT `FKsyybadqlu0c5od45fy6044pp4` FOREIGN KEY (`id_biodata`) REFERENCES `t_biodata` (`id_biodata`);

--
-- Constraints for table `t_soal`
--
ALTER TABLE `t_soal`
  ADD CONSTRAINT `FK2eu3y0ofyj93ccme5hxjuv109` FOREIGN KEY (`id_materi`) REFERENCES `t_materi` (`id_materi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
