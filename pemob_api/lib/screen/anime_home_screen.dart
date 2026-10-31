import 'package:flutter/material.dart';
import 'package:pemob_api/models/anime.dart';
import 'package:pemob_api/repository/anime_repository.dart';
import 'package:pemob_api/widgets/anime_list.dart';

class AnimeHomeScreen extends StatefulWidget {
  const AnimeHomeScreen({super.key});

  @override
  State<AnimeHomeScreen> createState() => _AnimeHomeScreenState();
}

class _AnimeHomeScreenState extends State<AnimeHomeScreen> {
  final AnimeRepository _repository = AnimeRepository();
  late Future<List<Anime>> _futureAnimes;

  @override
  void initState() {
    super.initState();
    _futureAnimes = _repository.getTopAnime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.emoji_events,
              color: Colors.amber,
              size: 24.0,
            ),
            SizedBox(width: 8.0),
            Text(
              'Top Anime',
            ),
          ],
        ),

        centerTitle: true,
      ),
      
      body: AnimeList(
        futureAnimes: _futureAnimes,
      ),
    );
  }
}