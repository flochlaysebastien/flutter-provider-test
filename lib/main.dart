import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/providers/favorites.provider.dart';
import 'package:testing_app/pages/favorites.page.dart';
import 'package:testing_app/pages/home.page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoriteProvider>(
          create: (context) => FavoriteProvider(),
        ),
      ],
      child: TestingApp(),
    ),
  );
}

class TestingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        HomePage.routeName: (context) => HomePage(),
        FavoritesPage.routeName: (context) => FavoritesPage(),
      },
      initialRoute: HomePage.routeName,
    );
  }
}
