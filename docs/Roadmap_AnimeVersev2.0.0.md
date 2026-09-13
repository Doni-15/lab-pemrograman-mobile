# Roadmap Implementasi - AnimeVerse v2

**Target: AnimeVersev2.0.0**  
**Cakupan: Modul VII-VIII: favorite cloud, finishing dan release**  
**Total: 105 task; aktif 102; opsional di luar baseline 3.**

Status seluruh task adalah **TODO / belum diverifikasi dari kode**. Dokumen yang sudah ditulis bukan bukti bahwa task proyek selesai. Nomor versi dan pembagian milestone adalah konvensi tim dari ZIP awal, bukan ketentuan nomor versi dari modul.

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
| AnimeVersev1.1.0 | Firestore bootstrap | 8 |
| AnimeVersev1.2.0 | FirestoreService favorite | 11 |
| AnimeVersev1.3.0 | Migrasi AppStateProvider ke Firestore | 13 |
| AnimeVersev1.4.0 | Real-time UI integration | 10 |
| AnimeVersev1.5.0 | Migration & account isolation | 7 |
| AnimeVersev1.6.0 | Firestore Security Rules | 10 |
| AnimeVersev1.7.0 | Error, lifecycle & offline behavior | 8 |
| AnimeVersev1.8.0 | Finishing UI, icon & splash | 6 |
| AnimeVersev1.9.0 | Release signing & GitHub Actions | 19 |
| AnimeVersev2.0.0 | Cloud favorite release | 13 |

## Checklist detail

### AnimeVersev1.1.0 — Firestore bootstrap

- [ ] **AV2-FB-01** · `chore` · Mengaktifkan Cloud Firestore
  - **Selesai jika:** Database tersedia pada project Firebase AnimeVerse yang sama dengan Authentication.
  - Asal: M+T · PDF: 146-153 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-FB-02** · `chore` · Menambahkan cloud_firestore
  - **Selesai jika:** Dependency terselesaikan dan aplikasi tetap dapat dibangun.
  - Asal: M+T · PDF: 146-153 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-FB-03** · `feat` · Menginisialisasi Firestore melalui Firebase yang sudah aktif
  - **Selesai jika:** Tidak ada Firebase app kedua yang tidak perlu.
  - Asal: M+T · PDF: 146-153 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-FB-04** · `docs` · Mendokumentasikan model data users/{uid}/favorites
  - **Selesai jika:** Favorite terisolasi per UID.
  - Asal: M+T · PDF: 146-153 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-FB-05** · `docs` · Menetapkan malId sebagai document ID favorite
  - **Selesai jika:** Anime yang sama tidak menghasilkan dokumen duplikat.
  - Asal: M+T · PDF: 146-153 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-FB-06** · `docs` · Menentukan field favorite yang disimpan
  - **Selesai jika:** Data cukup untuk FavoriteScreen tanpa menyimpan response Jikan mentah seluruhnya.
  - Asal: M+T · PDF: 146-153 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-FB-07** · `chore` · Membuat firestore.rules di repository
  - **Selesai jika:** Rules dapat direview sebagai code.
  - Asal: M+T · PDF: 146-153 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-FB-08** · `chore` · Membuat konfigurasi emulator/rules test bila dipakai
  - **Selesai jika:** Security dapat diuji tanpa menulis data produksi.
  - Asal: M+T · PDF: 146-153 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

### AnimeVersev1.2.0 — FirestoreService favorite

- [ ] **AV2-DB-01** · `feat` · Membuat FirestoreService
  - **Selesai jika:** Seluruh operasi favorite Firestore berada pada service khusus.
  - Asal: M+T · PDF: 153-156 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-DB-02** · `feat` · Membuat reference users/{uid}/favorites
  - **Selesai jika:** Path selalu berasal dari authenticated UID.
  - Asal: M+T · PDF: 153-156 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-DB-03** · `feat` · Membuat favoritesStream
  - **Selesai jika:** QuerySnapshot dipetakan menjadi List<Anime>.
  - Asal: M+T · PDF: 153-156 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-DB-04** · `feat` · Membuat addFavorite
  - **Selesai jika:** Dokumen menggunakan .doc(anime.malId.toString()).set(...).
  - Asal: M+T · PDF: 153-156 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-DB-05** · `feat` · Membuat removeFavorite
  - **Selesai jika:** Dokumen anime yang sesuai dapat dihapus.
  - Asal: M+T · PDF: 153-156 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-DB-06** · `feat` · Membuat Anime.toJson untuk favorite
  - **Selesai jika:** Serializer snapshot datar konsisten dengan Kontrak_Data_API.md; mal_id berupa integer dan sesuai document ID.
  - Asal: M+T · PDF: 153-156 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-DB-07** · `feat` · Membuat Anime.fromFavoritesJson
  - **Selesai jika:** DocumentSnapshot dapat dikonversi kembali menjadi Anime.
  - Asal: M+T · PDF: 153-156 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-DB-08** · `feat` · Menangani user null
  - **Selesai jika:** Operasi Firestore favorite tidak berjalan tanpa session.
  - Asal: M+T · PDF: 153-156 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-DB-09** · `feat` · Memetakan FirebaseException
  - **Selesai jika:** UI/provider menerima error yang dapat ditangani.
  - Asal: M+T · PDF: 153-156 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-DB-10** · `test` · Menguji add favorite idempotent
  - **Selesai jika:** Menambah anime sama berulang kali tetap satu document ID.
  - Asal: M+T · PDF: 153-156 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-DB-11** · `test` · Menguji remove favorite
  - **Selesai jika:** Document yang dihapus hilang dari stream.
  - Asal: M+T · PDF: 153-156 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

### AnimeVersev1.3.0 — Migrasi AppStateProvider ke Firestore

- [ ] **AV2-STATE-01** · `refactor` · Menghapus ketergantungan SharedPreferences favorite
  - **Selesai jika:** Favorite cloud tidak lagi dibaca/disimpan dari storage lokal.
  - Asal: M+T · PDF: 156-161 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-STATE-02** · `refactor` · Menghapus loadFavorites lokal
  - **Selesai jika:** Provider tidak melakukan jsonDecode favorite lokal pada path v2.
  - Asal: M+T · PDF: 156-161 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-STATE-03** · `refactor` · Menghapus saveFavorites lokal
  - **Selesai jika:** Provider tidak menulis favorite ke SharedPreferences.
  - Asal: M+T · PDF: 156-161 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-STATE-04** · `feat` · Menambahkan FirestoreService ke AppStateProvider
  - **Selesai jika:** Dependency diinjeksi, bukan dibuat berulang di widget.
  - Asal: M+T · PDF: 156-161 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-STATE-05** · `feat` · Mendengarkan favoritesStream setelah login
  - **Selesai jika:** Favorite cloud menjadi SSOT per user.
  - Asal: M+T · PDF: 156-161 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-STATE-06** · `feat` · Menyimpan StreamSubscription favorite
  - **Selesai jika:** Listener dapat dibatalkan dengan benar.
  - Asal: M+T · PDF: 156-161 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-STATE-07** · `feat` · Membatalkan listener saat logout
  - **Selesai jika:** Data user lama tidak tertinggal pada session berikutnya.
  - Asal: M+T · PDF: 156-161 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-STATE-08** · `feat` · Memulai listener baru saat user berubah
  - **Selesai jika:** Favorite mengikuti UID aktif.
  - Asal: M+T · PDF: 156-161 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-STATE-09** · `refactor` · Mengubah toggleFavorite menjadi async
  - **Selesai jika:** Add/remove Firestore ditunggu dan error dapat dipetakan.
  - Asal: M+T · PDF: 156-161 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-STATE-10** · `feat` · Mempertahankan isFavorite berdasarkan list stream
  - **Selesai jika:** UI Love tetap reaktif.
  - Asal: M+T · PDF: 156-161 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-STATE-11** · `feat` · Mempertahankan favoriteSearchQuery
  - **Selesai jika:** Search Favorite tetap bekerja di atas data cloud.
  - Asal: M+T · PDF: 156-161 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-STATE-12** · `test` · Menguji ganti akun
  - **Selesai jika:** Favorite akun A tidak muncul pada akun B.
  - Asal: M+T · PDF: 156-161 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-STATE-13** · `feat` · Menyimpan dan membatalkan subscription autentikasi
  - **Selesai jika:** Subscription auth dan favorite ditutup pada dispose; callback UID lama diabaikan.
  - Asal: M+T · PDF: 157-159 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

### AnimeVersev1.4.0 — Real-time UI integration

- [ ] **AV2-UI-01** · `feat` · Menghubungkan DetailScreen ke toggle Firestore
  - **Selesai jika:** Love menulis/menghapus favorite akun aktif.
  - Asal: M+T · PDF: 162-163 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-UI-02** · `feat` · Menampilkan loading mutation favorite
  - **Selesai jika:** Tap ganda saat write berlangsung tidak membuat perilaku aneh.
  - Asal: M+T · PDF: 162-163 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-UI-03** · `feat` · Menampilkan error mutation favorite
  - **Selesai jika:** Write gagal tidak mengklaim tersimpan.
  - Asal: M+T · PDF: 162-163 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-UI-04** · `feat` · Menghubungkan FavoriteScreen ke stream cloud
  - **Selesai jika:** Perubahan cloud tampil tanpa restart.
  - Asal: M+T · PDF: 162-163 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-UI-05** · `feat` · Menjaga search Favorite pada data stream
  - **Selesai jika:** Query lokal memfilter snapshot favorite terkini.
  - Asal: M+T · PDF: 162-163 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-UI-06** · `feat` · Menampilkan empty state per akun
  - **Selesai jika:** Akun tanpa favorite tidak mewarisi data akun lain.
  - Asal: M+T · PDF: 162-163 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-UI-07** · `feat` · Menangani favorite yang datanya tidak lengkap
  - **Selesai jika:** Card tetap stabil jika field opsional kosong.
  - Asal: M+T · PDF: 162-163 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-UI-08** · `test` · Menguji App → Cloud
  - **Selesai jika:** Menekan Love menghasilkan document pada subcollection user.
  - Asal: M+T · PDF: 162-163 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-UI-09** · `test` · Menguji Cloud → App
  - **Selesai jika:** Perubahan favorite di Firestore Console tercermin pada aplikasi secara real-time.
  - Asal: M+T · PDF: 162-163 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-UI-10** · `test` · Menguji delete Cloud → App
  - **Selesai jika:** Menghapus document favorite menghilangkan card tanpa restart.
  - Asal: M+T · PDF: 162-163 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

### AnimeVersev1.5.0 — Migration & account isolation

- [ ] **AV2-MIG-01** · `docs` · Mencatat kebijakan favorite lama
  - **Selesai jika:** Baseline v2 menggunakan koleksi cloud akun aktif tanpa impor otomatis; AV2-MIG-02 sampai AV2-MIG-04 hanya diaktifkan melalui perubahan scope tercatat.
  - Asal: T · PDF: 146-163 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-MIG-02** · `feat` · Membuat import favorit lokal opsional
  - **Selesai jika:** Jika scope diaktifkan, pengguna memilih akun tujuan dan menyetujui daftar yang akan diimpor; gagal sebagian dapat dicoba ulang.
  - Asal: T · PDF: 146-163 · Keberlakuan: Opsional, di luar baseline.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-MIG-03** · `feat` · Mencatat keberhasilan import opsional
  - **Selesai jika:** Jika scope diaktifkan, penanda dibuat hanya setelah write diakui berhasil; sumber lokal tidak dihapus ketika gagal.
  - Asal: T · PDF: 146-163 · Keberlakuan: Opsional, di luar baseline.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-MIG-04** · `test` · Menguji import opsional tanpa duplikasi
  - **Selesai jika:** Jika scope diaktifkan, import ulang tidak menggandakan malId dan tidak otomatis mengirim data perangkat ke akun lain.
  - Asal: T · PDF: 146-163 · Keberlakuan: Opsional, di luar baseline.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-MIG-05** · `test` · Menguji user A dan user B
  - **Selesai jika:** Kedua akun memiliki subcollection favorite yang terpisah.
  - Asal: T · PDF: 146-163 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-MIG-06** · `test` · Menguji logout membersihkan state visual
  - **Selesai jika:** Favorite lama tidak flash pada akun berikutnya.
  - Asal: T · PDF: 146-163 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-MIG-07** · `docs` · Memperjelas perbedaan dokumentasi v1 dan v2
  - **Selesai jika:** README menyatakan Firestore sebagai sumber favorite final v2; penjelasan historis SharedPreferences v1 tetap disimpan.
  - Asal: T · PDF: 146-163 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

### AnimeVersev1.6.0 — Firestore Security Rules

- [ ] **AV2-SEC-01** · `fix` · Mewajibkan request.auth != null
  - **Selesai jika:** Anonymous client tidak dapat membaca favorite.
  - Asal: M+T · PDF: 164-168 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-SEC-02** · `fix` · Membatasi read favorite ke UID sendiri
  - **Selesai jika:** User A tidak dapat membaca users/B/favorites.
  - Asal: M+T · PDF: 164-168 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-SEC-03** · `fix` · Membatasi create favorite ke UID sendiri
  - **Selesai jika:** Path UID harus sama dengan request.auth.uid.
  - Asal: M+T · PDF: 164-168 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-SEC-04** · `fix` · Membatasi update favorite ke UID sendiri
  - **Selesai jika:** User tidak dapat overwrite favorite user lain.
  - Asal: M+T · PDF: 164-168 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-SEC-05** · `fix` · Membatasi delete favorite ke UID sendiri
  - **Selesai jika:** Delete lintas akun ditolak.
  - Asal: M+T · PDF: 164-168 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-SEC-06** · `fix` · Menetapkan validasi bentuk dokumen favorite
  - **Selesai jika:** Sebagai tambahan tim, rules atau validasi teruji membatasi field dan tipe sesuai kontrak; validasi owner tetap wajib terpisah.
  - Asal: M+T · PDF: 164-168 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-SEC-07** · `fix` · Menutup Test Mode
  - **Selesai jika:** Rules produksi tidak menggunakan akses publik berbasis waktu.
  - Asal: M+T · PDF: 164-168 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-SEC-08** · `test` · Menguji unauthenticated read/write
  - **Selesai jika:** Semua operasi favorite ditolak.
  - Asal: M+T · PDF: 164-168 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-SEC-09** · `test` · Menguji cross-user read/write
  - **Selesai jika:** Rules menolak akses lintas UID.
  - Asal: M+T · PDF: 164-168 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-SEC-10** · `test` · Menguji owner read/write
  - **Selesai jika:** User authenticated dapat mengelola favorite sendiri.
  - Asal: M+T · PDF: 164-168 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

### AnimeVersev1.7.0 — Error, lifecycle & offline behavior

- [ ] **AV2-ROB-01** · `feat` · Menangani permission-denied
  - **Selesai jika:** UI menampilkan failure terkontrol.
  - Asal: T · PDF: 156-163 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-ROB-02** · `feat` · Menangani cache dan write saat offline
  - **Selesai jika:** UI membedakan data cache, write pending dan hasil tersinkron; tidak mengklaim berhasil di server hanya karena snapshot lokal berubah.
  - Asal: T · PDF: 156-163 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-ROB-03** · `feat` · Menangani sesi autentikasi yang tidak valid
  - **Selesai jika:** Refresh token rutin tidak memaksa logout; sesi yang benar-benar tidak valid menghasilkan alur login terkontrol tanpa retry loop.
  - Asal: T · PDF: 156-163 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-ROB-04** · `feat` · Menangani stream error
  - **Selesai jika:** Provider tidak mempertahankan loading selamanya.
  - Asal: T · PDF: 156-163 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-ROB-05** · `feat` · Membedakan initial favorite loading dan empty
  - **Selesai jika:** Empty tidak tampil sebelum snapshot pertama selesai.
  - Asal: T · PDF: 156-163 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-ROB-06** · `feat` · Membatalkan subscription pada dispose
  - **Selesai jika:** Tidak ada listener orphan.
  - Asal: T · PDF: 156-163 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-ROB-07** · `test` · Menguji reconnect
  - **Selesai jika:** Setelah koneksi pulih, snapshot favorite kembali sinkron.
  - Asal: T · PDF: 156-163 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-ROB-08** · `test` · Menguji logout saat listener aktif
  - **Selesai jika:** Tidak ada update state dari subscription user lama.
  - Asal: T · PDF: 156-163 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

### AnimeVersev1.8.0 — Finishing UI, icon & splash

- [ ] **AV2-FIN-01** · `chore` · Menyiapkan app icon AnimeVerse
  - **Selesai jika:** Ikon custom menggantikan default Flutter.
  - Asal: M · PDF: 165-167 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-FIN-02** · `chore` · Menyiapkan splash screen AnimeVerse
  - **Selesai jika:** Splash konsisten dengan identitas aplikasi.
  - Asal: M · PDF: 165-167 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-FIN-03** · `chore` · Mengonfigurasi flutter_launcher_icons
  - **Selesai jika:** Aset assets/images/app_icon.png dan konfigurasi generator tersedia; ikon hasil generation diperiksa.
  - Asal: M · PDF: 165-167 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-FIN-04** · `chore` · Mengonfigurasi flutter_native_splash
  - **Selesai jika:** Aset assets/images/splash_screen_icon.png dan konfigurasi Android termasuk Android 12 tersedia; cold start diperiksa.
  - Asal: M · PDF: 165-167 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-FIN-05** · `test` · Memverifikasi cold start
  - **Selesai jika:** Splash muncul dan app masuk flow auth/home tanpa blank berkepanjangan.
  - Asal: M · PDF: 165-167 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-FIN-06** · `test` · Memeriksa visual final screen utama
  - **Selesai jika:** Tidak ada placeholder debug atau label sementara.
  - Asal: M · PDF: 165-167 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

### AnimeVersev1.9.0 — Release signing & GitHub Actions

- [ ] **AV2-REL-01** · `chore` · Membuat upload keystore
  - **Selesai jika:** Keystore release dibuat dan disimpan aman.
  - Asal: M+T · PDF: 168-171 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-REL-02** · `chore` · Menambahkan key.properties ke gitignore
  - **Selesai jika:** Credential signing tidak masuk Git.
  - Asal: M+T · PDF: 168-171 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-REL-03** · `chore` · Menambahkan *.jks ke gitignore
  - **Selesai jika:** Binary keystore tidak masuk repository.
  - Asal: M+T · PDF: 168-171 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-REL-04** · `chore` · Mengonfigurasi signingConfig release
  - **Selesai jika:** APK release ditandatangani dengan upload key.
  - Asal: M+T · PDF: 168-171 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-REL-05** · `chore` · Mengambil release SHA-1/SHA-256
  - **Selesai jika:** Fingerprint varian release tersedia.
  - Asal: M+T · PDF: 168-171 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-REL-06** · `chore` · Mendaftarkan release fingerprint di Firebase
  - **Selesai jika:** Google sign-in pada release dikenali Firebase.
  - Asal: M+T · PDF: 168-171 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-REL-07** · `chore` · Memperbarui google-services.json setelah fingerprint release
  - **Selesai jika:** Config Android sinkron dengan Firebase Console.
  - Asal: M+T · PDF: 168-171 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-REL-08** · `test` · Membangun app-release.apk
  - **Selesai jika:** Artifact release berhasil dibuat.
  - Asal: M+T · PDF: 168-171 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-CI-01** · `ci` · Membuat .github/workflows/build-release.yml
  - **Selesai jika:** Workflow build release tersedia.
  - Asal: M+T · PDF: 172-175 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-CI-02** · `ci` · Menjalankan flutter pub get di CI
  - **Selesai jika:** Dependency dipulihkan pada runner bersih.
  - Asal: M+T · PDF: 172-175 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-CI-03** · `ci` · Menjalankan format/analyze/test di CI
  - **Selesai jika:** Quality gate berjalan sebelum release build.
  - Asal: M+T · PDF: 172-175 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-CI-04** · `ci` · Menyiapkan KEYSTORE_BASE64
  - **Selesai jika:** Keystore direkonstruksi ke path signing yang sama dengan lokal; byte Base64 tidak dicetak ke log atau di-commit.
  - Asal: M+T · PDF: 172-175 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-CI-05** · `ci` · Menyiapkan GOOGLE_SERVICES_JSON_BASE64
  - **Selesai jika:** File Android direkonstruksi ke android/app/google-services.json sesuai kebijakan modul, tidak dicetak ke log.
  - Asal: M+T · PDF: 172-175 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-CI-06** · `ci` · Menyimpan STORE_PASSWORD, KEY_PASSWORD, KEY_ALIAS
  - **Selesai jika:** Secret tidak ditulis hardcoded di workflow.
  - Asal: M+T · PDF: 172-175 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-CI-07** · `ci` · Membangun APK release pada runner
  - **Selesai jika:** Artifact build dihasilkan setelah checks lulus.
  - Asal: M+T · PDF: 172-175 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-CI-08** · `ci` · Mengunggah APK sebagai artifact workflow
  - **Selesai jika:** Tim dapat mengambil artifact hasil job.
  - Asal: M+T · PDF: 172-175 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-CI-09** · `ci` · Menyelaraskan trigger tag AnimeVerse
  - **Selesai jika:** Workflow menggunakan AnimeVersev* dan kondisi job release memeriksa refs/tags/AnimeVersev; pubspec memuat versi numerik yang sama.
  - Asal: M+T · PDF: 172, 174-175 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-CI-10** · `ci` · Membuat GitHub Release dari artifact terverifikasi
  - **Selesai jika:** Job release berjalan setelah build pada tag yang sesuai dan melampirkan APK yang sama; hasil run dicatat.
  - Asal: M · PDF: 174-175 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-CI-11** · `ci` · Memisahkan pemeriksaan PR dari job bertanda tangan
  - **Selesai jika:** PR menjalankan pemeriksaan tanpa secret signing; job release hanya menerima kode tepercaya dan izin yang diperlukan.
  - Asal: T · PDF: 172-175 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

### AnimeVersev2.0.0 — Cloud favorite release

- [ ] **AV2-GATE-01** · `test` · Memastikan favorite Firestore menjadi SSOT
  - **Selesai jika:** Runtime v2 tidak menggunakan SharedPreferences untuk favorite.
  - Asal: T · PDF: 146-175 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-GATE-02** · `test` · Memastikan favorite terisolasi per Firebase UID
  - **Selesai jika:** Akun berbeda memiliki daftar berbeda.
  - Asal: T · PDF: 146-175 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-GATE-03** · `test` · Memastikan sync real-time
  - **Selesai jika:** Perubahan cloud/app tercermin dua arah.
  - Asal: T · PDF: 146-175 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-GATE-04** · `test` · Memastikan document ID memakai malId
  - **Selesai jika:** Tidak ada duplicate favorite untuk anime sama.
  - Asal: T · PDF: 146-175 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-GATE-05** · `test` · Memastikan Security Rules production aktif
  - **Selesai jika:** Cross-user dan unauthenticated access ditolak.
  - Asal: T · PDF: 146-175 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-GATE-06** · `test` · Memastikan Jikan API tetap sumber katalog
  - **Selesai jika:** Firestore tidak digunakan untuk menggandakan seluruh katalog Jikan tanpa kebutuhan.
  - Asal: T · PDF: 146-175 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-GATE-07** · `test` · Memastikan Email/Password dan Google login bekerja pada release
  - **Selesai jika:** Release fingerprint valid.
  - Asal: T · PDF: 146-175 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-GATE-08** · `test` · Memastikan app icon dan splash final
  - **Selesai jika:** Artifact tidak terlihat sebagai scaffold Flutter.
  - Asal: T · PDF: 146-175 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-GATE-09** · `test` · Memastikan CI menghasilkan artifact dan GitHub Release
  - **Selesai jika:** Tag AnimeVersev2.0.0 memicu workflow; APK dari build sukses terlampir pada release yang sesuai.
  - Asal: T · PDF: 146-175 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-GATE-10** · `docs` · Memperbarui README ke status v2
  - **Selesai jika:** Arsitektur Auth + Jikan + Firestore dijelaskan sesuai implementasi aktual.
  - Asal: T · PDF: 146-175 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-GATE-11** · `chore` · Menaikkan pubspec ke 2.0.0+build aktual
  - **Selesai jika:** Build number benar-benar meningkat.
  - Asal: T · PDF: 146-175 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-GATE-12** · `chore` · Membuat tag AnimeVersev2.0.0
  - **Selesai jika:** Tag berasal dari commit yang telah diverifikasi.
  - Asal: T · PDF: 146-175 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

- [ ] **AV2-GATE-13** · `docs` · Merekam uji release dan serah terima
  - **Selesai jika:** Commit, tag, SHA-256 APK, hasil login release, isolasi akun dan tautan run/release dicatat sebagai bukti aktual.
  - Asal: T · PDF: 162-175 · Keberlakuan: Aktif.
  - PIC: — · Status: TODO · Issue: — · PR: — · Bukti: —

## Dokumen pendamping

Gunakan [template Issue](templates/Issue.md), [template PR](templates/Pull_Request.md) dan [catatan bukti](templates/Catatan_Bukti.md). Perubahan keputusan dicatat pada [Keputusan_Proyek.md](Keputusan_Proyek.md).
