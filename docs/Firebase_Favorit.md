# Firebase Authentication dan Favorite

Status: rancangan dan panduan pelaksanaan. Tidak ada Firebase project pengguna yang diperiksa atau diubah.

## 1. Autentikasi

AuthService menangani email/password, Google dan signOut. AuthProvider mengubah hasil service dan stream identitas menjadi state UI. validators.dart melakukan validasi input sebelum request; snackbar_helper.dart menampilkan pesan. Ini mengikuti pemisahan layer PDF 143-145.

Jangan menyimpan password, ID token atau refresh token secara manual di SharedPreferences. Pemulihan sesi mengikuti Firebase SDK. Bedakan pembatalan Google dari kegagalan autentikasi. Tombol submit dinonaktifkan selama proses yang sama agar tidak mengirim permintaan ganda. Pemutakhiran token rutin bukan otomatis logout; sesi yang benar-benar tidak valid ditangani dengan meminta login ulang.

Profile membaca displayName/email/photoURL bila tersedia dan memberi fallback. Sign Out mengakhiri sesi Firebase serta menangani sesi penyedia Google sesuai API package yang dipin. Jangan menganggap redirect UI mengamankan database.

## 2. Favorite v1: lokal perangkat

Provider mengelola List<Anime>, menambah/menghapus berdasarkan malId, memberi notifikasi pada UI dan menyimpan JSON ke SharedPreferences. Saat startup, baca JSON dan bangun objek melalui fromFavoritesJson. Gunakan satu storage key yang dicatat dalam implementasi; nama aktual belum tersedia dalam ZIP.

Data v1 bukan data per akun: favorit dapat tetap ada setelah logout atau login akun lain di perangkat yang sama. Batas ini dipertahankan untuk menjelaskan peralihan belajar ke Firestore. JSON rusak ditangani tanpa crash dan pengguna diberi informasi jika daftar lokal tidak dapat dipulihkan.

## 3. Favorite v2: data per UID

| Bagian | Nilai / arti |
| --- | --- |
| Root collection | users |
| Parent document | UID Firebase Auth |
| Subcollection | favorites |
| Document ID | malId.toString() |
| Isi dokumen | Snapshot datar pada Kontrak_Data_API.md |

Contoh bentuk path adalah users/{uid}/favorites/{malId}. Tanda kurung kurawal menyatakan variabel, bukan teks literal yang disimpan. Identitas UID harus berasal dari sesi terautentikasi. Parent user boleh belum memiliki field profil sendiri; jangan menambah query/profile collection tanpa kebutuhan.

### Operasi service

| Operasi | Perilaku |
| --- | --- |
| favoritesStream(uid) | Mengikuti snapshot hanya pada subcollection UID itu dan memetakan dokumen ke Anime |
| addFavorite(uid, anime) | set pada document ID malId; pengulangan tidak membuat dokumen baru |
| removeFavorite(uid, malId) | delete pada path dokumen yang sama |
| Tanpa user | Operasi ditolak sebelum request; backend tetap dilindungi rules |

Jikan tetap sumber katalog. Snapshot favorit menyimpan data secukupnya untuk UI model, bukan seluruh respons API yang tidak digunakan. Setiap akun dapat memfavoritkan malId yang sama karena subcollection-nya berbeda.

## 4. Siklus listener

Saat login pertama atau UID berubah, hentikan subscription favorit sebelumnya, bersihkan daftar/error/pending state dan query akun, kemudian mulai subscription UID baru. Hasil stream diterima hanya jika UID/generasinya masih aktif. Ketika logout, jangan membiarkan daftar lama tampil pada Home/Detail/Favorite sesaat. Pada dispose, batalkan listener favorite dan listener auth.

v2 tidak melakukan load/save favorites dari SharedPreferences. Pengubahan list di UI saja tidak cukup sebagai bukti tersimpan: operasi service dan hasil sinkronisasi harus dicatat.

## 5. Kebijakan transisi

Baseline K-03 menggunakan koleksi cloud yang sudah dimiliki akun aktif, atau daftar kosong jika belum pernah ada. Favorite perangkat lama tidak diunggah otomatis dan tidak dihapus diam-diam oleh dokumentasi ini. Jelaskan kepada pengguna bahwa daftar v1 belum tersalin.

Task import AV2-MIG-02/03/04 dipertahankan sebagai opsi pengembangan. Jika diaktifkan, tampilkan daftar sumber, akun tujuan dan konfirmasi, gunakan document ID malId, tangani gagal sebagian dan simpan penanda setelah konfirmasi server. Jangan otomatis mengimpor data bersama perangkat ke setiap akun yang masuk.

## 6. Rules akses minimum

Contoh berikut adalah aturan target owner-only untuk favorite, bukan rules yang telah diuji atau dideploy:

```text
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{uid}/favorites/{animeId} {
      allow read, create, update, delete:
        if request.auth != null && request.auth.uid == uid;
    }
  }
}
```

Tidak ada akses lain yang diberikan oleh contoh ini. Saat digabungkan dengan rules yang sudah ada, pastikan tidak ada rule publik lebih luas yang turut mengizinkan request. Identitas pada request dan UID path harus dibandingkan di backend. [Kondisi Security Rules Firebase](https://firebase.google.com/docs/firestore/security/rules-conditions).

Contoh tersebut membatasi kepemilikan, tetapi belum memvalidasi semua field snapshot. AV2-SEC-06 adalah tambahan tim untuk validasi data: mal_id positif dan cocok dengan document ID, title string, genres list, metadata opsional sesuai tipe serta field yang diperbolehkan jelas. Uji validasi field terpisah dari uji owner; jangan menyatakan contoh minimum sudah menjalankan validasi schema.

Modul VIII memindahkan Test Mode ke production rules. Setelah implementasi, simpan firestore.rules dalam repository dan pastikan yang diuji sama dengan rules aktif. Emulator atau Rules Playground dapat membantu uji; penghapusan melalui Console hanya membuktikan sinkronisasi, bukan membuktikan client cross-user ditolak.

## 7. Offline dan pending write

Firestore dapat menyajikan cache ketika offline. Snapshot cache tidak selalu lengkap/terbaru dan write lokal dapat masih menunggu server. Gunakan metadata cache/pending sesuai API SDK dan kebutuhan UI; jika perubahan metadata perlu didengar, aktifkan opsi listener yang sesuai. [Panduan offline Firestore](https://firebase.google.com/docs/firestore/manage-data/enable-offline).

| Keadaan | Perilaku baseline tim |
| --- | --- |
| Snapshot pertama belum diterima | Loading, bukan “belum ada favorit” |
| Cache tersedia saat offline | Tampilkan daftar dengan status offline/cache |
| Tidak ada cache saat offline | Jelaskan bahwa data belum tersedia; jangan menyimpulkan server kosong |
| Mutation belum dikonfirmasi | Tandai pending; jangan menyatakan sukses tersimpan di cloud |
| Write ditolak rules | Hilangkan status sukses sementara dan tampilkan gagal sesuai hasil stream/error |
| Koneksi pulih | Perbarui status berdasarkan pengakuan server dan snapshot terbaru |

Jangan membiarkan satu write offline menahan spinner seluruh layar tanpa penjelasan. Logout membersihkan state aplikasi, tetapi jangan mengklaim logout otomatis menghapus seluruh cache SDK dari disk. Uji pergantian akun saat offline dan pastikan tidak menampilkan data UID lama. Rincian pengelolaan cache perangkat bersama dapat memerlukan pekerjaan tambahan sesuai model penggunaan tim.

## 8. Verifikasi yang diperlukan

Uji App -> Cloud, Cloud -> App, delete Cloud -> App, duplicate add, remove, A -> logout -> B, unauthenticated access, cross-user read/create/update/delete dan owner operations. Uji dilakukan dengan akun/data praktikum dan hasilnya direkam pada Pengujian.md serta template bukti. Tidak ada hasil PASS yang diisi sebelum uji nyata.
