# Matriks Modul ke Dokumentasi

Rujukan menggunakan **nomor halaman file PDF (1-176)**, bukan angka footer. Footer bagian isi umumnya lebih kecil tiga halaman; gunakan posisi PDF agar tidak rancu. Pembagian v1/v2 merupakan konvensi tim.

## Cakupan kedelapan modul

| Modul / PDF | Pemahaman yang dipelajari | Hasil implementasi / bukti | Dokumen |
| --- | --- | --- | --- |
| I / 4-17 | Flutter, multi-platform, struktur project, main.dart, widget dasar, hot reload/restart | Proyek awal dan challenge login statis | Setup, SRS FR-01, Pengumpulan |
| II / 18-68 | Widget tree, constraints, komposisi layout, MediaQuery, LayoutBuilder | Enam layar, aset, grid dan reusable widget | SRS FR-02/03, Arsitektur |
| III / 69-83 | Imperatif/deklaratif, go_router, nested navigation, path parameter, stateful branch | Tab, detail ID, retensi state dan SafeArea | Arsitektur, SRS FR-04..06 |
| IV / 84-113 | Stateless/Stateful, setState, ChangeNotifier, Provider, serialisasi dan controller | Favorit lokal, persistensi, search/genre | Kontrak Data, Firebase, SRS FR-07..09 |
| V / 114-133 | REST, HTTP, JSON, Future, async/await, repository, pagination | Katalog API, search, detail, gambar jaringan, refresh | Kontrak Data, SRS FR-10..17 |
| VI / 134-145 | Firebase Auth, identitas vs data, fingerprint, service/provider/validator | Email/Google login, profil, logout, guard | Setup, Firebase, SRS FR-18..22 |
| VII / 146-163 | SQL/NoSQL, collection/document, snapshot/stream, UID dan lifecycle | Favorit per akun dan sync dua arah | Firebase, SRS FR-23..25/28 |
| VIII / 164-175 | Rules owner-scoped, icon/splash, signing, build, CI/CD | APK release, artifact dan GitHub Release | Build Release, SRS FR-26/29..31 |

## Pemetaan pekerjaan dan pengujian

| Materi spesifik | PDF | SRS | Task utama | Uji |
| --- | --- | --- | --- | --- |
| Challenge login dan pengumpulan | 17 | FR-01 | AV-ENG-14, AV-UI-09 | TC-01 |
| Aset di root, background, SVG | 22-24, 31, 39 | FR-02/03 | AV-ENG-09/10, AV-UI-16/17 | TC-02 |
| Enam layar, AnimeView dan kartu favorite | 20, 41-68 | FR-02/03 | AV-UI-03..10, AV-UI-18..22 | TC-02 |
| ShellRoute awal dan detail ID | 69-79 | FR-04/05 | AV-NAV-01..15 | TC-03/04 |
| StatefulShellRoute, goBranch dan SafeArea | 79-83 | FR-04 | AV-NAV-16..19 | TC-03 |
| State detail, Provider dan favorite global | 87-95 | FR-05/07 | AV-STATE-02..07 | TC-04/05 |
| SharedPreferences, JSON, restore | 96-101 | FR-08 | AV-STATE-08..12/21/24 | TC-06/23 |
| Filter genre dan query terpisah | 102-113 | FR-09 | AV-STATE-13..19/22/23 | TC-07 |
| Repository dan parsing model 12 field | 119-126 | FR-10/15 | AV-API-03..10/15/16/18 | TC-08 |
| isAppropriateContent | 122-123 | FR-17 | AV-API-19/20/31 | TC-15 |
| Rate limit dan debounce 500 ms | 124-127 | FR-11 | AV-API-14/21/27/29 | TC-09/16 |
| Pagination, infinite scroll, refresh | 126, 129-131 | FR-12/13 | AV-API-22..26/30 | TC-10..12 |
| Cache-first detail dan fallback API | 128-129 | FR-14 | AV-API-06/11/28 | TC-13 |
| CachedNetworkImage di tiga area | 119-120, 129-133 | FR-16 | AV-API-17, AV-INT-06 | TC-14 |
| Firebase setup dan fingerprint debug | 136-142 | FR-18..20 | AV-AUTH-01..09 | TC-18..20 |
| Validator, snackbar, AuthProvider dan redirect | 143-145 | FR-18..22 | AV-AUTH-10..27 | TC-18..22 |
| Collection UID dan serializer favorite | 149-156 | FR-23 | AV2-FB-04..06, AV2-DB-01..11 | TC-24/26 |
| Refactor favorite dan auth/listener lifecycle | 156-161 | FR-24/25/28 | AV2-STATE-01..13 | TC-27/34/36 |
| App -> Cloud dan Cloud -> App | 162-163 | FR-24 | AV2-UI-08..10 | TC-24/25 |
| Rules owner-only dan penutupan Test Mode | 164-168 | FR-26 | AV2-SEC-01..10 | TC-28..31 |
| Ikon dan splash | 165-167 | FR-29 | AV2-FIN-01..06 | TC-37 |
| Keystore, signing, SHA release, APK | 168-171 | FR-30 | AV2-REL-01..08 | TC-38/40 |
| CI, Base64, artifact, tag dan GitHub Release | 172-175 | FR-31 | AV2-CI-01..11 | TC-39/40 |

## Hal yang tidak boleh disamakan dengan instruksi modul

| Item | Kedudukan |
| --- | --- |
| SRS, Task ID, PIC, Issue/PR, Conventional Commits | Pengorganisasian tim; bukan daftar dokumen wajib yang ditetapkan PDF |
| ID invalid, proteksi stale response, race UID, JSON rusak | Acceptance ketahanan yang diperjelas tim |
| Search API + genre ID dan penyimpanan metadata pagination | Kontrak implementasi untuk melengkapi method yang tidak dijelaskan penuh di PDF |
| Offline/pending write dan schema validation mendetail | Tambahan engineering; rules owner-only saja tidak membuktikannya |
| Import favorit otomatis | Di luar baseline, tiga task opsional |
| Forgot Password penuh dan pengaturan profil fungsional | Mockup tidak otomatis menjadi spesifikasi backend; belum dimasukkan |
| Semua hasil PASS, APK, screenshot dan log | Wajib berasal dari pekerjaan nyata; tidak tersedia pada ZIP dokumentasi |

Pemetaan di atas memuat materi implementasi serta konsep utama semua modul. Beberapa halaman PDF berupa gambar kode dan beberapa method dirujuk ke repository pendamping; paket ini melengkapi kontraknya sebagai keputusan tim tanpa mengaku telah membaca source repository yang tidak tersedia.
