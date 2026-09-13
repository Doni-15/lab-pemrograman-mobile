# Arsitektur, Navigasi dan State

Status: struktur target dokumentasi. Tidak menyatakan folder berikut sudah ada dalam source ZIP.

## Tanggung jawab layer

| Layer | Komponen | Tanggung jawab |
| --- | --- | --- |
| Presentasi | screens, widgets | Render state, menerima input, meneruskan aksi |
| State aplikasi | AppStateProvider | Katalog, query, genre, pagination, favorit, loading/error |
| State identitas | AuthProvider | User, pemulihan sesi, operasi masuk/keluar, error auth |
| Data katalog | AnimeRepository | Request Jikan, parsing, pengendalian kegagalan |
| Layanan identitas | AuthService | FirebaseAuth dan Google Sign-In |
| Data favorit v2 | FirestoreService | Reference owner-scoped, snapshots, set/delete favorite |
| Model | Anime | Nilai domain dan konversi JSON terpisah dari UI |
| Komposisi | main.dart | Inisialisasi Firebase lalu menyediakan service/provider/router |

Provider tetap dipakai sesuai modul; tidak perlu migrasi ke framework state lain. AppStateProvider mengikuti perubahan user yang sama dengan AuthProvider dan tidak menciptakan sesi independen.

## Struktur target aplikasi

| Lokasi | Isi |
| --- | --- |
| assets/images/ | Poster dummy, SVG Google, app_icon.png, splash_screen_icon.png |
| assets/fonts/ | Font sumber praktikum, nama family sesuai pubspec |
| lib/main.dart | Entry point dan composition root |
| lib/config/routes.dart | AppRoutes dan GoRouter |
| lib/data/dummy_data.dart | Fixture fase UI; bukan sumber Home final |
| lib/models/anime.dart | Model dan mapper |
| lib/providers/app_state_provider.dart | State katalog/favorit |
| lib/providers/auth_provider.dart | State autentikasi |
| lib/repositories/anime_repository.dart | API katalog |
| lib/services/auth/auth_service.dart | AuthService |
| lib/services/firestore_service.dart | FirestoreService |
| lib/utils/validators.dart | Validasi form |
| lib/utils/snackbar_helper.dart | Pesan UI |
| lib/screens/ | signin_screen.dart, signup_screen.dart, home_screen.dart, detail_screen.dart, favorite_screen.dart, profile_screen.dart |
| lib/widgets/ | background_widget.dart, genre_list.dart, anime_card.dart, anime_view.dart, favorite_anime_card.dart, bottom_navigation_shell.dart |
| test/ | Unit dan widget test yang relevan |
| integration_test/ | Uji alur terintegrasi bila diotomatisasi |
| docs/ | Paket dokumentasi ini |
| android/ | Konfigurasi native dan signing lokal |
| .github/workflows/ | Pemeriksaan dan workflow release ketika diimplementasikan |

assets berada sejajar lib, bukan di dalamnya. Penamaan config/routes.dart mengikuti bagian Auth modul; dokumentasi awal menggunakan routes/routes.dart. Jika starter tim sudah memakai nama berbeda, pilih satu lokasi dan selaraskan import/dokumentasi tanpa membuat dua registry route.

## Registry route akhir

| Nama | Path baseline | Akses final | Penempatan / perilaku |
| --- | --- | --- | --- |
| signIn | /signin | Belum login | Di luar shell |
| signUp | /signup | Belum login | Di luar shell |
| home | /home | Sudah login | Branch 0 |
| favorite | /favorite | Sudah login | Branch 1 |
| profile | /profile | Sudah login | Branch 2 |
| details | /details/:animeId | Sudah login | Root navigator di atas shell; tab sebelumnya tetap tersimpan |
| unknown | Path lain / ID invalid | Sesuai sesi | Error page dan aksi ke Home/Sign In |

Nama /home, /favorite dan /profile adalah kontrak baseline; cocokkan sekali dengan starter. animeId adalah representasi string bilangan positif dari malId. Jangan membuat ID baru, memakai indeks list, atau mengirim seluruh objek sebagai satu-satunya cara membuka detail. Detail yang belum ada di list tetap harus dapat dimuat.

### Tahap navigasi

1. Modul III awal: definisikan route dan ShellRoute untuk memahami nested navigation.
2. Target akhir Modul III: gunakan StatefulShellRoute.indexedStack, satu branch per tab, body navigationShell, currentIndex dan goBranch.
3. Setelah Auth: redirect halaman privat ke Sign In jika tidak ada sesi; pengguna yang sudah login tidak dikembalikan ke form Auth tanpa alasan.
4. Saat sesi dipulihkan: tampilkan keadaan menunggu yang jelas. Hindari redirect bolak-balik akibat nilai auth yang belum final.

StatefulShellRoute mempertahankan navigator terpisah pada tiap branch; ini mendukung state tab ketika berpindah. Persistensi setelah proses aplikasi dimatikan adalah persoalan berbeda dan tidak otomatis dijamin shell. [API go_router](https://pub.dev/documentation/go_router/latest/go_router/StatefulShellRoute-class.html).

SafeArea menjaga bottom bar dari navigasi sistem. Tap kartu dari Home maupun Favorite membuka detail dengan back stack yang dapat kembali ke asal. Perilaku tap ulang tab aktif dicatat konsisten; baseline mengikuti contoh modul yang dapat kembali ke root branch, tanpa menghapus favorit atau sesi.

## State yang harus dibedakan

| Kelompok | Nilai konseptual |
| --- | --- |
| Katalog | List Anime, loading awal, error awal, mode top/search, homeSearchQuery, selectedGenre |
| Pagination | currentPage, hasMore, isLoadingMore, errorMore |
| Kendali request | Timer debounce, nomor/generasi query aktif |
| Favorite | List Anime, favoriteSearchQuery, initialLoading, error, pending mutation per malId |
| Identitas | Auth belum diketahui, user/null, auth loading, auth error |
| Subscription v2 | Listener auth, listener favorit, UID/generasi yang sedang diikuti |

Satu boolean loading untuk semua operasi tidak cukup: pagination tidak boleh menghilangkan list, dan mutation favorit tidak boleh membekukan seluruh pencarian.

## Lifecycle dan batas sumber kebenaran

v1: perubahan favorit dikelola Provider lalu diserialisasi ke SharedPreferences. v2: aplikasi mengirim mutation melalui service dan state favorit mengikuti stream akun aktif. Cache dan pending write SDK dapat menghasilkan snapshot sebelum server mengonfirmasi; metadata sinkronisasi perlu diperhatikan pada UI.

Ketika UID berubah, batalkan listener favorit lama, kosongkan state milik akun, lalu mulai listener UID baru. Batalkan kedua subscription saat provider di-dispose. Callback lama wajib memeriksa generasi/UID sebelum menulis state. TextEditingController, ScrollController dan Timer juga harus dilepas oleh pemiliknya. Proteksi callback terlambat adalah tambahan ketahanan tim.
