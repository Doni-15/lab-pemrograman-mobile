import 'package:anime_verse/feature/anime/domain/entities/anime.dart';
import 'package:anime_verse/feature/anime/domain/entities/anime_genre.dart';
import 'package:anime_verse/feature/anime/domain/entities/anime_status.dart';

class AnimeDummyDataSource {
  const AnimeDummyDataSource();

  List<Anime> getAnimes() {
    return const [
      Anime(
        id: 'black-clover',
        title: 'Black Clover',
        posterPath: 'assets/images/posters/black_clover.jpg',
        description:
            'Asta, seorang pemuda tanpa kekuatan sihir, berusaha menjadi Wizard King bersama rivalnya, Yuno.',
        rating: 4.7,
        releaseYear: 2017,
        genres: [AnimeGenre.action, AnimeGenre.adventure, AnimeGenre.fantasy],
        status: AnimeStatus.finished,
        episodeCount: 170,
        latestEpisode: 170,
        isTrending: true,
      ),

      Anime(
        id: 'fullmetal-alchemist-brotherhood',
        title: 'Fullmetal Alchemist: Brotherhood',
        posterPath: 'assets/images/posters/fullmetal_alchemist_brotherhood.jpg',
        description:
            'Dua bersaudara menggunakan alkimia dalam perjalanan mencari cara untuk mengembalikan tubuh mereka.',
        rating: 4.9,
        releaseYear: 2009,
        genres: [
          AnimeGenre.action,
          AnimeGenre.adventure,
          AnimeGenre.drama,
          AnimeGenre.fantasy,
        ],
        status: AnimeStatus.finished,
        episodeCount: 64,
        latestEpisode: 64,
        isTrending: true,
      ),

      Anime(
        id: 'hunter-x-hunter',
        title: 'Hunter x Hunter',
        posterPath: 'assets/images/posters/hunter_x_hunter.jpg',
        description:
            'Gon Freecss memulai perjalanan untuk menjadi Hunter dan menemukan ayahnya yang telah lama menghilang.',
        rating: 4.9,
        releaseYear: 2011,
        genres: [AnimeGenre.action, AnimeGenre.adventure, AnimeGenre.fantasy],
        status: AnimeStatus.ongoing,
        isNewEpisode: true,
        episodeCount: 148,
        latestEpisode: 148,
        isTrending: true,
      ),

      Anime(
        id: 'koe-no-katachi',
        title: 'Koe no Katachi',
        posterPath: 'assets/images/posters/koe_no_katachi.jpg',
        description:
            'Seorang mantan pelaku perundungan berusaha menebus kesalahannya dan memperbaiki hubungannya dengan seseorang dari masa lalunya.',
        rating: 4.8,
        releaseYear: 2016,
        genres: [AnimeGenre.drama, AnimeGenre.romance, AnimeGenre.sliceOfLife],
        status: AnimeStatus.finished,
        episodeCount: 1,
        latestEpisode: 1,
      ),

      Anime(
        id: 'my-hero-academia',
        title: 'My Hero Academia',
        posterPath: 'assets/images/posters/my_hero_academia.jpg',
        description:
            'Izuku Midoriya bermimpi menjadi pahlawan meskipun terlahir tanpa kekuatan super.',
        rating: 4.7,
        releaseYear: 2016,
        genres: [AnimeGenre.action, AnimeGenre.comedy, AnimeGenre.supernatural],
        status: AnimeStatus.ongoing,
        isNewEpisode: true,
        episodeCount: 170,
        latestEpisode: 170,
        isTrending: true,
      ),

      Anime(
        id: 'spirited-away',
        title: 'Spirited Away',
        posterPath: 'assets/images/posters/sen_to_chihiro_no_kamikakushi.jpg',
        description:
            'Chihiro terjebak di dunia roh dan harus menemukan cara untuk menyelamatkan dirinya serta orang tuanya.',
        rating: 4.9,
        releaseYear: 2001,
        genres: [
          AnimeGenre.adventure,
          AnimeGenre.fantasy,
          AnimeGenre.supernatural,
        ],
        status: AnimeStatus.finished,
        episodeCount: 1,
        latestEpisode: 1,
      ),

      Anime(
        id: 'frieren',
        title: 'Frieren: Beyond Journey\'s End',
        posterPath: 'assets/images/posters/souso_no_frieren.jpg',
        description:
            'Setelah perjalanan panjang bersama kelompok pahlawan berakhir, Frieren memulai perjalanan baru untuk memahami manusia dan kenangan yang ditinggalkan.',
        rating: 4.9,
        releaseYear: 2023,
        genres: [AnimeGenre.adventure, AnimeGenre.drama, AnimeGenre.fantasy],
        status: AnimeStatus.ongoing,
        episodeCount: 28,
        latestEpisode: 28,
        isNewEpisode: true,
        isTrending: true,
      ),

      Anime(
        id: 'my-neighbor-totoro',
        title: 'My Neighbor Totoro',
        posterPath: 'assets/images/posters/tonari_no_totoro.jpg',
        description:
            'Dua saudari menemukan makhluk-makhluk ajaib ketika pindah ke rumah baru di pedesaan.',
        rating: 4.8,
        releaseYear: 1988,
        genres: [
          AnimeGenre.adventure,
          AnimeGenre.fantasy,
          AnimeGenre.sliceOfLife,
        ],
        status: AnimeStatus.finished,
        episodeCount: 1,
        latestEpisode: 1,
      ),

      Anime(
        id: 'vinland-saga',
        title: 'Vinland Saga',
        posterPath: 'assets/images/posters/vinland_saga.jpg',
        description:
            'Thorfinn tumbuh di tengah peperangan dan perjalanan panjang yang membentuk kehidupannya sebagai seorang pejuang.',
        rating: 4.8,
        releaseYear: 2019,
        genres: [AnimeGenre.action, AnimeGenre.adventure, AnimeGenre.drama],
        status: AnimeStatus.finished,
        episodeCount: 48,
        latestEpisode: 48,
        isTrending: true,
      ),

      Anime(
        id: 'violet-evergarden-movie',
        title: 'Violet Evergarden: The Movie',
        posterPath: 'assets/images/posters/violet_evergarden_movie.jpg',
        description:
            'Violet berusaha memahami arti cinta dan menghadapi perasaan yang tersisa dari masa lalunya.',
        rating: 4.9,
        releaseYear: 2020,
        genres: [AnimeGenre.drama, AnimeGenre.romance, AnimeGenre.fantasy],
        status: AnimeStatus.finished,
        episodeCount: 1,
        latestEpisode: 1,
      ),

      Anime(
        id: 'elfen-lied',
        title: 'Elfen Lied',
        posterPath: 'assets/images/posters/elfen_lied.jpg',
        description:
            'Lucy, seorang Diclonius dengan kekuatan telekinetik yang mematikan, melarikan diri dari fasilitas penelitian dan kemudian menghadapi kembali masa lalu yang penuh kekerasan dan trauma.',
        rating: 4.8,
        releaseYear: 2004,
        genres: [
          AnimeGenre.action,
          AnimeGenre.drama,
          AnimeGenre.supernatural,
        ],
        status: AnimeStatus.finished,
        episodeCount: 13,
        latestEpisode: 13,
      ),

      Anime(
        id: 'higurashi-when-they-cry',
        title: 'Higurashi: When They Cry',
        posterPath: 'assets/images/posters/higurashi.jpg',
        description:
            'Keiichi Maebara pindah ke desa Hinamizawa dan mulai mengetahui berbagai kejadian misterius serta pembunuhan yang berkaitan dengan festival tahunan desa tersebut.',
        rating: 4.7,
        releaseYear: 2006,
        genres: [
          AnimeGenre.drama,
          AnimeGenre.supernatural,
        ],
        status: AnimeStatus.finished,
        episodeCount: 26,
        latestEpisode: 26,
      ),

      Anime(
        id: 'mirai-nikki',
        title: 'Future Diary',
        posterPath: 'assets/images/posters/mirai_nikki.jpg',
        description:
            'Yukiteru Amano terlibat dalam permainan bertahan hidup setelah menerima buku harian yang dapat meramalkan masa depan dan harus menghadapi pemilik buku harian lainnya.',
        rating: 4.7,
        releaseYear: 2011,
        genres: [
          AnimeGenre.action,
          AnimeGenre.drama,
          AnimeGenre.romance,
          AnimeGenre.supernatural,
        ],
        status: AnimeStatus.finished,
        episodeCount: 26,
        latestEpisode: 26,
      ),

      Anime(
        id: 'another',
        title: 'Another',
        posterPath: 'assets/images/posters/another.jpg',
        description:
            'Koichi Sakakibara pindah ke sekolah baru dan bertemu Mei Misaki, seorang gadis yang tampaknya diabaikan oleh teman-teman sekelasnya di tengah serangkaian kematian misterius.',
        rating: 4.6,
        releaseYear: 2012,
        genres: [
          AnimeGenre.drama,
          AnimeGenre.supernatural,
        ],
        status: AnimeStatus.finished,
        episodeCount: 12,
        latestEpisode: 12,
      ),

      Anime(
        id: 'shiki',
        title: 'Shiki',
        posterPath: 'assets/images/posters/shiki.jpg',
        description:
            'Kematian misterius mulai terjadi setelah sebuah keluarga pindah ke sebuah rumah besar di desa terpencil, membawa penduduk desa ke dalam konflik mengerikan tentang kehidupan dan kematian.',
        rating: 4.6,
        releaseYear: 2010,
        genres: [
          AnimeGenre.drama,
          AnimeGenre.supernatural,
        ],
        status: AnimeStatus.finished,
        episodeCount: 22,
        latestEpisode: 22,
      ),

      Anime(
        id: 'gantz',
        title: 'Gantz',
        posterPath: 'assets/images/posters/gantz.jpg',
        description:
            'Setelah meninggal dalam sebuah kecelakaan, Kei Kurono dan orang-orang lain dipaksa mengikuti permainan misterius yang mengharuskan mereka memburu makhluk asing dengan mempertaruhkan nyawa.',
        rating: 4.6,
        releaseYear: 2004,
        genres: [
          AnimeGenre.action,
          AnimeGenre.drama,
          AnimeGenre.supernatural,
        ],
        status: AnimeStatus.finished,
        episodeCount: 26,
        latestEpisode: 26,
      ),

      Anime(
        id: 'devilman-crybaby',
        title: 'Devilman Crybaby',
        posterPath: 'assets/images/posters/devilman_crybaby.jpg',
        description:
            'Akira Fudo mengetahui keberadaan iblis dan memperoleh kekuatan mereka dengan cara yang membuatnya menjadi Devilman, mempertahankan hati manusia di dalam tubuh yang memiliki kekuatan iblis.',
        rating: 4.7,
        releaseYear: 2018,
        genres: [
          AnimeGenre.action,
          AnimeGenre.drama,
          AnimeGenre.supernatural,
        ],
        status: AnimeStatus.finished,
        episodeCount: 10,
        latestEpisode: 10,
      ),

      Anime(
        id: 'corpse-party-tortured-souls',
        title: 'Corpse Party: Tortured Souls',
        posterPath:
            'assets/images/posters/corpse_party_tortured_souls.jpg',
        description:
            'Sekelompok siswa terjebak di sebuah sekolah yang telah hancur dan dihantui setelah melakukan ritual yang seharusnya membuat mereka tetap bersama.',
        rating: 4.4,
        releaseYear: 2013,
        genres: [
          AnimeGenre.drama,
          AnimeGenre.supernatural,
        ],
        status: AnimeStatus.finished,
        episodeCount: 4,
        latestEpisode: 4,
      ),
    ];
  }
}
