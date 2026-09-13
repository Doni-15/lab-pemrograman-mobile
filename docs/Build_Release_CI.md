# Build Android, Release dan CI

Sumber utama: PDF 164-175. Dokumen ini adalah panduan target; tidak menyertakan workflow yang diklaim siap jalan, keystore, APK, secret atau hasil CI.

## 1. Persiapan identitas aplikasi

Gunakan label AnimeVerse, applicationId yang sudah didaftarkan di Firebase, serta versi numerik pubspec yang sesuai target. Contoh hubungan target: tag AnimeVersev2.0.0 berarti version name 2.0.0 dengan build number aktual yang meningkat, misalnya bentuk 2.0.0+N; N bukan teks literal pada pubspec.

Siapkan assets/images/app_icon.png dan assets/images/splash_screen_icon.png. Daftarkan konfigurasi flutter_launcher_icons dan flutter_native_splash berdasarkan aset dan versi package yang dipilih; periksa konfigurasi Android 12 untuk splash. PDF 166 menunjukkan bagian ini.

```bash
flutter pub get
dart run flutter_launcher_icons
dart run flutter_native_splash:create
```

Periksa hasil pada launcher dan cold start. Tidak perlu mengganti logo menjadi desain lain hanya karena paket dokumentasi sedang diperbaiki.

## 2. Signing lokal

1. Siapkan keystore release khusus proyek dan simpan salinan pemulihan secara terkontrol. Jangan menimpa keystore yang sudah digunakan untuk rilis sebelumnya.
2. Simpan lokasi, alias dan pengelola kunci dalam catatan internal, tanpa password pada dokumen publik.
3. Buat android/key.properties lokal dengan storePassword, keyPassword, keyAlias dan storeFile yang sesuai.
4. Pastikan key.properties, berkas .jks/.keystore dan hasil Base64 signing tidak dilacak Git.
5. Muat properties dalam Gradle app, definisikan signingConfig release dan hubungkan ke buildTypes.release. Gunakan syntax yang cocok dengan .gradle atau .gradle.kts proyek.
6. Jangan membiarkan release diam-diam ditandatangani debug key ketika konfigurasi hilang; build release harus gagal dengan pesan yang jelas.

Alur signing dan struktur konfigurasi native dirujuk pada [panduan Android Flutter](https://docs.flutter.dev/deployment/android). Nilai keystore/password contoh di screenshot modul tidak boleh menjadi kredensial nyata tim.

## 3. Firebase untuk release

Dari folder android, jalankan signingReport dan baca SHA-1/SHA-256 **varian release**. Tambahkan fingerprint tersebut ke Firebase Android app yang sama, ambil konfigurasi yang telah diperbarui jika diperlukan, lalu rebuild. Periksa bahwa file yang masuk CI menunjuk project/applicationId yang sama dengan lokal.

Jika nanti memakai Play App Signing, sertifikat aplikasi yang didistribusikan Play dapat berbeda dari upload key. Itu di luar target APK praktikum dan perlu diperiksa saat scope distribusi berubah. Untuk tugas ini, pengujian utama dilakukan pada APK release yang benar-benar akan diserahkan.

## 4. Quality gate dan build

```bash
flutter pub get
dart format --output=none --set-exit-if-changed .
flutter analyze
flutter test
flutter build apk --release
```

Lokasi keluaran default yang harus diperiksa: build/app/outputs/flutter-apk/app-release.apk. Build yang berhasil belum membuktikan semua fitur berfungsi: pasang APK itu pada Android, lalu uji email login, Google login, detail, search, favorite, logout, rules, ikon dan splash. Catat ukuran aktual, versi, commit dan SHA-256 artifact. Jangan menjanjikan ukuran APK berdasarkan angka perkiraan di modul.

## 5. Kontrak workflow

Target file: .github/workflows/build-release.yml pada repository aplikasi. File ini belum ada dalam sumber yang diunggah, sehingga tidak dapat divalidasi terhadap Gradle dan toolchain aktual.

| Tahap job | Acceptance |
| --- | --- |
| Checkout | Source dari commit/tag yang akan diuji, tanpa perubahan working tree tersembunyi |
| Toolchain | Flutter/JDK versi tim, bukan versi tebakan; runner dan action reference ditinjau |
| Dependency | pub get mengikuti lockfile yang disimpan |
| Quality | Format, analyze, unit/widget test selesai sebelum build |
| Konfigurasi | google-services.json dan konfigurasi FlutterFire bila dipakai tersedia di path yang benar |
| Signing | Keystore dan key.properties dibentuk dari secrets hanya pada job tepercaya |
| Build | APK release memakai signing release yang sama dengan fingerprint terdaftar |
| Artifact | APK disimpan sebagai artifact dengan versi/commit yang jelas |
| Release | Job sesudah build mengambil artifact yang sama dan melampirkannya ke GitHub Release untuk tag itu |

Pemeriksaan PR sebaiknya terpisah dari job yang menerima signing secrets. Hindari mengeksekusi kode PR tidak tepercaya dengan secrets. Default permissions cukup read; izin contents: write dipakai hanya job yang perlu membuat release. Ini tambahan engineering tim.

## 6. Pemetaan secrets

| Nama secret dari modul | Kegunaan |
| --- | --- |
| KEYSTORE_BASE64 | Byte keystore yang dikodekan untuk disimpan sebagai teks |
| STORE_PASSWORD | Password penyimpanan keystore |
| KEY_PASSWORD | Password key |
| KEY_ALIAS | Alias key yang dipakai signing |
| GOOGLE_SERVICES_JSON_BASE64 | Konfigurasi Android project Firebase sesuai contoh modul |

Nama persis dan case harus sama antara workflow dan konfigurasi repository. Jangan mencetak hasil decode ke log; jangan memasukkan berkas hasil Base64 ke commit atau ZIP pengumpulan. Base64 adalah encoding, bukan enkripsi.

Konfigurasi client Firebase mengandung pengenal project dan bukan pengganti otorisasi backend. Menyimpan file itu melalui secret mengikuti pola operasional modul; keamanan akses data tetap bergantung Auth/Rules. [Konfigurasi Firebase Flutter](https://firebase.google.com/docs/flutter/setup).

## 7. Tag yang harus konsisten

| Bagian | Konvensi yang dipilih |
| --- | --- |
| Tag target | AnimeVersev1.0.0 dan AnimeVersev2.0.0 |
| Filter tag workflow | AnimeVersev* |
| Kondisi job release | Prefix refs/tags/AnimeVersev |
| Versi pubspec | 1.0.0 atau 2.0.0 plus build number aktual |

Contoh modul menggunakan v* dan refs/tags/v. Mengubah nama tag saja tanpa mengubah kedua pemeriksaan workflow dapat membuat job release tidak berjalan. GitHub mencocokkan filter tags dengan nama ref tag. [Sintaks workflow GitHub](https://docs.github.com/en/actions/reference/workflows-and-actions/workflow-syntax).

Milestone antara v1 dan v2 tidak otomatis harus dipublikasikan sebagai release. Buat tag final setelah gate selesai. Jika tim sudah mempunyai konvensi v* pada repository yang nyata, catat perubahan keputusan K-05 dan selaraskan semua dokumen; jangan mempertahankan dua pola yang bertentangan.

## 8. Bukti kelulusan release

- Commit, tag, version name dan build number.
- Tautan CI run, status job build dan release, nama artifact serta tautan GitHub Release.
- SHA-256 artifact lokal/CI yang diuji dan catatan perangkat.
- Hasil login email/Google pada release, add/remove favorite, isolasi akun dan koneksi buruk.
- Bukti rules aktif yang cocok dengan aturan yang diuji.
- Screenshot icon/splash dan layar utama.

Release notes hanya menyebut hal yang benar-benar diverifikasi. Contoh template modul yang menulis database aman tidak menjadi bukti rules aktif. Jika uji gagal, dokumentasikan penyebab dan perbaiki sebelum menyatakan versi diterima.

## 9. Pemulihan

Simpan commit/tag dan artifact terverifikasi sebelumnya. Jika rilis baru bermasalah, hentikan distribusi baru dan catat versi perbaikan; jangan memindahkan tag yang sudah digunakan sebagai bukti. Pemulihan APK tidak otomatis memulihkan data Firestore atau rules, sehingga perubahan backend perlu dicatat terpisah. Bagian pemulihan ini adalah tambahan tim, bukan instruksi pengumpulan tersendiri pada modul.
