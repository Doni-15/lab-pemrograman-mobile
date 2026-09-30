import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:anime_verse/core/router/routes.dart';
import 'package:anime_verse/core/widgets/anime_app_card_grid.dart';
import 'package:anime_verse/core/widgets/anime_app_empty_state.dart';
import 'package:anime_verse/core/widgets/anime_app_search_field.dart';
import 'package:anime_verse/core/widgets/anime_content_wrapper.dart';
import 'package:anime_verse/feature/anime/data/datasources/anime_dummy_data_source.dart';
import 'package:anime_verse/feature/anime/domain/entities/anime.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static const _dataSource = AnimeDummyDataSource();
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Anime> get _results {
    final query = _query.trim().toLowerCase();

    if (query.isEmpty) {
      return const [];
    }

    return _dataSource.getAnimes().where((anime) {
      return anime.title.toLowerCase().contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cari Anime'), centerTitle: true),
      body: SafeArea(
        child: Column(
          children: [
            AnimeContentWrapper(
              padded: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: AnimeAppSearchField(
                  controller: _searchController,
                  hintText: 'Cari anime...',
                  onChanged: (query) {
                    setState(() {
                      _query = query;
                    });
                  },
                  onClear: () {
                    _searchController.clear();
                    FocusScope.of(context).unfocus();
                    setState(() {
                      _query = '';
                    });
                  },
                ),
              ),
            ),

            Expanded(child: _buildContent(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (_query.trim().isEmpty) {
      return const AnimeAppEmptyState(
        icon: Icons.search_rounded,
        title: 'Cari anime favoritmu',
        message: 'Ketik judul anime untuk mulai mencari.',
      );
    }

    final results = _results;

    if (results.isEmpty) {
      return const AnimeAppEmptyState(
        icon: Icons.search_off_rounded,
        title: 'Anime tidak ditemukan',
        message: 'Coba gunakan kata kunci lain.',
      );
    }

    return AnimeAppCardGrid(
      animes: results,
      onAnimeTap: (anime) {
        FocusScope.of(context).unfocus();
        context.push(Routes.detailPath(anime.id));
      },
    );
  }
}
