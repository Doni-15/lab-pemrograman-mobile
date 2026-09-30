# Roadmap Implementasi - AnimeVerse v1

**Target: AnimeVersev1.0.0**  
**Cakupan: Modul I-VI: UI sampai Firebase Authentication**  
**Total: 174 task; aktif 174; opsional di luar baseline 0.**

Status AV-ENG-01 sampai AV-ENG-14 mengikuti bukti bootstrap lokal; task lain tetap mengikuti pemeriksaan masing-masing. Dokumen yang sudah ditulis bukan bukti bahwa task proyek selesai. Nomor versi dan pembagian milestone adalah konvensi tim dari ZIP awal, bukan ketentuan nomor versi dari modul.

## Cara menggunakan

Kerjakan milestone berurutan. Pada satu milestone, setup dan implementasi mendahului pengujian; nomor Task ID dipertahankan agar referensi lama tidak rusak, sehingga urutan ID bukan urutan eksekusi mutlak. Tambahan hasil audit ditempatkan di akhir kelompok terkait. Misalnya AV-NAV-16/17 menyempurnakan ShellRoute yang dibuat sebelumnya.

Isi PIC, Issue/PR bila tim memakai GitHub, dan bukti pemeriksaan. Satu task boleh memakai beberapa commit kecil. Jangan membuat tag final sebelum seluruh task aktif dan gerbang versi tersebut lulus.

| Status | Arti |
| --- | --- |
| TODO | Belum ada bukti pekerjaan selesai |
| IN_PROGRESS | Sedang dikerjakan |
| BLOCKED | Dependensi atau konfigurasi belum tersedia |
| IN_REVIEW | Menunggu pemeriksaan |
| DONE | Acceptance dan bukti lulus, perubahan sudah terintegrasi |

**Asal:** M = materi modul; T = tambahan perencanaan/ketahanan/QA tim; M+T = materi modul dengan acceptance diperjelas. Nomor halaman adalah **halaman PDF**, bukan angka footer. Label kelompok M+T tidak berarti setiap praktik engineering diwajibkan dosen. Rincian kekurangan asli ada pada [audit](Audit_Kelengkapan.md) dan [matriks modul](Matriks_Modul.md).

Task opsional AV2-MIG-02/03/04 tetap TODO, dengan keberlakuan di luar baseline; tidak dihitung sebagai syarat release kecuali keputusan K-03 diubah. Task aktif lain adalah target paket ini, termasuk tambahan tim yang sudah dinyatakan.

## Definition of Done

Acceptance spesifik terpenuhi; pemeriksaan relevan memiliki hasil aktual; perubahan tidak merusak alur sebelumnya; dokumentasi mengikuti kode. Untuk task dokumentasi cukup periksa isi, tautan, dan kesesuaiannya. Untuk perilaku aplikasi gunakan skenario [pengujian](Pengujian.md). Tidak perlu mengulang seluruh build untuk tiap perubahan dokumentasi.

Tipe commit: feat, fix, refactor, test, docs, chore, ci. Contoh: `feat(home): add paginated anime loading` dan `fix(firestore): restrict favorites to owner`. Isu keamanan tetap dicatat dalam scope; tidak memerlukan tipe commit khusus `security`.

## Ringkasan milestone

| Target | Fokus | Task |
| --- | --- | ---: |
| AnimeVersev0.1.0 | Bootstrap Flutter & repository | 14 |
| AnimeVersev0.2.0 | Fondasi UI & reusable widgets | 23 |
| AnimeVersev0.3.0 | Navigasi & data passing | 20 |
| AnimeVersev0.4.0 | Provider, favorite lokal, filter & search | 24 |
| AnimeVersev0.5.0 | Jikan API & Repository Pattern | 31 |
| AnimeVersev0.6.0 | Firebase Authentication | 27 |
| AnimeVersev0.7.0 | Integrasi aplikasi pre-database | 10 |
| AnimeVersev0.8.0 | QA & hardening v1 | 10 |
| AnimeVersev0.9.0 | Dokumentasi baseline v1 | 7 |
| AnimeVersev1.0.0 | Functional pre-Firestore baseline | 8 |

## Checklist detail

### AnimeVersev0.1.0 — Bootstrap Flutter & repository

- [x] **AV-ENG-01** · `chore` · Membuat proyek Flutter AnimeVerse
  - **Selesai jika:** Proyek dapat dijalankan pada Android dan nama aplikasi konsisten sebagai AnimeVerse.

- [x] **AV-ENG-02** · `chore` · Memilih dan mencatat Flutter SDK
  - **Selesai jika:** Versi Flutter/Dart konkret berhasil menjalankan proyek dan dicatat di repository.

- [x] **AV-ENG-03** · `chore` · Menyimpan pubspec.lock
  - **Selesai jika:** Resolusi dependency tercatat dan tidak diabaikan Git.

- [x] **AV-ENG-04** · `chore` · Menyiapkan flutter_lints
  - **Selesai jika:** flutter analyze dapat dijalankan pada scaffold.

- [x] **AV-ENG-05** · `chore` · Menyiapkan .gitignore Flutter
  - **Selesai jika:** Build output, IDE state, signing secret, dan file mesin lokal tidak dilacak.

- [x] **AV-ENG-06** · `docs` · Membuat README root
  - **Selesai jika:** README menjelaskan tujuan AnimeVerse, cara run, struktur, dan status versi.

- [x] **AV-ENG-07** · `docs` · Menempatkan roadmap v1 di docs
  - **Selesai jika:** Task ID dapat dirujuk dari Issue/PR.

- [x] **AV-ENG-08** · `docs` · Menempatkan roadmap v2 di docs
  - **Selesai jika:** Fase database terpisah dari baseline v1.

- [x] **AV-ENG-09** · `chore` · Membuat struktur folder aplikasi
  - **Selesai jika:** Folder lib berisi models, screens, widgets, providers, repositories, services, config dan utils; assets/images serta assets/fonts berada di root sejajar lib.

- [x] **AV-ENG-10** · `chore` · Mendaftarkan assets images dan fonts
  - **Selesai jika:** Aset modul dapat dimuat dari pubspec tanpa path rusak.

- [x] **AV-ENG-11** · `chore` · Menyiapkan Git repository dan initial commit
  - **Selesai jika:** Repository mempunyai baseline yang dapat direproduksi.

- [x] **AV-ENG-12** · `chore` · Menyiapkan template Issue
  - **Selesai jika:** Field Task ID, tujuan, acceptance, PIC, verifikasi tersedia.

- [x] **AV-ENG-13** · `chore` · Menyiapkan template PR
  - **Selesai jika:** PR memuat Task ID, perubahan, pemeriksaan, dan screenshot jika UI berubah.

- [x] **AV-ENG-14** · `docs` · Mencatat bukti Challenge Modul I
  - **Selesai jika:** Screenshot IDE dan emulator berdampingan, screenshot emulator, serta kode/link proyek dicatat pada checklist pengumpulan.

### AnimeVersev0.2.0 — Fondasi UI & reusable widgets

- [ ] **AV-UI-01** · `feat` · Membuat theme aplikasi
  - **Selesai jika:** Warna, tipografi, spacing, dan style mengikuti tampilan AnimeVerse pada modul.

- [ ] **AV-UI-02** · `feat` · Membuat model Anime baseline
  - **Selesai jika:** Field yang dibutuhkan UI seperti malId, title, image, score, genres, synopsis dapat direpresentasikan.

- [ ] **AV-UI-03** · `feat` · Membuat AnimeCard
  - **Selesai jika:** Poster dan judul anime dapat dirender reusable dari objek Anime.

- [ ] **AV-UI-04** · `feat` · Membuat GenreList
  - **Selesai jika:** Daftar genre tampil dan menerima selected state/callback.

- [ ] **AV-UI-05** · `feat` · Membuat HomeScreen
  - **Selesai jika:** Header, search field, genre list, dan daftar anime tersusun sesuai modul.

- [ ] **AV-UI-06** · `feat` · Membuat FavoriteScreen
  - **Selesai jika:** Search field dan grid/list favorit tersedia tanpa logika final.

- [ ] **AV-UI-07** · `feat` · Membuat ProfileScreen
  - **Selesai jika:** Profil menyediakan area informasi user dan aksi autentikasi yang akan dihubungkan kemudian.

- [ ] **AV-UI-08** · `feat` · Membuat DetailScreen
  - **Selesai jika:** Poster, title, metadata, genre, synopsis, dan tombol favorite tersedia.

- [ ] **AV-UI-09** · `feat` · Membuat SignInScreen
  - **Selesai jika:** Field email/password, tombol login, dan jalur Google sign-in tersedia.

- [ ] **AV-UI-10** · `feat` · Membuat SignUpScreen
  - **Selesai jika:** Field pendaftaran dan navigasi kembali ke sign-in tersedia.

- [ ] **AV-UI-11** · `feat` · Membuat BottomNavigationShell
  - **Selesai jika:** Tab Home, Favorite, dan Profile memiliki shell bersama.

- [ ] **AV-UI-12** · `feat` · Membuat empty state favorit
  - **Selesai jika:** FavoriteScreen tidak menampilkan data palsu ketika daftar kosong.

- [ ] **AV-UI-13** · `feat` · Membuat loading indicator reusable
  - **Selesai jika:** Screen async memiliki indikator proses yang konsisten.

- [ ] **AV-UI-14** · `feat` · Membuat error state reusable
  - **Selesai jika:** Error API/auth dapat ditampilkan tanpa crash.

- [ ] **AV-UI-15** · `test` · Membuat smoke widget test layar utama
  - **Selesai jika:** Home, Favorite, Profile, Detail, SignIn, SignUp dapat dibangun tanpa exception.

- [ ] **AV-UI-16** · `feat` · Membuat BackgroundWidget bersama
  - **Selesai jika:** Gradien digunakan ulang oleh layar autentikasi dan layar utama sesuai referensi modul.

- [ ] **AV-UI-17** · `chore` · Menambahkan flutter_svg
  - **Selesai jika:** Ikon Google SVG dari aset dapat tampil; package tercatat dalam lockfile.

- [ ] **AV-UI-18** · `feat` · Membuat AnimeView responsif
  - **Selesai jika:** LayoutBuilder menentukan grid sesuai ruang tersedia dan tidak menimbulkan overflow.

- [ ] **AV-UI-19** · `feat` · Membuat FavoriteAnimeCard
  - **Selesai jika:** Kartu favorit menampilkan poster, judul, genre dan skor serta menerima callback detail.

- [ ] **AV-UI-20** · `feat` · Menyiapkan DummyData tahap UI
  - **Selesai jika:** Data dummy memiliki ID berbeda dan dipakai hanya sebelum fase API atau pada fixture test.

- [ ] **AV-UI-21** · `feat` · Membuat header detail dengan SliverAppBar
  - **Selesai jika:** Poster, overlay, judul, aksi kembali dan area metadata mengikuti struktur contoh.

- [ ] **AV-UI-22** · `feat` · Melengkapi responsivitas form
  - **Selesai jika:** Form dapat digulir ketika keyboard terbuka; SafeArea dan ukuran layar kecil diperiksa.

- [ ] **AV-UI-23** · `feat` · Menampilkan elemen Forgot Password tahap UI
  - **Selesai jika:** Tautan sesuai contoh UI terlihat; pada target final ditandai belum tersedia dan tidak mengklaim mengirim email reset.

### AnimeVersev0.3.0 — Navigasi & data passing

- [ ] **AV-NAV-01** · `chore` · Menambahkan go_router
  - **Selesai jika:** Dependency terselesaikan dan router menjadi entry navigasi.

- [ ] **AV-NAV-02** · `feat` · Membuat route /signin
  - **Selesai jika:** SignInScreen dapat dibuka melalui GoRouter.

- [ ] **AV-NAV-03** · `feat` · Membuat route /signup
  - **Selesai jika:** SignUpScreen dapat dibuka melalui GoRouter.

- [ ] **AV-NAV-04** · `feat` · Membuat route /details/:animeId
  - **Selesai jika:** DetailScreen menerima animeId dari path parameter.

- [ ] **AV-NAV-05** · `feat` · Membuat ShellRoute Home
  - **Selesai jika:** HomeScreen hidup di dalam BottomNavigationShell.

- [ ] **AV-NAV-06** · `feat` · Membuat ShellRoute Favorite
  - **Selesai jika:** FavoriteScreen hidup di shell yang sama.

- [ ] **AV-NAV-07** · `feat` · Membuat ShellRoute Profile
  - **Selesai jika:** ProfileScreen hidup di shell yang sama.

- [ ] **AV-NAV-08** · `feat` · Menghubungkan AnimeCard ke DetailScreen
  - **Selesai jika:** Card mengirim malId anime yang dipilih, bukan ID hardcoded.

- [ ] **AV-NAV-09** · `feat` · Menghitung selected index bottom navigation tahap ShellRoute
  - **Selesai jika:** Tab aktif mengikuti route; setelah AV-NAV-17, currentIndex dari navigationShell menggantikan perhitungan manual.

- [ ] **AV-NAV-10** · `feat` · Menghubungkan tab Home
  - **Selesai jika:** Tap membuka Home tanpa menumpuk route yang tidak perlu.

- [ ] **AV-NAV-11** · `feat` · Menghubungkan tab Favorite
  - **Selesai jika:** Tap membuka Favorite dan mempertahankan shell.

- [ ] **AV-NAV-12** · `feat` · Menghubungkan tab Profile
  - **Selesai jika:** Tap membuka Profile dan mempertahankan shell.

- [ ] **AV-NAV-13** · `feat` · Menghubungkan link SignIn → SignUp
  - **Selesai jika:** Pengguna dapat berpindah ke form pendaftaran.

- [ ] **AV-NAV-14** · `feat` · Menghubungkan link SignUp → SignIn
  - **Selesai jika:** Pengguna dapat kembali ke login.

- [ ] **AV-NAV-15** · `test` · Menguji data passing animeId
  - **Selesai jika:** Anime yang dibuka di Detail sesuai card yang ditekan.

- [ ] **AV-NAV-16** · `refactor` · Mengganti ShellRoute menjadi StatefulShellRoute.indexedStack
  - **Selesai jika:** Tiga StatefulShellBranch menyimpan state Home, Favorite dan Profile ketika pindah tab.

- [ ] **AV-NAV-17** · `refactor` · Menggunakan StatefulNavigationShell pada shell
  - **Selesai jika:** Body memakai navigationShell, indeks dari currentIndex dan perpindahan memakai goBranch.

- [ ] **AV-NAV-18** · `feat` · Melindungi bottom navigation dengan SafeArea
  - **Selesai jika:** Bar tidak tertutup tombol navigasi sistem Android.

- [ ] **AV-NAV-19** · `test` · Menguji retensi tab
  - **Selesai jika:** Posisi scroll dan input pencarian bertahan setelah pindah tab lalu kembali.

- [ ] **AV-NAV-20** · `feat` · Menangani ID dan route tidak valid
  - **Selesai jika:** ID bukan bilangan positif ditolak tanpa request API; ID tidak ditemukan menampilkan pesan dan aksi kembali.

### AnimeVersev0.4.0 — Provider, favorite lokal, filter & search

- [ ] **AV-STATE-01** · `chore` · Menambahkan provider
  - **Selesai jika:** Provider tersedia sebagai state management global.

- [ ] **AV-STATE-02** · `feat` · Membuat AppStateProvider
  - **Selesai jika:** Single Source of Truth untuk anime UI state tersedia.

- [ ] **AV-STATE-03** · `feat` · Menambahkan favorites state
  - **Selesai jika:** Daftar favorite dapat dibaca lintas DetailScreen dan FavoriteScreen.

- [ ] **AV-STATE-04** · `feat` · Membuat isFavorite
  - **Selesai jika:** Status favorite ditentukan dari malId.

- [ ] **AV-STATE-05** · `feat` · Membuat toggleFavorite
  - **Selesai jika:** Anime dapat ditambah/dihapus favorite dan notifyListeners dipanggil.

- [ ] **AV-STATE-06** · `feat` · Menghubungkan tombol Love di DetailScreen
  - **Selesai jika:** Ikon berubah berdasarkan state provider.

- [ ] **AV-STATE-07** · `feat` · Menghubungkan FavoriteScreen ke provider
  - **Selesai jika:** Daftar favorit berubah instan setelah toggle di screen lain.

- [ ] **AV-STATE-08** · `chore` · Menambahkan shared_preferences
  - **Selesai jika:** Package persistensi lokal tersedia.

- [ ] **AV-STATE-09** · `feat` · Membuat loadFavorites dari SharedPreferences
  - **Selesai jika:** Favorite lokal dipulihkan saat aplikasi dibuka kembali.

- [ ] **AV-STATE-10** · `feat` · Membuat saveFavorites ke SharedPreferences
  - **Selesai jika:** List<Anime> diserialisasi ke bentuk yang dapat disimpan.

- [ ] **AV-STATE-11** · `feat` · Membuat Anime.toJson untuk favorite lokal
  - **Selesai jika:** Field yang diperlukan favorite dapat diserialisasi.

- [ ] **AV-STATE-12** · `feat` · Membuat Anime.fromFavoritesJson
  - **Selesai jika:** Favorite dapat dipulihkan dari data lokal.

- [ ] **AV-STATE-13** · `feat` · Menambahkan selectedGenre state
  - **Selesai jika:** Genre terpilih disimpan di provider.

- [ ] **AV-STATE-14** · `feat` · Menghubungkan GenreList ke selectedGenre
  - **Selesai jika:** Tap genre memperbarui filter Home.

- [ ] **AV-STATE-15** · `feat` · Membuat filteredAnime getter
  - **Selesai jika:** Daftar anime mengikuti genre yang dipilih.

- [ ] **AV-STATE-16** · `feat` · Menambahkan homeSearchQuery
  - **Selesai jika:** Query Home disimpan terpisah.

- [ ] **AV-STATE-17** · `feat` · Menambahkan favoriteSearchQuery
  - **Selesai jika:** Query Favorite disimpan terpisah.

- [ ] **AV-STATE-18** · `feat` · Menghubungkan search Home
  - **Selesai jika:** Input memfilter judul secara case-insensitive.

- [ ] **AV-STATE-19** · `feat` · Menghubungkan search Favorite
  - **Selesai jika:** Input hanya memfilter daftar favorit.

- [ ] **AV-STATE-20** · `test` · Menguji favorite lintas screen
  - **Selesai jika:** Toggle pada detail langsung memengaruhi FavoriteScreen.

- [ ] **AV-STATE-21** · `test` · Menguji persistensi favorite lokal
  - **Selesai jika:** Restart provider memulihkan favorite dari SharedPreferences.

- [ ] **AV-STATE-22** · `test` · Menguji kombinasi genre dan search
  - **Selesai jika:** Filter tidak menghasilkan item yang tidak sesuai.

- [ ] **AV-STATE-23** · `feat` · Mengelola lifecycle controller pencarian
  - **Selesai jika:** Controller diinisialisasi sekali, selaras dengan state query, lalu di-dispose.

- [ ] **AV-STATE-24** · `test` · Menangani JSON favorit lokal rusak
  - **Selesai jika:** Aplikasi memberi pemberitahuan pemulihan terkontrol dan tidak crash; data rusak tidak diam-diam dianggap hasil cloud.

### AnimeVersev0.5.0 — Jikan API & Repository Pattern

- [ ] **AV-API-01** · `chore` · Menambahkan package http
  - **Selesai jika:** HTTP client tersedia untuk request REST.

- [ ] **AV-API-02** · `docs` · Mencatat base URL Jikan API
  - **Selesai jika:** Endpoint eksternal terdokumentasi dan tidak disebar sebagai string acak di widget.

- [ ] **AV-API-03** · `feat` · Membuat Anime.fromJson Jikan
  - **Selesai jika:** JSON response dapat dipetakan ke model Anime.

- [ ] **AV-API-04** · `feat` · Membuat AnimeRepository
  - **Selesai jika:** Akses Jikan dipisahkan dari UI.

- [ ] **AV-API-05** · `feat` · Membuat request top anime
  - **Selesai jika:** Repository dapat mengambil daftar anime dari endpoint top anime.

- [ ] **AV-API-06** · `feat` · Membuat request detail anime
  - **Selesai jika:** Repository dapat mengambil detail berdasarkan malId.

- [ ] **AV-API-07** · `feat` · Membuat request search anime
  - **Selesai jika:** Repository dapat mencari anime berdasarkan query.

- [ ] **AV-API-08** · `feat` · Memeriksa status HTTP
  - **Selesai jika:** Response non-success dipetakan menjadi failure terkontrol.

- [ ] **AV-API-09** · `feat` · Menangani JSON malformed/field null
  - **Selesai jika:** Parsing tidak mengasumsikan semua field Jikan selalu lengkap.

- [ ] **AV-API-10** · `refactor` · Menghapus DummyData dari Home runtime
  - **Selesai jika:** Home mengambil sumber data melalui repository.

- [ ] **AV-API-11** · `refactor` · Menghapus data detail hardcoded
  - **Selesai jika:** Detail meminta data berdasarkan animeId.

- [ ] **AV-API-12** · `feat` · Menambahkan loading state API
  - **Selesai jika:** Home/Detail menunjukkan proses request.

- [ ] **AV-API-13** · `feat` · Menambahkan error state API
  - **Selesai jika:** Kegagalan jaringan dapat dipulihkan tanpa crash.

- [ ] **AV-API-14** · `feat` · Menghubungkan pencarian Home ke Jikan
  - **Selesai jika:** Pada fase API, query Home memakai AnimeRepository dan debounce; pencarian Favorite tetap lokal pada koleksi favorite.

- [ ] **AV-API-15** · `test` · Menguji parsing sample top anime
  - **Selesai jika:** Model terbentuk dari JSON contoh.

- [ ] **AV-API-16** · `test` · Menguji parsing detail anime
  - **Selesai jika:** Detail penting tidak salah mapping.

- [ ] **AV-API-17** · `chore` · Menambahkan cached_network_image
  - **Selesai jika:** Poster Home, Detail dan Favorite menggunakan gambar jaringan dengan placeholder dan fallback.

- [ ] **AV-API-18** · `feat` · Melengkapi metadata model Anime
  - **Selesai jika:** largeImageUrl, episodes, type, year, status dan ageRating dipetakan selain enam field dasar; nilai opsional boleh null.

- [ ] **AV-API-19** · `feat` · Membuat isAppropriateContent
  - **Selesai jika:** Rating berawalan Rx ditolak sesuai contoh modul; rating tidak tersedia tidak dianggap jaminan kelayakan.

- [ ] **AV-API-20** · `feat` · Menerapkan penyaringan konten katalog
  - **Selesai jika:** Filter model diterapkan sebelum item ditampilkan dan saat membuka detail; kebijakan konsisten pada hasil search dan pagination.

- [ ] **AV-API-21** · `feat` · Menambahkan debounce pencarian Home
  - **Selesai jika:** Permintaan dikirim setelah jeda 500 ms sejak perubahan terakhir; timer lama dibatalkan.

- [ ] **AV-API-22** · `feat` · Mengelola state pagination
  - **Selesai jika:** currentPage, hasMore dan isLoadingMore dipisahkan dari loading awal.

- [ ] **AV-API-23** · `feat` · Membuat loadMoreAnime
  - **Selesai jika:** Halaman berikut ditambahkan tanpa duplikasi malId dan hanya jika hasMore serta tidak sedang memuat.

- [ ] **AV-API-24** · `feat` · Menghubungkan infinite scroll
  - **Selesai jika:** ScrollController memicu loadMore saat mendekati akhir dan dibersihkan pada dispose.

- [ ] **AV-API-25** · `feat` · Membuat pull-to-refresh
  - **Selesai jika:** RefreshIndicator memuat halaman pertama dan mereset pagination sesuai mode query aktif.

- [ ] **AV-API-26** · `feat` · Menampilkan loading halaman berikut
  - **Selesai jika:** Indikator muncul di bawah list tanpa menyembunyikan data yang sudah dimuat.

- [ ] **AV-API-27** · `feat` · Mengendalikan request dan rate limit
  - **Selesai jika:** Request beruntun diberi jeda; HTTP 429 menampilkan keadaan menunggu dan tidak memicu retry tanpa batas.

- [ ] **AV-API-28** · `feat` · Menggunakan cache list untuk detail
  - **Selesai jika:** Cari malId di list yang sudah tersedia; request detail hanya jika belum tersedia atau perlu disegarkan.

- [ ] **AV-API-29** · `fix` · Mencegah respons pencarian lama menimpa yang baru
  - **Selesai jika:** Hanya respons dengan identitas query aktif boleh mengubah list, error dan loading.

- [ ] **AV-API-30** · `test` · Menguji pagination dan reset query
  - **Selesai jika:** Page 2 ditambahkan sekali, akhir data berhenti, query baru kembali ke page 1.

- [ ] **AV-API-31** · `test` · Menguji filter konten dan detail di luar Home
  - **Selesai jika:** Item Rx tidak ditampilkan; malId valid di luar list dimuat melalui repository.

### AnimeVersev0.6.0 — Firebase Authentication

- [ ] **AV-AUTH-01** · `chore` · Membuat project Firebase AnimeVerse
  - **Selesai jika:** Project Firebase yang dipakai tim terdokumentasi.

- [ ] **AV-AUTH-02** · `chore` · Mendaftarkan aplikasi Android
  - **Selesai jika:** Package name cocok dengan aplikasi Flutter.

- [ ] **AV-AUTH-03** · `chore` · Menambahkan google-services.json
  - **Selesai jika:** Konfigurasi Android tersedia pada lokasi yang benar.

- [ ] **AV-AUTH-04** · `chore` · Menambahkan firebase_core
  - **Selesai jika:** Firebase dapat diinisialisasi sebelum runApp.

- [ ] **AV-AUTH-05** · `chore` · Menambahkan firebase_auth
  - **Selesai jika:** Firebase Authentication tersedia.

- [ ] **AV-AUTH-06** · `chore` · Menambahkan google_sign_in
  - **Selesai jika:** Google login dependency tersedia.

- [ ] **AV-AUTH-07** · `chore` · Mengaktifkan Email/Password provider
  - **Selesai jika:** Provider aktif di Firebase Console.

- [ ] **AV-AUTH-08** · `chore` · Mengaktifkan Google provider
  - **Selesai jika:** Provider Google aktif di Firebase Console.

- [ ] **AV-AUTH-09** · `chore` · Mendaftarkan debug SHA-1/SHA-256
  - **Selesai jika:** Google sign-in debug mengenali aplikasi.

- [ ] **AV-AUTH-10** · `feat` · Membuat AuthService
  - **Selesai jika:** Operasi Firebase Authentication berada pada lib/services/auth/auth_service.dart; UI mengaksesnya melalui AuthProvider.

- [ ] **AV-AUTH-11** · `feat` · Membuat signUpWithEmail
  - **Selesai jika:** Email/password dapat membuat user Firebase.

- [ ] **AV-AUTH-12** · `feat` · Membuat signInWithEmail
  - **Selesai jika:** User dapat login dengan akun yang valid.

- [ ] **AV-AUTH-13** · `feat` · Membuat signInWithGoogle
  - **Selesai jika:** Google account menghasilkan Firebase User.

- [ ] **AV-AUTH-14** · `feat` · Membuat signOut
  - **Selesai jika:** Session Firebase dapat diakhiri.

- [ ] **AV-AUTH-15** · `feat` · Mendengarkan authStateChanges
  - **Selesai jika:** UI mengetahui perubahan session tanpa polling.

- [ ] **AV-AUTH-16** · `feat` · Menghubungkan SignUpScreen
  - **Selesai jika:** Loading dan error auth ditampilkan.

- [ ] **AV-AUTH-17** · `feat` · Menghubungkan SignInScreen email/password
  - **Selesai jika:** Form memanggil service dan menangani failure.

- [ ] **AV-AUTH-18** · `feat` · Menghubungkan SignInScreen Google
  - **Selesai jika:** Tombol Google menjalankan flow yang benar.

- [ ] **AV-AUTH-19** · `feat` · Menghubungkan ProfileScreen ke Firebase User
  - **Selesai jika:** Email/display name/photo memakai user login jika tersedia.

- [ ] **AV-AUTH-20** · `feat` · Menghubungkan logout ProfileScreen
  - **Selesai jika:** Logout mengubah route/session secara konsisten.

- [ ] **AV-AUTH-21** · `feat` · Menambahkan auth redirect/guard
  - **Selesai jika:** User unauthenticated diarahkan sesuai flow modul.

- [ ] **AV-AUTH-22** · `test` · Menguji mapping error auth
  - **Selesai jika:** Wrong password, invalid email, existing email, dan failure lain tidak ditampilkan sebagai exception mentah.

- [ ] **AV-AUTH-23** · `feat` · Membuat validators.dart
  - **Selesai jika:** Email wajib berformat sesuai validasi form dan password memenuhi kebijakan Firebase proyek; input invalid tidak dikirim.

- [ ] **AV-AUTH-24** · `feat` · Membuat snackbar_helper.dart
  - **Selesai jika:** Sukses dan kegagalan ditampilkan konsisten tanpa membocorkan exception mentah.

- [ ] **AV-AUTH-25** · `feat` · Membuat AuthProvider
  - **Selesai jika:** State inisialisasi, user, loading dan error menghubungkan AuthService dengan UI.

- [ ] **AV-AUTH-26** · `test` · Menguji pembatalan Google Sign-In
  - **Selesai jika:** Membatalkan pemilih akun mengembalikan tombol ke keadaan siap dan tidak membuat sesi palsu.

- [ ] **AV-AUTH-27** · `test` · Menguji redirect saat sesi dipulihkan
  - **Selesai jika:** Loading sesi tidak memunculkan halaman privat sesaat; login/logout memperbarui router tanpa loop.

### AnimeVersev0.7.0 — Integrasi aplikasi pre-database

- [ ] **AV-INT-01** · `refactor` · Menyatukan provider pada composition root
  - **Selesai jika:** AppStateProvider tersedia untuk seluruh screen yang memerlukan.

- [ ] **AV-INT-02** · `refactor` · Menyatukan AuthService pada app layer
  - **Selesai jika:** Screen tidak membuat FirebaseAuth instance sendiri.

- [ ] **AV-INT-03** · `refactor` · Menyatukan AnimeRepository pada app layer
  - **Selesai jika:** Home/Detail memakai dependency yang konsisten.

- [ ] **AV-INT-04** · `feat` · Menjaga favorites lokal setelah login
  - **Selesai jika:** Pada v1 favorite masih device-local dan keterbatasan ini didokumentasikan.

- [ ] **AV-INT-05** · `feat` · Membersihkan state query saat perlu
  - **Selesai jika:** Search Home/Favorite tidak bocor ke screen yang salah.

- [ ] **AV-INT-06** · `feat` · Menangani image network gagal
  - **Selesai jika:** Poster memiliki fallback yang tidak merusak layout.

- [ ] **AV-INT-07** · `feat` · Menangani hasil API kosong
  - **Selesai jika:** UI menunjukkan empty state, bukan error palsu.

- [ ] **AV-INT-08** · `feat` · Menangani synopsis kosong
  - **Selesai jika:** Detail tetap stabil jika field tidak tersedia.

- [ ] **AV-INT-09** · `test` · Menguji alur sign in → home → detail → favorite
  - **Selesai jika:** Alur utama v1 selesai tanpa Firestore.

- [ ] **AV-INT-10** · `test` · Menguji logout dan login ulang
  - **Selesai jika:** Session auth berubah; favorite tetap mengikuti storage lokal v1.

### AnimeVersev0.8.0 — QA & hardening v1

- [ ] **AV-QA-01** · `test` · Menjalankan dart format check
  - **Selesai jika:** Source utama tidak memerlukan perubahan format.

- [ ] **AV-QA-02** · `test` · Menjalankan flutter analyze
  - **Selesai jika:** Tidak ada analyzer error.

- [ ] **AV-QA-03** · `test` · Menjalankan flutter test
  - **Selesai jika:** Test yang tersedia lulus.

- [ ] **AV-QA-04** · `test` · Menguji loading Home
  - **Selesai jika:** Tidak ada blank screen saat API menunggu.

- [ ] **AV-QA-05** · `test` · Menguji API offline
  - **Selesai jika:** Failure dapat dipahami pengguna.

- [ ] **AV-QA-06** · `test` · Menguji favorite kosong
  - **Selesai jika:** FavoriteScreen aman saat tidak ada item.

- [ ] **AV-QA-07** · `test` · Menguji pencarian tanpa hasil
  - **Selesai jika:** Home/Favorite memiliki empty state.

- [ ] **AV-QA-08** · `test` · Menguji navigasi back Detail
  - **Selesai jika:** Kembali tidak merusak selected tab.

- [ ] **AV-QA-09** · `test` · Menguji login invalid
  - **Selesai jika:** Form tetap aktif dan error jelas.

- [ ] **AV-QA-10** · `test` · Menguji ukuran layar target
  - **Selesai jika:** Tidak ada overflow pada screen utama.

### AnimeVersev0.9.0 — Dokumentasi baseline v1

- [ ] **AV-DOC-01** · `docs` · Mendokumentasikan struktur folder
  - **Selesai jika:** README mencerminkan folder aktual.

- [ ] **AV-DOC-02** · `docs` · Mendokumentasikan dependency
  - **Selesai jika:** Seluruh package pada Setup_Developer.md dicatat dengan versi aktual dari pubspec.lock dan alasan pemakaiannya.

- [ ] **AV-DOC-03** · `docs` · Mendokumentasikan Jikan API
  - **Selesai jika:** Endpoint dan batas bahwa Jikan adalah sumber katalog eksternal dijelaskan.

- [ ] **AV-DOC-04** · `docs` · Mendokumentasikan favorite lokal v1
  - **Selesai jika:** Favorite masih SharedPreferences dan belum mengikuti akun lintas perangkat.

- [ ] **AV-DOC-05** · `docs` · Mendokumentasikan setup Firebase Auth
  - **Selesai jika:** Langkah yang dibutuhkan developer baru tersedia.

- [ ] **AV-DOC-06** · `docs` · Mendokumentasikan transisi ke v2
  - **Selesai jika:** Cloud Firestore ditetapkan sebagai fokus versi berikutnya.

- [ ] **AV-DOC-07** · `docs` · Menyelaraskan spesifikasi dan bukti implementasi
  - **Selesai jika:** SRS, matriks modul, kontrak data, setup dan pengujian diperbarui berdasarkan kode aktual; nilai toolchain tidak diisi dengan perkiraan.

### AnimeVersev1.0.0 — Functional pre-Firestore baseline

- [ ] **AV-GATE1-01** · `test` · Memastikan Home memakai Jikan API
  - **Selesai jika:** Tidak ada DummyData pada runtime utama.

- [ ] **AV-GATE1-02** · `test` · Memastikan Detail berdasarkan malId
  - **Selesai jika:** Anime yang dipilih menghasilkan detail yang benar.

- [ ] **AV-GATE1-03** · `test` · Memastikan genre dan search berfungsi
  - **Selesai jika:** Filter/search tidak lagi statis.

- [ ] **AV-GATE1-04** · `test` · Memastikan favorite global berfungsi
  - **Selesai jika:** Detail dan FavoriteScreen berbagi state.

- [ ] **AV-GATE1-05** · `test` · Memastikan favorite lokal persist
  - **Selesai jika:** Restart mempertahankan data SharedPreferences.

- [ ] **AV-GATE1-06** · `test` · Memastikan Firebase Auth berfungsi
  - **Selesai jika:** Email/password dan Google login tervalidasi pada debug.

- [ ] **AV-GATE1-07** · `docs` · Mencatat batas v1
  - **Selesai jika:** Favorite belum terisolasi per Firebase UID dan belum sinkron cloud.

- [ ] **AV-GATE1-08** · `chore` · Membuat tag AnimeVersev1.0.0
  - **Selesai jika:** Seluruh task aktif v1 lulus, termasuk stateful tab, pagination, refresh, debounce dan filter konten; pubspec memuat 1.0.0+build aktual sebelum tag.

## Dokumen pendamping

Gunakan [template Issue](templates/Issue.md), [template PR](templates/Pull_Request.md) dan [catatan bukti](templates/Catatan_Bukti.md). Perubahan keputusan dicatat pada [Keputusan_Proyek.md](Keputusan_Proyek.md).
