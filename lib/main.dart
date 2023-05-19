import 'package:article_app/providers/location_provider.dart';
import 'package:article_app/screens/articles_screen.dart';
import 'package:article_app/screens/home_screen.dart';
import 'package:article_app/screens/search_article_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LocationProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Article App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => const HomeScreen(),
          '/search': (context) => const SearchArticleScreen(),
          '/list': (context) => const ArticleScreen(),
        },
      ),
    );
  }
}
