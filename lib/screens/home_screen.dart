import 'package:article_app/services/article_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../widgets/category_tile_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  List<Map<String, String>> get categories => [
        {
          'title': 'Search',
          'label': 'Search Articles',
          'pageRoute': 'search',
        },
        {
          'title': 'List',
          'label': 'List Articles',
          'pageRoute': 'list',
        },
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NYT'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return PageTypeTile(
                  title: category['title']!,
                  label: category['label']!,
                  pageRoute: category['pageRoute']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
