# Checklist Pengumpulan Praktikum

## 1. Yang tertulis secara eksplisit pada Challenge Modul I

Rujukan: PDF 17, footer “Halaman 14 dari 172”. Challenge meminta halaman Login statis dengan email/password, tombol Login dan teks menuju Register; kreativitas desain diperbolehkan.

Dokumen tersebut menyebut pengumpulan melalui grup chat lab atau pesan pribadi asisten, dengan:

- [ ] Screenshot keseluruhan layar yang memperlihatkan IDE dan emulator berdampingan.
- [ ] Screenshot hasil akhir aplikasi pada emulator saja.
- [ ] Seluruh source project berupa link repository GitHub atau ZIP.
- [ ] Untuk pengemasan source ZIP, modul menyarankan flutter clean agar output build besar tidak terbawa.

Paket dokumentasi ini tidak otomatis memenuhi pengumpulan tersebut karena tidak berisi source atau screenshot aplikasi. Tidak ada pesan dikirim ke grup/asisten dalam pekerjaan ini.

## 2. Bukti yang membantu menjelaskan Modul II-VIII

Daftar berikut adalah usulan organisasi bukti tim, bukan klaim format laporan wajib dosen untuk tiap pertemuan.

| Materi | Bukti yang dikumpulkan tim |
| --- | --- |
| II: UI | Enam screenshot layar, aset dan catatan layout responsif |
| III: Navigasi | Rekaman berpindah tab, buka detail berbeda, kembali dan retensi scroll |
| IV: State | Add/remove favorite, restart aplikasi, filter genre dan pencarian |
| V: API | Data Jikan, pagination, refresh, search debounce, kondisi loading/error/empty |
| VI: Auth | Email dan Google login, profil, logout dan guard; identitas sensitif disamarkan |
| VII: Firestore | Path favorite user uji, App -> Cloud -> App, ganti akun A/B |
| VIII: Release | Rules test, ikon/splash, APK teruji, fingerprint sesuai varian, workflow run dan release |

## 3. Susunan catatan praktikum yang dapat diisi

1. Identitas kelompok/anggota/NIM dan tanggal.
2. Modul yang dikerjakan dan tujuan pembelajarannya.
3. Ringkasan implementasi beserta Task ID dan commit.
4. Alur yang dapat diceritakan: input pengguna, layer yang bekerja, sumber data dan perubahan UI.
5. Hasil pengujian dengan expected/actual, screenshot/log dan defect yang belum selesai.
6. Kendala, penyebab dan perbaikan yang benar-benar dilakukan.
7. Kesimpulan pemahaman dan batas versi saat itu.

Jika asisten memberikan format resmi lain, ikuti format tersebut. Tidak ada rubrik nilai tambahan yang dibuat dalam dokumen ini.

## 4. Checklist akhir sebelum mengirim source

- [ ] Isi identitas, repository/commit dan petunjuk setup nyata.
- [ ] Pastikan seluruh source dan aset yang boleh dibagikan tersedia; pubspec/lockfile disertakan.
- [ ] Jangan sertakan keystore, password, token, service-account private key atau hasil Base64 signing.
- [ ] Pastikan screenshot/log tidak menampilkan kredensial.
- [ ] Jika menjalankan flutter clean, simpan APK yang memang perlu diserahkan terpisah terlebih dahulu; clean dapat menghapus output build.
- [ ] Jelaskan konfigurasi Firebase yang perlu disiapkan pemeriksa tanpa membagikan kredensial server.
- [ ] Pastikan tautan yang dibagikan dapat diakses penerima sesuai izin yang memang diberikan tim.
- [ ] Bedakan dokumentasi target, kode yang selesai dan bukti pengujian aktual.

Pengiriman, pemberian akses repository atau publikasi aplikasi dilakukan hanya ketika diminta tim. Audit dokumentasi ini tidak melakukan tindakan tersebut.
