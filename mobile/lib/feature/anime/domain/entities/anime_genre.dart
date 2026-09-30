enum AnimeGenre {
  action,
  adventure,
  comedy,
  drama,
  fantasy,
  horror,
  mystery,
  romance,
  sciFi,
  sliceOfLife,
  sports,
  supernatural,
  thriller,
  psychological,
  school,
  historical,
  military,
  music,
  mecha,
  martialArts,
  magic,
  vampire,
  demons,
  samurai,
  space,
  crime,
  detective,
  isekai,
  parody,
  tragedy,
}

extension AnimeGenreExtension on AnimeGenre {
  String get displayName {
    switch (this) {
      case AnimeGenre.action:
        return 'Action';
      case AnimeGenre.adventure:
        return 'Adventure';
      case AnimeGenre.comedy:
        return 'Comedy';
      case AnimeGenre.drama:
        return 'Drama';
      case AnimeGenre.fantasy:
        return 'Fantasy';
      case AnimeGenre.horror:
        return 'Horror';
      case AnimeGenre.mystery:
        return 'Mystery';
      case AnimeGenre.romance:
        return 'Romance';
      case AnimeGenre.sciFi:
        return 'Sci-Fi';
      case AnimeGenre.sliceOfLife:
        return 'Slice of Life';
      case AnimeGenre.sports:
        return 'Sports';
      case AnimeGenre.supernatural:
        return 'Supernatural';
      case AnimeGenre.thriller:
        return 'Thriller';
      case AnimeGenre.psychological:
        return 'Psychological';
      case AnimeGenre.school:
        return 'School';
      case AnimeGenre.historical:
        return 'Historical';
      case AnimeGenre.military:
        return 'Military';
      case AnimeGenre.music:
        return 'Music';
      case AnimeGenre.mecha:
        return 'Mecha';
      case AnimeGenre.martialArts:
        return 'Martial Arts';
      case AnimeGenre.magic:
        return 'Magic';
      case AnimeGenre.vampire:
        return 'Vampire';
      case AnimeGenre.demons:
        return 'Demons';
      case AnimeGenre.samurai:
        return 'Samurai';
      case AnimeGenre.space:
        return 'Space';
      case AnimeGenre.crime:
        return 'Crime';
      case AnimeGenre.detective:
        return 'Detective';
      case AnimeGenre.isekai:
        return 'Isekai';
      case AnimeGenre.parody:
        return 'Parody';
      case AnimeGenre.tragedy:
        return 'Tragedy';
    }
  }
}
