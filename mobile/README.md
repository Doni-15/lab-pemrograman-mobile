# AnimeVerse

Proyek praktikum Pemrograman Mobile menggunakan Flutter untuk Android.

## Status

Bootstrap 0.1.0+1: Login statis Challenge Modul I. Belum ada Auth/API/Favorite.
Status tiap task bootstrap mengikuti [hasil verifikasi](docs/Bootstrap_Verifikasi.md).

## Menjalankan

```bash
flutter pub get
flutter analyze
flutter test
flutter run
```

## Struktur

- lib/: screens, widgets, models, providers, repositories, services, config dan utils.
- assets/images/ dan assets/fonts/: aset lokal modul.
- docs/: spesifikasi, roadmap, SDK dan bukti.
- .github/: template Issue dan Pull Request.

| Folder         | Tanggung jawab                                          |
| -------------- | ------------------------------------------------------- |
| `config`       | Konfigurasi aplikasi                                    |
| `models`       | Struktur data, misalnya `Anime` dan `User`              |
| `providers`    | State aplikasi dan perubahan state                      |
| `repositories` | Mengatur pengambilan data dari service atau penyimpanan |
| `services`     | Akses API, autentikasi, dan penyimpanan                 |
| `screens`      | Halaman aplikasi                                        |
| `widgets`      | Komponen UI yang digunakan beberapa halaman             |
| `utils`        | Fungsi bantu kecil, misalnya format tanggal             |
| `core/theme`   | Warna, tipografi, gradien, dan tema                     |


## Dokumen

- [SDK aktual](docs/SDK.md)
- [Roadmap v1](docs/Roadmap_AnimeVersev1.0.0.md)
- [Roadmap v2](docs/Roadmap_AnimeVersev2.0.0.md)
- [SRS](docs/SRS_AnimeVerse.md)

Roadmap adalah target pengembangan. DONE diberikan hanya setelah acceptance diperiksa.

