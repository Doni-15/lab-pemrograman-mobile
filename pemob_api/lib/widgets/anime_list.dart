import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pemob_api/models/anime.dart';
import 'package:pemob_api/widgets/anime_card.dart';

class AnimeList extends StatelessWidget {
  final Future<List<Anime>> futureAnimes;

  const AnimeList({
    super.key,
    required this.futureAnimes
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Anime>>(
      future:  futureAnimes,

      builder: (context, snapshot){
        if(kDebugMode){
          print(snapshot.connectionState);
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          if (kDebugMode) {
            print('Detail Error : ${snapshot.error}');
          }

          return const Center(
            child: Text("Gagal memuat data anime"),
          );
        }

        final animes = snapshot.data ?? <Anime>[];

        if(animes.isEmpty){
          return const Center(
            child:  Text('Tidak ada anime.'),
          );
        }

        return ListView.builder(
          itemCount: animes.length,

          itemBuilder: (context, index){
            final anime = animes[index];
            return AnimeCard(
              key: ValueKey(anime.title),
              anime: anime
            );
          }
        );
      },
    );
  }
}