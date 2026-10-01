import 'package:flutter/material.dart';

enum AnimeTab {
  home(Icons.home_outlined, Icons.home, 'Home'),
  favorite(Icons.favorite_outline, Icons.favorite, 'Favorite'),
  profile(Icons.person_outline, Icons.person, 'Profile');

  const AnimeTab(this.icon, this.selectedIcon, this.label);

  final IconData icon;
  final IconData selectedIcon;
  final String label;
}
