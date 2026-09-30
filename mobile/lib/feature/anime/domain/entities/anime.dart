import 'package:equatable/equatable.dart';

import 'package:anime_verse/feature/anime/domain/entities/anime_genre.dart';
import 'package:anime_verse/feature/anime/domain/entities/anime_status.dart';

class Anime extends Equatable {
  const Anime({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.genres,
    this.description,
    this.rating,
    this.releaseYear,
    this.status,
    this.episodeCount,
    this.latestEpisode,
    this.isNewEpisode = false,
    this.isTrending = false,
  });

  final String id;
  final String title;
  final String posterPath;
  final List<AnimeGenre> genres;
  final String? description;
  final double? rating;
  final int? releaseYear;
  final AnimeStatus? status;
  final int? episodeCount;
  final int? latestEpisode;
  final bool isNewEpisode;
  final bool isTrending;

  @override
  List<Object?> get props => [
    id,
    title,
    posterPath,
    genres,
    description,
    rating,
    releaseYear,
    status,
    episodeCount,
    latestEpisode,
    isNewEpisode,
    isTrending,
  ];
}
