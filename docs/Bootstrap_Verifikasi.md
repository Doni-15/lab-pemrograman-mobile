# Verifikasi Bootstrap AnimeVerse

Tanggal UTC: 20260913-151315. Pemeriksaan dijalankan di mesin pengguna.
Repository: https://github.com/Doni-15/lab-pemrograman-mobile
Commit source yang diuji: 0cc3440bc93218d2163221e7ad95b1deec45876f

| Task | Status | Bukti / batas |
| --- | --- | --- |
| AV-ENG-01 | DONE | flutter run berhasil; pengguna memeriksa Login statis pada Android. |
| AV-ENG-02 | DONE | SDK aktual dicatat; analyze/test/build dan run Android berhasil. |
| AV-ENG-03 | DONE | pub get berhasil; lockfile tersedia dan dimasukkan staging Git. |
| AV-ENG-04 | DONE | flutter_lints aktif; flutter analyze dan flutter test berhasil. |
| AV-ENG-05 | DONE | Aturan ignore build, konfigurasi lokal dan signing diperiksa. |
| AV-ENG-06 | DONE | README memuat tujuan, run, struktur dan status. |
| AV-ENG-07 | DONE | Roadmap v1 lengkap tersedia di docs. |
| AV-ENG-08 | DONE | Roadmap v2 lengkap tersedia di docs. |
| AV-ENG-09 | DONE | Seluruh folder layer dan assets root tersedia. |
| AV-ENG-10 | BLOCKED | Gambar dan font asli modul belum lengkap; folder saja belum memenuhi acceptance. |
| AV-ENG-11 | DONE | Commit baseline dibuat; source yang diuji dan SDK/lockfile tercatat. |
| AV-ENG-12 | DONE | Template Issue berisi Task ID, tujuan, acceptance, PIC dan bukti. |
| AV-ENG-13 | DONE | Template PR berisi task, perubahan, pemeriksaan dan screenshot. |
| AV-ENG-14 | BLOCKED | Sebagian screenshot tersedia; kedua jenis bukti dan konfirmasi isinya belum lengkap. |

Perintah yang berhasil sebelum laporan ini dibuat:
- flutter pub get
- dart format lib test
- flutter analyze
- flutter test
- flutter build apk --debug

Hasil run Android dan bukti aset/screenshot tercatat per task di atas.
Log mentah disimpan lokal di luar repository; tidak otomatis dipublikasikan.
Template Issue/PR tersedia; tidak ada Issue/PR yang dibuat otomatis.
Initial commit membuktikan baseline lokal. Keberhasilan push dilaporkan terminal.
SDK aktual tersedia pada SDK.md. Fitur Auth/API/Favorite belum diimplementasikan.
