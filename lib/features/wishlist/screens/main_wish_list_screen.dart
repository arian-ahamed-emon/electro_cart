import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Product {
  final String title;
  final String image;
  final double price;

  Product({required this.title, required this.image, required this.price});
}

class MainWishListScreen extends StatefulWidget {
  const MainWishListScreen({super.key});

  @override
  State<MainWishListScreen> createState() => _MainWishListScreenState();
}

class _MainWishListScreenState extends State<MainWishListScreen> {
  List<Product> wishList = [
    Product(
        title: 'Nike Zoom Mesh Casual Running Shoes For Men - white -00011',
        image: 'assets/images/shoe1.jpeg',
        price: 120.0),
   Product(
        title: 'Nike Zoom Mesh Casual Running Shoes For Men - white -00011',
        image: 'assets/images/shoe1.jpeg',
        price: 120.0),
   Product(
        title: 'Nike Zoom Mesh Casual Running Shoes For Men - white -00011',
        image: 'assets/images/shoe1.jpeg',
        price: 120.0),

  ];

  void removeFromWishList(int index) {
    setState(() {
      wishList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Wishlist'),

      ),
      body: wishList.isEmpty
          ? Center(
        child: Text(
          'Your wishlist is empty.',
          style: TextStyle(fontSize: 18.sp
          ),
        ),
      )
          : ListView.builder(
        itemCount: wishList.length,
        itemBuilder: (context, index) {
          final item = wishList[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ListTile(
              leading: Image.asset(
                item.image,
                width: 60.w,
                height: 60.h,
                fit: BoxFit.cover,
              ),
              title: Text(item.title),
              subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => removeFromWishList(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
