# Keputusan Proyek

Keputusan berikut adalah baseline dokumentasi hasil revisi. Ini bukan catatan persetujuan dosen atau bukti keputusan historis tim.

| ID | Keputusan baseline | Alasan dan konsekuensi |
| --- | --- | --- |
| K-01 | Android sebagai target praktikum; Flutter tetap dipakai | Setup/build modul berfokus Android. iOS, web dan desktop belum diuji |
| K-02 | v1 selesai pada Auth; v2 menambahkan Firestore dan finishing | Mempertahankan pembagian ZIP awal; versi milestone bukan angka yang diwajibkan modul |
| K-03 | Favorit lokal v1 tidak diimpor otomatis ke cloud v2 | Data perangkat lama tidak memiliki pemilik akun yang dapat dibuktikan. Cloud memakai koleksi UID aktif yang sudah ada, atau kosong bila akun baru |
| K-04 | AV2-MIG-02/03/04 opsional di luar baseline | Jika tim memilih import, wajib ada pilihan akun, konfirmasi pengguna, idempotensi dan penanganan gagal sebagian |
| K-05 | Tag rilis tetap AnimeVersev1.0.0 / AnimeVersev2.0.0 | Konvensi ZIP dipertahankan; contoh trigger v* modul harus disesuaikan |
| K-06 | Snapshot favorit datar memakai mal_id, bukan malId sebagai nama field simpan | Selaras contoh toJson PDF 122. Properti Dart tetap malId. Pembaca/penulis lokal dan Firestore harus konsisten |
| K-07 | Search Home memakai API sejak Modul V; search Favorite lokal pada daftar favorit | Membedakan pencarian katalog dengan pencarian koleksi pengguna |
| K-08 | Gabungan search+genre menggunakan ID genre API pada fase API | Tambahan kontrak tim agar hasil tidak terbatas pada page yang sudah terunduh; fase dummy tetap filter lokal |
| K-09 | StatefulShellRoute menjadi target akhir navigasi | ShellRoute dipertahankan sebagai tahap belajar lalu direfactor mengikuti PDF 79-82 |
| K-10 | Forgot Password belum menjadi flow reset email penuh | PDF 37 menampilkan tombol UI, tidak menyediakan rincian reset. Pada final jangan tampilkan keberhasilan palsu |
| K-11 | Filter Rx mengikuti helper modul | Tidak dianggap sistem verifikasi umur. Nilai rating null berarti informasi tidak tersedia |
| K-12 | Versi toolchain dicatat dari hasil aktual | Tidak memakai versi Flutter proyek lain atau mengklaim dependency kompatibel tanpa build |
| K-13 | Tambahan profil di mockup tetap presentasional jika belum ada implementasinya | Menu pengaturan, keamanan atau privasi yang belum dibahas tidak otomatis memperluas requirement |

## Keputusan yang membutuhkan informasi proyek

| Informasi | Nilai saat audit | Cara melengkapi |
| --- | --- | --- |
| Anggota / NIM / kelompok / PIC | Belum diberikan | Isi dari tim |
| URL repository / branch / commit | Belum diberikan | Salin dari repository yang benar |
| Flutter, Dart, Java, Gradle, AGP | Belum diverifikasi | Ikuti Setup_Developer.md dan simpan hasil |
| applicationId Android | Belum tersedia | Baca konfigurasi app Android |
| Firebase project ID, Android app ID dan region | Belum tersedia | Baca project yang dipakai tim |
| SHA debug / release | Belum tersedia | Ambil dari signingReport varian terkait |
| Font dan aset asli | Tidak ada dalam ZIP | Ambil sumber dari praktikum dan catat lisensi/sumbernya |

## Mengubah keputusan

Catat tanggal, pengusul, ID keputusan, alasan, perilaku lama/baru, task terdampak dan uji yang berubah. Lalu perbarui SRS, kontrak data, roadmap, test plan dan README yang terkait. Perubahan tulisan saja tidak menjalankan migrasi data, deploy rules atau publikasi release.
