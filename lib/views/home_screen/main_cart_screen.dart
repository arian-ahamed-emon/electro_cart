import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_cart/models/cart_item.dart';
import 'package:flutter/material.dart';

class MainCartScreen extends StatefulWidget {
  const MainCartScreen({super.key});

  @override
  State<MainCartScreen> createState() => _MainCartScreenState();
}

class _MainCartScreenState extends State<MainCartScreen> {
  final List<CartItem> cartItems = [
    CartItem(
      name: 'Watch 9x z3400 With Expensive Metal',
      price: 1330,
      quantity: 7,
      image: 'assets/images/watch.png',
    ),
    CartItem(
      name: 'Headphone 2x z3400 With Expensive',
      price: 1530,
      quantity: 2,
      image: 'assets/images/headphone.png',
    ),
    CartItem(
      name: 'Xbox z3400 Expensive',
      price: 1030,
      quantity: 7,
      image: 'assets/images/xbox.png',
    ),
  ];

  void incrementQuantity(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void decrementQuantity(int index) {
    setState(() {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = cartItems.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );
    return Scaffold(
      appBar: AppBar(title: Text('My Cart'), centerTitle: true),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(cartItems[index].image),
              title: Text(cartItems[index].name),
              subtitle: Text('৳${cartItems[index].price.toStringAsFixed(2)}',style: TextStyle(color: Colors.orangeAccent,fontWeight: FontWeight.bold),),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () => decrementQuantity(index),
                    icon: Icon(Icons.remove),
                  ),
                  Text('${item.quantity}'),
                  IconButton(
                    onPressed: () => incrementQuantity(index),
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        color: Colors.white70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '৳${totalPrice.toStringAsFixed(2)}',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Checkout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amberAccent,
                foregroundColor: Colors.black,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7))
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
