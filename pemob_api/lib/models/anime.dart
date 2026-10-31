class Anime {
  final int mallId;
  final String title;
  final int? year;
  final double? score;

  Anime({
    required this.mallId,
    required this.title,
    this.year,
    this.score
  });

  factory Anime.fromJson(Map<String, dynamic> json){
    return Anime(
      mallId: json['mal_id'] as int,
      title: json['title'] as String,
      year: json['year'] as int?,
      score: (json['score'] as num?)?.toDouble()
    );
  }
}