import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  final String title;
  final String buttonText;
  final VoidCallback? onPressed;

  const CategorySection({
    Key? key,
    required this.title,
    this.buttonText = 'See All',
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
          ),
          TextButton(
            onPressed: onPressed ?? () {},
            child: Text(
              buttonText,
              style: const TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
