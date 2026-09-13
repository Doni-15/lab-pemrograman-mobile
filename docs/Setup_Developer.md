# Setup Developer

Panduan ini dipakai setelah source Flutter tersedia. ZIP revisi berisi dokumen, sehingga flutter pub get/run tidak dijalankan dari folder dokumentasi semata.

## 1. Prasyarat dan catatan lingkungan

Siapkan Flutter SDK, editor/Android Studio, Android SDK, JDK yang cocok dengan Gradle proyek, serta emulator atau perangkat Android. Untuk Google Sign-In gunakan perangkat/emulator yang mendukung Google Play services. Lihat [setup Firebase untuk Flutter](https://firebase.google.com/docs/flutter/setup) untuk persyaratan platform terkini; versi proyek harus tetap diverifikasi melalui build.

Jalankan dari root source aplikasi:

```bash
flutter --version
flutter doctor -v
flutter devices
java -version
```

| Data yang dicatat | Nilai |
| --- | --- |
| Repository / commit / branch | Belum tersedia |
| Flutter / channel / Dart | Belum diverifikasi |
| OS / Java / Android SDK | Belum diverifikasi |
| Gradle wrapper / AGP | Baca file Android aktual |
| Perangkat dan Android version | Belum diverifikasi |
| applicationId | Baca android/app/build.gradle atau build.gradle.kts |

Simpan pubspec.lock untuk aplikasi. Catat versi yang berhasil dijalankan; tidak perlu menyalin nomor versi proyek lain. Jika source belum dibuat, tahap bootstrap menggunakan nama paket Dart anime_verse dan label aplikasi AnimeVerse. URL repository dan organisasi Android ditentukan dari proyek tim, bukan dikarang dalam panduan.

## 2. Dependency per tahap

| Package | Tahap | Fungsi |
| --- | --- | --- |
| flutter SDK | I | Framework UI |
| flutter_svg | II | Ikon SVG pada UI Google |
| go_router | III | Routing dan stateful shell |
| provider | IV | ChangeNotifier/Provider |
| shared_preferences | IV-v1 | Persistensi favorite lokal |
| http | V | REST request |
| cached_network_image | V | Poster jaringan, placeholder dan fallback |
| firebase_core | VI | Inisialisasi Firebase |
| firebase_auth | VI | Identitas dan sesi |
| google_sign_in | VI | Login Google |
| cloud_firestore | VII-v2 | Favorit cloud dan stream |
| flutter_launcher_icons | VIII, tooling | Generator ikon |
| flutter_native_splash | VIII, tooling | Generator splash |
| flutter_test SDK | Tambahan QA | Unit/widget test |
| flutter_lints | Tambahan QA | Analisis statis |
| integration_test SDK | Opsional untuk otomasi | Alur aplikasi pada perangkat |

Versi package belum bisa dipin karena pubspec dan toolchain tidak tersedia. Setelah memilih versi kompatibel, tuliskan constraint di pubspec, jalankan pub get, lalu simpan lockfile dan hasil analyze/test/build. Jangan meninggalkan contoh dependency tanpa versi sebagai pubspec final tim.

Kode Google Sign-In harus mengikuti versi package yang benar-benar digunakan. Dokumentasi package menyediakan panduan migrasi antarversi; contoh lama tidak boleh dicampur dengan API baru. [Package resmi google_sign_in](https://pub.dev/packages/google_sign_in).

## 3. Aset dan tampilan

1. Ambil images dan fonts dari sumber praktikum yang sah. Arsip pengguna tidak menyertakannya.
2. Letakkan assets/images dan assets/fonts di root, sejajar lib dan pubspec.yaml.
3. Daftarkan directory gambar serta setiap font/family/weight yang dipakai di pubspec. Gunakan nama file nyata, bukan nama perkiraan.
4. Periksa case-sensitive path, SVG Google, gradien BackgroundWidget dan grid responsif.
5. Pada fase API ganti Image.asset untuk poster katalog/favorit menjadi gambar jaringan. Aset ikon/splash tetap lokal.

Sumber visual: PDF 20 untuk enam layar; PDF 22-24 untuk aset. Tidak ada file desain atau gambar modul yang direkayasa ulang dalam paket ini.

## 4. Firebase Android

### Jalur yang dicontohkan modul

1. Buat/pilih project Firebase praktikum dan catat project ID.
2. Daftarkan Android app dengan applicationId persis dari konfigurasi proyek.
3. Aktifkan Email/Password dan Google pada Authentication; lengkapi informasi provider yang diminta console.
4. Dari folder android jalankan signingReport untuk memperoleh SHA-1 dan SHA-256 debug. Setiap mesin dengan debug keystore berbeda perlu fingerprint-nya sendiri.
5. Tambahkan fingerprint ke Android app yang sesuai di Firebase.
6. Ambil google-services.json yang sesuai dan tempatkan di android/app/google-services.json, tanpa suffix nama seperti (1).
7. Pastikan integrasi Google Services pada Gradle sesuai template proyek. Jangan mencampur syntax Groovy (.gradle) dan Kotlin DSL (.gradle.kts).
8. Inisialisasi Firebase setelah WidgetsFlutterBinding.ensureInitialized dan sebelum provider/service memanggil Firebase.

Perintah fingerprint dari root proyek pada Linux/macOS:

```bash
cd android
./gradlew signingReport
cd ..
```

Pada Windows gunakan .\gradlew signingReport dari folder android. Baca blok varian yang tepat, bukan mengambil SHA debug untuk APK release.

### Penyesuaian untuk proyek yang memakai FlutterFire CLI

Firebase sekarang mendokumentasikan alur CLI untuk mengonfigurasi aplikasi dan menghasilkan lib/firebase_options.dart. Jika proyek memilih alur ini, simpan pilihan tersebut di catatan setup dan inisialisasi memakai options yang dihasilkan. Jangan mencampur konfigurasi dari dua Firebase project. [Panduan FlutterFire](https://firebase.google.com/docs/flutter/setup).

```bash
firebase login
dart pub global activate flutterfire_cli
flutterfire configure
```

Perintah itu adalah panduan untuk tim dan belum dieksekusi pada akun mana pun. Firebase CLI perlu dipasang sebelumnya sesuai panduan resmi. Jika options.dart digunakan, CI juga harus mendapat konfigurasi yang sama.

## 5. Memulai Firestore pada v2

Aktifkan Cloud Firestore pada project yang sama, catat edition/region yang dipilih, lalu tambahkan cloud_firestore. Jangan membuat Firebase app kedua tanpa kebutuhan. Modul memperkenalkan Test Mode sebagai tahap latihan; target final menggunakan owner-scoped rules. Gunakan data uji selama setup dan jangan menyatakan final sebelum rules serta isolasi akun terverifikasi. Detail pada [Firebase_Favorit.md](Firebase_Favorit.md).

## 6. Run dan pemeriksaan awal

```bash
flutter pub get
flutter analyze
flutter test
flutter run
```

Ekspektasi: dependency terpulihkan, analyze/test memiliki hasil jelas, aplikasi terbuka pada perangkat yang dipilih. Setelah perubahan plugin native/Gradle/Firebase, hentikan lalu jalankan ulang build; hot reload saja tidak cukup. Hasil aktual dimasukkan ke template bukti, bukan diasumsikan lulus dari keberadaan perintah.

## 7. Pemecahan masalah

| Gejala | Pemeriksaan pertama |
| --- | --- |
| No pubspec.yaml | Pastikan sedang di root source aplikasi |
| Aset/font tidak muncul | Lokasi root, nama/family, indentasi pubspec dan case-sensitive path |
| Firebase belum terinisialisasi | Urutan binding, initializeApp dan runApp/provider |
| Google login debug gagal | applicationId, SHA debug mesin tersebut, provider Google, config Android, kompatibilitas package |
| Google login hanya gagal di release | Periksa SHA dari keystore release dan konfigurasi yang dipakai APK tersebut |
| API berhasil debug, gagal release | Periksa konektivitas dan permission INTERNET pada manifest utama yang masuk release |
| Firestore permission-denied | UID sesi, path owner, rules yang benar-benar aktif dan project ID |
| Package tidak cocok dengan contoh | Baca dokumentasi versi package terpasang; jangan mengubah banyak versi sekaligus tanpa hasil build |

Tidak ada source code yang diubah atau command setup akun yang dijalankan dalam audit dokumentasi ini.
