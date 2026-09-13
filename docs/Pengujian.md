# Rencana Pengujian dan Bukti

**Status semua skenario: BELUM DIJALANKAN.** Tidak ada source aplikasi, test suite, rules aktif atau APK dalam ZIP awal. Ini daftar uji dengan langkah dan ekspektasi, bukan laporan hasil PASS.

## Persiapan

Catat commit, versi aplikasi, perangkat/Android, Flutter dan Firebase project uji. Siapkan dua akun A/B, satu kondisi tanpa login, beberapa fixture anime valid/null/Rx, serta jaringan yang bisa diputus. Gunakan emulator/data praktikum untuk uji rules. Jangan menyertakan password akun uji pada screenshot atau log yang dibagikan.

Unit test menguji parser, filter dan kendali async dengan data deterministik; widget test menguji state layar; uji perangkat memeriksa integrasi native/Auth/release. Pilih metode yang sesuai risiko, bukan menjalankan test yang hanya membuktikan teks dokumentasi ada. Uji manual yang tertulis dalam modul tetap dicatat walau tim menambah otomasi.

## Skenario

Setiap baris di bawah belum dijalankan. Gunakan kolom ID untuk merekam hasil pada template bukti.

| ID | Target | Kebutuhan | Langkah / kondisi | Hasil yang diharapkan | Metode |
| --- | --- | --- | --- | --- | --- |
| TC-01 | v1 | FR-01 | Buka challenge Login statis | Email, password, Login dan teks Register terlihat; simpan screenshot IDE+emulator dan emulator saja | Manual |
| TC-02 | v1 | FR-02/03, NFR-01 | Buka enam layar pada perangkat kecil, tampilkan keyboard dan scroll form | Tidak overflow; background, grid dan kartu sesuai struktur modul | Widget/manual |
| TC-03 | v1+v2 | FR-04 | Scroll Home, ketik query, pindah Favorite/Profile lalu kembali | State tab, query dan posisi scroll bertahan; bottom bar tidak tertutup navigasi sistem | Integrasi/manual |
| TC-04 | v1+v2 | FR-05/06 | Buka dua kartu berbeda; coba route dengan ID nonangka, negatif dan tidak ada | Detail sesuai malId; invalid tidak crash; not found mempunyai aksi kembali | Widget/integrasi |
| TC-05 | v1 | FR-07 | Tambah lalu hapus favorit dari Detail dan buka Favorite | Kedua layar mengikuti state yang sama; satu anime tidak duplikat | Unit/widget |
| TC-06 | v1 | FR-08 | Simpan favorit, hentikan aplikasi, buka kembali; ulangi dengan JSON lokal rusak pada fixture | Data valid pulih; data rusak ditangani dengan pesan, tanpa crash | Unit/integrasi |
| TC-07 | v1 | FR-09 | Pada fase dummy pilih genre, cari dengan huruf besar/kecil; ubah query Favorite | Gabungan filter benar dan query kedua layar independen | Unit/widget |
| TC-08 | v1+v2 | FR-10/15 | Berikan fixture Jikan valid, field opsional null, nested field hilang dan tipe salah | Mapper memetakan 12 properti; null aman; identitas tidak valid tidak menjadi ID 0 | Unit |
| TC-09 | v1+v2 | FR-11 | Ketik cepat tiga query dan atur respons query lama datang terakhir | Debounce 500 ms diterapkan; hanya query aktif memperbarui list/error/loading | Unit/widget |
| TC-10 | v1+v2 | FR-12 | Scroll hingga page 2; ulang callback; berikan duplicate malId | Append sekali, loading-more terpisah, duplicate ID tidak tampil | Unit/integrasi |
| TC-11 | v1+v2 | FR-12 | Berikan has_next_page false dan page yang tersaring habis tetapi has_next_page true | Akhir data berhenti; halaman kosong akibat filter tidak dianggap selalu akhir; tidak ada loop tak terbatas | Unit |
| TC-12 | v1+v2 | FR-13 | Tarik refresh setelah page 2 saat query/genre aktif | Page kembali 1, data lama tidak digandakan, mode query mengikuti baseline | Widget/integrasi |
| TC-13 | v1+v2 | FR-14 | Buka detail yang ada pada list lalu ID valid yang tidak ada di list | Kasus pertama menggunakan list; kasus kedua meminta repository; back kembali ke asal | Unit/integrasi |
| TC-14 | v1+v2 | FR-16 | Gunakan URL gambar kosong/rusak di Home, Detail dan Favorite | Placeholder/fallback muncul; layout dan aksi lain tetap bekerja | Widget/manual |
| TC-15 | v1+v2 | FR-17 | Berikan item rating Rx, non-Rx dan null pada list/search/detail | Rx tidak ditampilkan sebagai item layak; null ditangani sesuai kontrak tanpa klaim verifikasi | Unit/widget |
| TC-16 | v1+v2 | NFR-03, FR-27 | Simulasikan timeout, 429, 5xx dan offline pada initial fetch serta load-more | Loading berakhir; retry terkendali; load-more gagal mempertahankan list sebelumnya | Unit/widget |
| TC-17 | v1+v2 | FR-27 | Berikan katalog kosong dan query tanpa hasil pada Home/Favorite | Pesan kosong berbeda dari error; search bisa dibersihkan | Widget |
| TC-18 | v1+v2 | FR-18 | Daftar akun uji valid lalu coba email invalid/password tidak memenuhi kebijakan | Input invalid tidak dikirim; valid membuat sesi; loading/error tertangani | Integrasi/manual |
| TC-19 | v1+v2 | FR-19 | Masuk email valid, kredensial salah dan email sudah dipakai pada pendaftaran | Sukses menuju Home; kegagalan terkontrol tanpa exception mentah | Integrasi/manual |
| TC-20 | v1+v2 | FR-20 | Login Google pada debug dan batalkan pemilih akun pada percobaan lain | Firebase user tersedia hanya pada sukses; batal memulihkan tombol | Manual perangkat |
| TC-21 | v1+v2 | FR-21 | Buka ulang aplikasi dengan sesi tersimpan; buka path privat tanpa login | Loading pemulihan jelas; redirect tidak loop atau memperlihatkan halaman privat sesaat | Integrasi/manual |
| TC-22 | v1+v2 | FR-22 | Gunakan akun tanpa foto/nama; lakukan logout | Fallback profil ada; sesi/route berubah; tidak ada crash | Widget/integrasi |
| TC-23 | v1 | FR-08, K-03 | Login A, simpan favorit lokal, logout dan login B pada perangkat sama | Perilaku lokal v1 sesuai dokumentasi dan tidak diklaim per-akun | Manual |
| TC-24 | v2 | FR-23/24 | Login A dan tekan favorit; periksa path dan isi dokumen uji | Document ID sama dengan malId; field snapshot benar; App -> Cloud berhasil | Integrasi/manual |
| TC-25 | v2 | FR-24 | Saat aplikasi terbuka ubah/hapus dokumen favorit A di Console uji | UI memperbarui tanpa restart; Cloud -> App terbukti | Manual dua arah |
| TC-26 | v2 | FR-23/24 | Tambah malId yang sama dua kali lalu hapus | Tetap satu dokumen, setelah delete item hilang dari stream | Unit/integrasi |
| TC-27 | v2 | FR-25 | Login A, logout lalu login B saat callback A dibuat terlambat; ulangi saat offline | B tidak pernah melihat favorit A; callback UID lama diabaikan | Integrasi/manual |
| TC-28 | v2 | FR-26 | Tanpa auth, coba get/list/create/update/delete favorite melalui client/emulator | Seluruh operasi ditolak rules, bukan hanya tombol disembunyikan | Rules test |
| TC-29 | v2 | FR-26 | Sebagai A, coba get/list/create/update/delete users/B/favorites | Seluruh operasi lintas UID ditolak | Rules test |
| TC-30 | v2 | FR-26 | Sebagai A, lakukan get/list/create/update/delete pada favorite A | Operasi owner yang valid berhasil | Rules test |
| TC-31 | v2 | AV2-SEC-06 | Jika schema validation diimplementasikan, kirim mal_id salah tipe/tidak cocok path, title salah tipe dan field tak diizinkan | Payload ditolak; data valid diterima; jangan melabeli contoh owner-only sudah lulus ini | Rules test |
| TC-32 | v2 | FR-27 | Putus jaringan dengan cache, lalu tanpa cache; buat mutation pending dan pulihkan jaringan | Cache/pending/empty dibedakan; sukses cloud hanya setelah konfirmasi; sinkron pulih | Integrasi/manual |
| TC-33 | v2 | FR-27 | Paksa permission-denied saat write favorite | UI tidak mempertahankan klaim berhasil; error dapat dipahami dan state pulih | Integrasi/manual |
| TC-34 | v2 | FR-28 | Upgrade baseline v1 dengan favorit lokal ke v2; login user cloud yang ada dan user baru | Tidak import otomatis; user lama mendapat koleksi cloud miliknya, user baru kosong | Integrasi/manual |
| TC-35 | Opsional | K-04 | Jika import diaktifkan: konfirmasi akun tujuan, import ulang dan simulasikan gagal sebagian | Tidak duplikat/lintas akun; penanda hanya setelah sukses; sumber tidak hilang saat gagal | Integrasi |
| TC-36 | v1+v2 | NFR-04 | Navigasi keluar saat search/detail memuat; dispose provider saat stream aktif | Timer/controller/subscription dibersihkan; tidak ada update setelah dispose | Unit/widget |
| TC-37 | v2 | FR-29 | Pasang APK lalu buka launcher dan cold start | Ikon dan splash custom sesuai aset, tidak blank berkepanjangan | Manual release |
| TC-38 | v2 | FR-30 | Build dan pasang APK release lalu login email/Google | Artifact terpasang cocok fingerprint release dan login berhasil | Manual release |
| TC-39 | v2 | FR-31 | Jalankan workflow pada tag AnimeVersev2.0.0 setelah gate selesai | Build berjalan, version/commit cocok, APK artifact yang sama terlampir pada GitHub Release | CI/manual |
| TC-40 | v1+v2 | NFR-05/07 | Periksa daftar file yang akan dikumpulkan, konfigurasi dan catatan toolchain | Tidak ada password/keystore/token; source dan langkah setup dapat diikuti | Review |
| TC-41 | v1+v2 | FR-32 | Tekan Forgot Password/menu profil belum didukung dan periksa teksnya | Tidak ada sukses palsu; batas fitur jelas dan sesuai spesifikasi | Manual |
| TC-42 | v1+v2 | NFR-08 | Periksa label input/ikon, password tersembunyi, pembesaran teks dan error | Aksi dapat dipahami; tidak hanya mengandalkan warna; tidak ada overflow baru | Manual/widget |

## Urutan yang disarankan

Jalankan unit/widget test terhadap perubahan; periksa alur UI/API/Auth v1; pada v2 periksa App -> Cloud -> App, pergantian akun dan rules; terakhir uji APK release serta workflow. Penghapusan melalui Console merupakan bukti realtime, bukan bukti rules client. Uji cross-user harus mencoba request dengan identitas A ke path B.

## Kriteria penerimaan

Semua skenario untuk target versi dan scope aktif harus memiliki hasil, tanggal, pelaksana dan bukti. TC-35 hanya berlaku jika import opsional diaktifkan. TC-31 membuktikan tambahan validasi schema yang ditargetkan AV2-SEC-06 dan tidak dapat dianggap lulus dari rules owner-only.

Jika skenario gagal, buat catatan defect yang menyebut kondisi, expected/actual, severity, task terkait dan bukti reproduksi. Jangan menutup defect hanya karena berhasil sekali pada debug jika masalahnya terjadi pada release atau pergantian akun.

## Ringkasan hasil saat paket dibuat

| Item | Hasil |
| --- | --- |
| Kesesuaian isi dokumentasi terhadap sumber | Diperiksa; rincian pada Audit_Kelengkapan.md |
| flutter analyze / flutter test / build APK | Belum dijalankan, source tidak tersedia |
| Firebase Auth / Firestore / Security Rules | Belum diuji pada project pengguna |
| UI enam layar dan release pada perangkat | Belum diuji |
| GitHub Actions / GitHub Release | Belum dijalankan |

Gunakan [Catatan_Bukti.md](templates/Catatan_Bukti.md) untuk hasil nyata. Jangan mengubah seluruh task menjadi DONE dari keberadaan paket revisi ini.
