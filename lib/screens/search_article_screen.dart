import 'package:article_app/screens/articles_screen.dart';
import 'package:article_app/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchArticleScreen extends StatelessWidget {
  const SearchArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final queryController = TextEditingController();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: LocationAppBar(title: "Search"),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 80),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 320,
                child: TextField(
                  controller: queryController,
                  decoration: InputDecoration(
                    hintText: 'Search articles here ...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ArticleScreen(query: queryController.text),
                      ),
                    );
                  },
                  child: const Text(
                    'Search',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ButtonStyle(
                    maximumSize: MaterialStateProperty.all(const Size(100, 50)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
