import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:pemob_api/models/anime.dart';

class AnimeRepository {
  static const String _baseUrl = 'https://api.tenrai.org/v1';
  final http.Client _client = http.Client();

  Future<List<Anime>> getTopAnime({int page =1 }) async {
    try {
      final uri = Uri.parse('$_baseUrl/top/anime?page=$page');
      final response = await _client.get(uri);

      if(response.statusCode == 200){
        final Map<String, dynamic> decodedData = jsonDecode(response.body);
        final List<dynamic> animeList = decodedData['data'];

        return animeList.map((json) => Anime.fromJson(json)).toList();
      }
      else{
        throw Exception('Gagal memuat top anime. Status: ${response.statusCode}');
      }
    } 
    catch (e) {
      throw Exception('Terjadi kesalahan jaringan: $e');
    }
  }

}