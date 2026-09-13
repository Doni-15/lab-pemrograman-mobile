# Kontrak Data dan Jikan API

Status: kontrak target; bukan hasil inspeksi model Dart pengguna. Model utama mengikuti gambar PDF 121-123. Penamaan snapshot lengkap serta perilaku kegagalan diperjelas sebagai keputusan tim K-06/K-08.

## 1. Identitas dan model Anime

| Properti Dart | Tipe | JSON Jikan | Snapshot favorit baseline |
| --- | --- | --- | --- |
| malId | int | mal_id | mal_id |
| title | String | title | title |
| imageUrl | String? | images.jpg.image_url | image_url |
| largeImageUrl | String? | images.jpg.large_image_url | large_image_url |
| genres | List<String> | genres[].name | genres, array string |
| score | double? | score | score |
| episodes | int? | episodes | episodes |
| synopsis | String? | synopsis | synopsis |
| type | String? | type | type |
| year | int? | year | year |
| status | String? | status | status |
| ageRating | String? | rating | age_rating |

malId harus bilangan positif, bukan index list. Di route digunakan sebagai string animeId; document ID Firestore memakai malId.toString(). Key snapshot adalah mal_id, sementara properti Dart adalah malId. README awal belum menetapkan perbedaan ini.

### Aturan parsing

- fromJson membaca struktur Jikan yang bertingkat. fromFavoritesJson membaca snapshot datar. Keduanya tidak dipertukarkan secara sembarang.
- mal_id tidak valid membuat item tidak dapat dipakai sebagai identitas; jangan diam-diam memakai ID 0 untuk banyak anime.
- title adalah string wajib. Response yang salah tipe dipetakan ke kegagalan parsing terkontrol.
- Field opsional boleh tidak ada/null. genres yang kosong menjadi list kosong; score numerik dikonversi ke double tanpa memaksa nilai null menjadi 0.
- Mapper memeriksa tipe nested map/list sebelum casting. UI memakai fallback untuk data opsional, bukan menampilkan null.
- Snapshot mempertahankan seluruh field model agar favorit dan detail dari list favorit tidak kehilangan metadata. Model dapat berkembang, tetapi pembaca data lama perlu disesuaikan dengan perubahan schema.

### Serialisasi favorit

toJson menghasilkan satu map datar dengan key kolom snapshot di atas. SharedPreferences menyimpan list map itu sebagai string JSON; Firestore menyimpan satu map pada satu dokumen. Jangan menggunakan jsonEncode untuk membungkus seluruh dokumen Firestore menjadi string tunggal.

Pembaca harus diuji dengan round-trip: objek -> toJson -> fromFavoritesJson menghasilkan nilai yang setara. Format data lokal pada aplikasi lama tidak tersedia untuk diperiksa; kontrak ini tidak menjamin langsung kompatibel dengan data pengguna yang tidak disertakan.

## 2. Endpoint dan bentuk respons

Base URL: https://api.jikan.moe/v4. Endpoint yang digunakan:

| Kebutuhan | Method/path | Parameter |
| --- | --- | --- |
| Daftar awal | GET /top/anime | page; limit sesuai kebutuhan |
| Detail | GET /anime/{id} | ID anime |
| Pencarian / genre | GET /anime | q, page, limit, genres berupa ID |
| Daftar ID genre | GET /genres/anime | Untuk pemetaan label genre bila memakai katalog genre API |

List dibaca dari data dan metadata pagination; detail dibaca dari satu objek data. pagination.has_next_page menentukan ada/tidaknya halaman berikut. Tambahan endpoint genre merupakan keputusan implementasi tim, bukan method lengkap yang terbukti tertulis di PDF. Rujukan endpoint: [spesifikasi resmi Jikan](https://raw.githubusercontent.com/jikan-me/jikan-rest/master/storage/api-docs/api-docs.json) dan [dokumentasi API](https://docs.api.jikan.moe/).

## 3. Kontrak repository

| Operasi konseptual | Masukan | Keluaran yang diperlukan |
| --- | --- | --- |
| getTopAnime | page | items dan hasNextPage |
| searchAnime | query, page, genreId opsional | items dan hasNextPage |
| getAnimeById | malId | Anime atau kegagalan terklasifikasi |
| getGenres, bila digunakan | Tidak ada | Pemetaan ID dan nama genre |

Nama method boleh diselaraskan dengan starter, tetapi hasil pagination tidak boleh hilang ketika diubah menjadi List<Anime>. Tim dapat membuat objek hasil halaman sederhana atau menyimpan metadata secara eksplisit. UI tidak merakit URL sendiri.

## 4. Aturan search, genre dan pagination

Pada Modul IV, filter lokal menggabungkan genre terpilih dengan pencarian judul yang tidak membedakan huruf besar/kecil. Pada Modul V, Home beralih ke API. Search Favorite tetap lokal terhadap daftar favorit terbaru, sehingga query kedua layar harus terpisah.

Baseline fase API: tanpa query/genre gunakan top anime; dengan query atau genre gunakan endpoint pencarian. Label genre harus dipetakan ke ID sebenarnya, tidak mengirim nama genre seolah-olah ID. K-08 menetapkan gabungan pencarian dan genre di server agar hasil tidak hanya berasal dari halaman Home yang sudah dimuat.

Saat query atau genre berubah: batalkan timer lama, naikkan generasi request, reset page ke 1, kosongkan error halaman lama dan mulai request baru setelah debounce 500 ms untuk pengetikan. Respons hanya boleh diterapkan bila generasinya masih aktif. Perpindahan tab tidak otomatis menghapus input.

loadMore hanya berjalan jika tidak loading awal/loading-more dan hasMore benar. Append memakai malId untuk deduplikasi. Gunakan metadata has_next_page dari respons mentah, bukan panjang list setelah penyaringan konten; page yang tersaring habis belum tentu halaman terakhir. Untuk halaman tersaring kosong, sediakan aksi muat berikut atau lanjut terbatas dengan jeda, bukan loop request tanpa batas. Pull-to-refresh mereset halaman dan mempertahankan mode filter/query baseline; jika tim memilih reset query juga, catat perubahan perilakunya.

## 5. Rate limit dan kegagalan

Modul PDF 124-127 menunjukkan jeda request dan debounce. Keduanya membantu mengurangi request, tetapi bukan jaminan semua limit penyedia selalu terpenuhi. Kebijakan tim: gunakan satu pengendali request, timeout yang dicatat, dan retry terbatas untuk kegagalan yang layak diulang. Jangan retry loop pada invalid input atau not found.

| Keadaan | UI/aksi |
| --- | --- |
| Sukses dengan data kosong | Hasil tidak ditemukan, bukan error koneksi |
| ID tidak ada / 404 | Detail tidak ditemukan, tombol kembali |
| Request invalid / 400 | Error terkontrol; periksa parameter |
| Rate limit / 429 | Pesan untuk menunggu; hormati petunjuk server bila tersedia |
| Server 5xx, timeout, koneksi putus | Error jaringan/layanan dan retry terbatas atau manual |
| JSON salah bentuk | Error pemrosesan data; jangan crash |
| Gagal load-more | Pertahankan list sebelumnya dan beri retry di bagian bawah |
| Gambar gagal | Placeholder/fallback, fungsi layar tetap bekerja |

Status HTTP dan endpoint mengikuti [OpenAPI Jikan](https://raw.githubusercontent.com/jikan-me/jikan-rest/master/storage/api-docs/api-docs.json). Nilai numerik rate limit tidak dikunci pada dokumentasi proyek karena perlu mengikuti kebijakan penyedia saat implementasi.

## 6. Filter konten

Getter isAppropriateContent pada PDF 122 menolak ageRating yang berawalan Rx. Dokumentasi menetapkan penggunaan helper sebelum item ditampilkan, termasuk search dan detail. Jika rating null, UI tidak boleh menyatakan anime sudah terverifikasi aman. Helper ini merupakan filter metadata sederhana, bukan pemeriksaan usia pengguna atau klasifikasi konten menyeluruh.
