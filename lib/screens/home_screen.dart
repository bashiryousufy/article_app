import 'package:article_app/providers/location_provider.dart';
import 'package:article_app/services/article_service.dart';
import 'package:article_app/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../widgets/pageType_tile_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  List<Map<String, String>> get categories => [
        {
          'title': 'Search',
          'label': 'Search Articles',
          'pageRoute': 'search',
        },
        {
          'title': 'Popular',
          'label': 'List Articles',
          'pageRoute': 'list',
        },
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: LocationAppBar(title: "NYT"),
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
