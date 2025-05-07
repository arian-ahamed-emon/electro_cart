
import 'package:flutter/material.dart';

class category_section extends StatelessWidget {
  const category_section({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Category',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'See All',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}