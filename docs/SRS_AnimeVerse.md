# SRS AnimeVerse

Versi dokumentasi: revisi 1. Cakupan: target aplikasi v1 dan v2. Status: spesifikasi untuk diimplementasikan, belum hasil verifikasi aplikasi.

## 1. Tujuan dan pengguna

AnimeVerse adalah aplikasi katalog anime untuk belajar membangun aplikasi Flutter dari UI statis hingga layanan cloud. Pengguna dapat mencari anime, membuka detail dan mengelola favorit. Pengguna yang belum masuk mengakses halaman autentikasi; setelah Firebase Auth terintegrasi, Home, Detail, Favorite dan Profile memerlukan sesi. Pengembang menjalankan konfigurasi dan pengujian; tidak ada peran admin dalam aplikasi.

Sumber kebutuhan utama: Modul I-VIII. Rujukan nomor PDF tersedia pada [matriks](Matriks_Modul.md). M berarti materi modul; T berarti rincian keputusan atau tambahan tim. SRS ini tidak menyatakan semua kebutuhan sebagai kewajiban penilaian dosen.

## 2. Tahapan dan batas sistem

| Tahap | Perilaku yang diharapkan |
| --- | --- |
| Modul I | Login statis sebagai challenge; belum ada panggilan autentikasi |
| Modul II | Enam layar dan reusable widget dengan aset serta dummy data |
| Modul III | go_router, parameter detail, tiga tab, lalu stateful shell |
| Modul IV | Provider, favorit lokal persisten, genre dan search lokal |
| Modul V | Katalog API, search API, pagination, refresh, gambar jaringan dan error handling |
| Modul VI / v1 final | Email/password, Google, profil, logout, session redirect; favorit masih device-local |
| Modul VII | Favorit Firestore per UID menggantikan favorit lokal pada runtime |
| Modul VIII / v2 final | Rules owner-only, ikon/splash, signing, build dan CI/GitHub Release |

Jikan menyediakan katalog baca-saja. Firebase Auth menyediakan identitas. Firestore menyimpan snapshot favorit pengguna. Menekan favorit tidak mengubah akun MyAnimeList dan tidak menyalin seluruh katalog ke Firestore.

## 3. Kebutuhan fungsional

| ID | Kebutuhan dan acceptance minimum | Tahap / asal |
| --- | --- | --- |
| FR-01 | Login statis memiliki email, password, tombol Login dan teks Register; bukti pengumpulan dicatat | I / M |
| FR-02 | Sign In, Sign Up, Home, Detail, Favorite dan Profile mengikuti susunan visual contoh modul | II / M |
| FR-03 | Background, GenreList, AnimeCard, AnimeView, FavoriteAnimeCard dan shell dapat dipakai ulang | II-III / M |
| FR-04 | Home, Favorite dan Profile berada pada tiga branch stateful; input dan scroll bertahan ketika pindah tab | III / M |
| FR-05 | Detail menerima animeId dari route; setiap kartu mengirim ID anime yang benar | III-IV / M |
| FR-06 | ID tidak valid tidak crash; ID tidak ditemukan menampilkan pesan dan aksi kembali | III-V / T |
| FR-07 | Toggle favorit memperbarui Detail dan Favorite melalui state bersama berdasarkan malId | IV / M |
| FR-08 | Favorit v1 dipulihkan setelah aplikasi dibuka kembali menggunakan serialisasi SharedPreferences | IV / M |
| FR-09 | Genre dan query Home dikombinasikan; query Favorite hanya menyaring favorit; case-insensitive pada filter lokal | IV / M |
| FR-10 | Home fase API meminta katalog Jikan melalui repository; dummy tidak menjadi data runtime final | V / M |
| FR-11 | Search Home memakai API dengan debounce 500 ms; query baru memulai hasil dari page 1 | V / M+T |
| FR-12 | Infinite scroll menambah halaman; loading-more terpisah, duplicate ID dicegah dan akhir data berhenti | V / M+T |
| FR-13 | Pull-to-refresh menyegarkan halaman pertama dan mereset pagination; mode query dijaga sesuai K-08 | V / M+T |
| FR-14 | Detail memakai data list jika ada; jika belum ada, repository mengambil data berdasarkan ID | V / M |
| FR-15 | Model membawa 12 properti pada kontrak data; field opsional null tidak menyebabkan crash | V / M |
| FR-16 | Poster jaringan menggunakan cached_network_image; Home, Detail dan Favorite memiliki placeholder/fallback | V / M |
| FR-17 | Helper isAppropriateContent dan penyaringan rating Rx mengikuti materi; tidak mengklaim semua data pasti layak | V / M+T |
| FR-18 | Form Sign Up memvalidasi input, membuat akun email/password dan menangani loading/error | VI / M |
| FR-19 | Sign In email/password masuk dengan akun valid; kegagalan ditampilkan tanpa exception mentah | VI / M |
| FR-20 | Sign In Google menghasilkan sesi Firebase; pembatalan kembali ke keadaan siap | VI / M+T |
| FR-21 | AuthProvider mengikuti perubahan sesi; route privat dilindungi dan pemulihan sesi memiliki keadaan menunggu | VI / M+T |
| FR-22 | Profile memakai data user yang tersedia; fallback untuk nama/foto kosong; logout mengakhiri sesi | VI / M+T |
| FR-23 | Favorit v2 berada di users/{uid}/favorites/{malId}, dengan satu dokumen per anime per akun | VII / M |
| FR-24 | Add/remove favorit v2 melalui service; stream cloud memperbarui UI tanpa restart | VII / M |
| FR-25 | Logout/ganti akun membatalkan listener lama dan mengosongkan state visual sebelum akun berikutnya dimuat | VII / M+T |
| FR-26 | User hanya boleh read/create/update/delete favorit UID sendiri; unauthenticated dan cross-user ditolak oleh rules | VIII / M |
| FR-27 | UI membedakan awal loading, koleksi kosong, hasil pencarian kosong, error dan pending sinkronisasi | IV-VII / M+T |
| FR-28 | v2 tidak membaca/menulis favorit SharedPreferences pada runtime; tidak mengimpor data lama secara otomatis | VII / M+T |
| FR-29 | Ikon dan native splash custom tampil pada build terpasang, termasuk cold start | VIII / M |
| FR-30 | APK release menggunakan signing yang ditetapkan; login Google diuji pada APK tersebut | VIII / M |
| FR-31 | Tag, versi pubspec, workflow, artifact dan GitHub Release menunjuk versi/commit yang sama | VIII / M+T |
| FR-32 | Forgot Password dan menu profil yang belum didukung tidak menjalankan keberhasilan palsu; reset penuh di luar baseline | II / T |

## 4. Perilaku layar

| Layar | Isi dan aksi | Keadaan yang wajib dibedakan |
| --- | --- | --- |
| Sign In | Email, password tersembunyi, Sign In, Google, link Sign Up; Forgot Password mengikuti FR-32 | Validasi lokal, submitting, gagal, batal Google, sukses |
| Sign Up | Field pendaftaran sesuai referensi, tombol daftar dan link Sign In; jalur Google memakai service yang sama bila ditampilkan | Invalid, submitting, email sudah dipakai, sukses |
| Home | Judul, search, genre, grid anime, akses detail, infinite scroll dan refresh | Loading awal, data, hasil kosong, error awal, loading-more, error-more |
| Detail | Poster besar, judul, skor, genre, episode/jenis/tahun/status/rating bila tersedia, sinopsis, favorit dan kembali | Lookup/list, loading detail, not found, error, siap, mutation favorite |
| Favorite | Search dan kartu koleksi; tap kartu menuju detail | Loading awal v2, belum ada favorit, search tanpa hasil, data cache, pending, error |
| Profile | Nama/email/foto bila tersedia, fallback dan Logout | Loading sesi, pengguna tersedia, logout berlangsung/gagal |

Kartu favorit tidak menampilkan nilai null sebagai teks. Skor yang tidak tersedia ditulis “Belum ada skor”, bukan angka nol buatan. Episode belum diketahui ditulis “Belum diketahui”. Sinopsis kosong diberi penjelasan singkat. Pemilihan teks tersebut merupakan keputusan presentasi tim.

## 5. Use case utama

### UC-01: Masuk dan menjelajahi anime

Prasyarat: Firebase telah dikonfigurasi. Pengguna mengisi akun atau memilih Google, aplikasi memvalidasi dan memulai proses masuk, lalu AuthProvider menerima user dan router menuju Home. Home mengambil katalog. Jika gagal, form tetap dapat digunakan dan pesan sesuai sebab ditampilkan; tidak ada sesi buatan.

### UC-02: Mencari lalu membaca detail

Pengguna mengetik query. Timer sebelumnya dibatalkan dan request baru dikirim setelah 500 ms. List menampilkan query aktif; respons lama tidak boleh menimpa hasil terbaru. Pengguna memilih kartu dan malId diteruskan ke detail. Data dari list dipakai jika ada; request detail menjadi fallback. Data tidak ditemukan berbeda dari tidak ada koneksi.

### UC-03: Menyimpan favorit v1

Pada detail, pengguna menekan favorit. AppStateProvider mengubah list dan menyimpan snapshot ke SharedPreferences. FavoriteScreen membaca state yang sama. Setelah restart data dipulihkan. Login akun berbeda pada perangkat yang sama tidak menjadikan data v1 terpisah; batas ini wajib disebut saat demo.

### UC-04: Menyimpan favorit v2

Prasyarat: user Firebase valid. Provider memakai UID sesi aktif, service menulis snapshot pada document ID malId, lalu stream mengubah state yang ditampilkan. Penekanan ulang tidak membuat duplikasi. UI menampilkan write pending ketika server belum mengonfirmasi; penolakan rules tidak ditampilkan sebagai sukses tersimpan.

### UC-05: Logout atau berganti akun

Saat user berubah, subscription lama dibatalkan, favorite/query khusus akun dibersihkan, lalu stream UID baru dimulai. Snapshot yang terlambat dari UID lama diabaikan. Akun B tidak melihat data akun A, termasuk sesaat saat transisi.

### UC-06: Build dan penyerahan

Pengembang menyelesaikan quality gate, menyiapkan signing, menguji APK release, lalu mencatat commit/versi/hash. Workflow memakai tag yang sesuai dan melampirkan artifact ke GitHub Release. Dokumen mencatat bukti aktual; tidak menyatakan rules sudah aktif hanya dari teks template release notes.

## 6. Kebutuhan nonfungsional

| ID | Target yang dapat diperiksa |
| --- | --- |
| NFR-01 | Android adalah target uji. Tidak ada overflow pada ukuran perangkat yang dicatat, keyboard terbuka dan navigasi sistem tiga tombol |
| NFR-02 | Layer UI tidak memuat query Firestore mentah atau parsing JSON Jikan; perilaku tersebut diuji di service/repository |
| NFR-03 | Request jaringan asinkron; loading berakhir pada sukses maupun gagal; timeout dan retry terkendali |
| NFR-04 | Controller, Timer dan subscription dibersihkan; callback setelah dispose/ganti sesi tidak mengubah UI |
| NFR-05 | Password, token, keystore dan kredensial signing tidak masuk log, source atau bukti publik |
| NFR-06 | Rules membatasi akses data di backend; auth redirect UI bukan pengganti rules |
| NFR-07 | SDK/lockfile/config dan langkah build dicatat agar anggota lain dapat mereproduksi proses |
| NFR-08 | Tombol bergambar memiliki label yang dapat dipahami; input memiliki label, password disamarkan dan error tidak bergantung warna saja |
| NFR-09 | Tidak ada angka performa, uptime, ukuran APK atau cakupan test yang diklaim tanpa pengukuran |

NFR yang memperjelas keandalan, aksesibilitas dan reproduksibilitas adalah tambahan tim. Tidak ada SLA produksi yang disepakati.

## 7. Gate penerimaan

v1 diterima bila FR-01 sampai FR-22 yang relevan telah diuji, FR-27 pada lokal/API terpenuhi, batas FR-32 jelas, dan seluruh task aktif v1 selesai dengan bukti. v2 mempertahankan perilaku UI/API/Auth, mengganti mekanisme favorit sesuai FR-23..31, serta memenuhi task aktif v2. Tiga task import opsional tidak menghalangi baseline v2. Hasil pengujian dan bukti pengumpulan tetap harus diisi dari eksekusi nyata.
