import 'package:electro_cart/views/home_screen/main_cart_screen.dart';
import 'package:electro_cart/views/home_screen/main_chat_screen.dart';
import 'package:electro_cart/views/home_screen/main_home_screen.dart';
import 'package:electro_cart/views/home_screen/main_wish_list_screen.dart';
import 'package:electro_cart/views/home_screen/profile_screen.dart';
import 'package:flutter/material.dart';

class MainBottomNavigationBarScreen extends StatefulWidget {
  const MainBottomNavigationBarScreen({super.key});

  @override
  State<MainBottomNavigationBarScreen> createState() =>
      _MainBottomNavigationBarScreenState();
}

class _MainBottomNavigationBarScreenState
    extends State<MainBottomNavigationBarScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    MainHomeScreen(),
    MainChatScreen(),
    MainWishListScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<IconData> _icons = [
    Icons.home,
    Icons.chat_bubble,
    Icons.favorite,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _screens[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.shopping_cart),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder:  (context) => MainCartScreen(),));
        }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildTabIcon(0),
            _buildTabIcon(1),
            SizedBox(width: 48),
            _buildTabIcon(2),
            _buildTabIcon(3),
          ],
        ),
      ),
    );
  }

  Widget _buildTabIcon(int index) {
    return IconButton(
      icon: Icon(
        _icons[index],
        color: _selectedIndex == index ? Colors.orange : Colors.grey,
      ),
      onPressed: () => _onItemTapped(index),
    );
  }
}
