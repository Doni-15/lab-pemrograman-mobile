import 'package:flutter/material.dart';
import 'package:pemob_api/screen/anime_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Api Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.dark()
      ),
      home: AnimeHomeScreen(),
    );
  }
}
