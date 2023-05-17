import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PageTypeTile extends StatelessWidget {
  final String title;
  final String label;
  final String pageRoute;

  const PageTypeTile({
    super.key,
    required this.title,
    required this.label,
    required this.pageRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25),
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 2,
                ),
                top: BorderSide(
                  color: Colors.grey,
                  width: 2,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/$pageRoute');
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
