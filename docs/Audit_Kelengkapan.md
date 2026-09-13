# Audit Kelengkapan Dokumentasi AnimeVerse

Tanggal pemeriksaan: 13 September 2026. Sumber lokal: Modul_Pemrograman_Mobile.pdf dan AnimeVerse_Documentation(1).zip.

## Kesimpulan

Dokumentasi awal **belum lengkap untuk menjadi panduan pelaksanaan modul dari awal sampai release**. README dan roadmap sudah memuat arsitektur besar yang benar: UI, go_router, Provider, SharedPreferences, Jikan, Firebase Auth, Firestore dan release. Kekurangannya ada pada rincian materi tertentu, kontrak antarbagian, serta panduan pelaksanaan dan bukti.

Ini audit dokumentasi, bukan audit implementasi aplikasi. ZIP tidak berisi Dart, Android project, pubspec, Firebase Rules, workflow, test, screenshot atau APK. Tidak ada kesimpulan bahwa aplikasi gagal maupun sudah lulus uji.

## Inventaris awal

| File | Ukuran tidak terkompresi | Isi terverifikasi |
| --- | ---: | --- |
| README.md | 7.472 byte | Ringkasan aplikasi, folder, dependency, run, Auth, Firestore dan release |
| Roadmap_AnimeVersev1.0.0.md | 30.154 byte | 137 task, seluruhnya TODO |
| Roadmap_AnimeVersev2.0.0.md | 23.573 byte | 100 task, seluruhnya TODO |

Jumlah task asli benar: 137 + 100 = 237. Tidak ada folder docs pada arsip awal, sedangkan README menyebut path docs. Revisi menyertakan struktur tersebut dan membuat tautan yang dapat dibuka.

## Temuan dan tindakan

| ID | Temuan pada ZIP awal | Bukti modul / lokasi | Perbaikan |
| --- | --- | --- | --- |
| A-01 | Navigasi hanya dirinci sampai ShellRoute dan indeks manual | PDF 79-83 mengajarkan StatefulShellRoute, goBranch dan SafeArea; AV-NAV-01..15 belum memuat refactor ini | AV-NAV-16..19 dan arsitektur route akhir |
| A-02 | Tidak ada task eksplisit pagination, infinite scroll, refresh dan loading halaman berikut | PDF 126, 130-131; kelompok AV-API awal berakhir pada 16 | AV-API-22..26, 30 dan kontrak state |
| A-03 | Search API disebut kondisional; debounce dan pengendalian rate limit belum dirinci | PDF 124-127; AV-API-14 | Search Home fase API dibuat tegas, ditambah AV-API-21, 27 dan proteksi respons terlambat |
| A-04 | flutter_svg dan cached_network_image tidak tercatat pada daftar dependency | PDF 39, 119-120, 129-133; README dependency | Dependency dan task masing-masing ditambahkan |
| A-05 | BackgroundWidget, AnimeView dan FavoriteAnimeCard belum menjadi pekerjaan eksplisit | PDF 24, 47-50, 62-68; kelompok AV-UI | AV-UI-16, 18, 19 |
| A-06 | Model hanya dicontohkan enam field; metadata tambahan dan helper konten belum terdokumentasi | PDF 121-123 | Model 12 field, nullability, isAppropriateContent dan serializer favorit |
| A-07 | Detail API belum menetapkan lookup cache sebelum fallback request | PDF 128-129; AV-API-06/11 hanya menyebut detail ID | AV-API-28 dan skenario detail di luar halaman Home |
| A-08 | AuthService ada, tetapi AuthProvider dan dua helper belum eksplisit | PDF 143-145 | AuthProvider, validators.dart, snackbar_helper.dart dan lifecycle sesi |
| A-09 | assets ditampilkan sebagai anak lib dan folder pendamping modul belum lengkap | README struktur; PDF 22-24, 143-145 | assets berada di root; config, utils dan services/auth dijelaskan |
| A-10 | Tag AnimeVersev... berbeda dengan pola v... pada contoh workflow modul | Roadmap gate; gambar PDF 172, 174-175 | Trigger dan kondisi job release mengikuti AnimeVersev*, termasuk pencocokan pubspec |
| A-11 | CI berhenti pada upload artifact, belum menyebut job GitHub Release | AV2-CI-01..08; PDF 174-175 | AV2-CI-09/10 dan acceptance artifact release |
| A-12 | Kebijakan import lokal belum diputuskan dan task kondisional masuk hitungan wajib | AV2-MIG-01..04 | Baseline cloud tanpa import otomatis; 3 task import opsional dipisahkan dari gate |
| A-13 | Slogan README dapat menyiratkan favorit lintas akun | README paragraf awal dan keterbatasan v1 | Perbedaan lokal-perangkat dengan cloud-per-UID dijelaskan |
| A-14 | Tidak ada pemetaan materi ke halaman sumber | Semua dokumen awal | Matriks_Modul.md dengan spesifikasi, task dan skenario uji |
| A-15 | Setup, SRS, kontrak data, pengujian dan release hanya ringkasan/rencana menulis dokumen | README dan AV-DOC | Dokumen operasional ditulis; nilai lingkungan yang belum tersedia tetap ditandai |
| A-16 | Bukti pengumpulan Challenge Modul I belum dicatat | PDF 17 menyebut dua screenshot dan source/link proyek | Checklist pengumpulan dan AV-ENG-14 |
| A-17 | Offline belum membedakan cache, pending write dan konfirmasi server | AV2-ROB-02, AV2-UI-03 | Perilaku offline dan pengujian pending/permission denied diperjelas sebagai tambahan tim |

## Materi modul dan tambahan tim

SRS, pembagian versi, Task ID, PIC, Issue/PR, Conventional Commits, uji otomatis, proteksi respons terlambat, validasi schema rules yang lebih ketat dan catatan checksum adalah pengorganisasian/tambahan engineering. Modul tidak menyatakan semua dokumen ini sebagai syarat pengumpulan. Matriks menjaga agar tambahan tersebut tidak diklaim sebagai instruksi dosen.

Materi teoritis juga dipetakan: pengenalan Flutter, widget tree dan constraints, navigasi deklaratif, state lokal/global, Future/async-await, REST/JSON, Auth, SQL/NoSQL, collection/document dan stream. Paket ini bukan salinan ulang seluruh uraian teori modul.

## Batas pemeriksaan

Teks PDF ditelusuri per modul dan halaman implementasi bergambar diperiksa untuk model, routing, UI, auth, rules serta workflow. Beberapa method di PDF diarahkan ke repository GitHub tanpa URL yang dapat diambil dari anotasi tautan PDF. Aset sumber dan repository pendamping tidak berada dalam ZIP. Karena itu kontrak implementasi dalam revisi yang tidak tertulis penuh di PDF diberi label keputusan tim, bukan diklaim sebagai salinan source modul.

Panduan teknis yang bergantung versi diperiksa terhadap dokumentasi resmi Flutter, Firebase, Jikan, go_router, google_sign_in dan GitHub. Rujuk tautan dekat bagian terkait. Versi package dari tangkapan layar modul tidak dipaksakan sebagai versi proyek pengguna.

## Yang masih harus diisi dari pekerjaan nyata

Identitas tim; repository dan commit; Flutter/Dart/JDK/Gradle aktual; applicationId; konfigurasi Firebase; sumber aset; hasil test; screenshot; APK; workflow run; tag dan release. Semua ini membutuhkan source atau eksekusi aplikasi. Kolom kosongnya disengaja agar laporan tidak membuat bukti fiktif.
