import 'package:flutter/material.dart';
import 'package:pemob_api/models/anime.dart';

class AnimeCard extends StatelessWidget{
  final Anime anime;
  
  const AnimeCard({
    super.key,
    required this.anime
  });
  
  @override
  Widget build(BuildContext context){
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 6.0, 
        horizontal: 16.0
      ),
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(
          color: Colors.white.withOpacity(0.1),
          width: 1.0,
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    anime.title,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6.0),

                  Text(
                    anime.year?.toString() ?? 'Tahun tidak tersedia',
                  ),
                ]
              ),
            ),

            Text(
              anime.score?.toString() ?? 'Skor tidak tersedia',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              )
            ),
          ],
        )
      )
    );
  }
}