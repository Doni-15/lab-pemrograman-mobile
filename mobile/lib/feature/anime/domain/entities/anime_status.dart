enum AnimeStatus { ongoing, finished, upcoming }

extension AnimeStatusExtension on AnimeStatus {
  String get displayName {
    return switch (this) {
      AnimeStatus.ongoing => 'Sedang Tayang',
      AnimeStatus.finished => 'Tamat',
      AnimeStatus.upcoming => 'Akan Tayang',
    };
  }
}
