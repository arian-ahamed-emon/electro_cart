import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:electro_cart/views/notification/notification_screen.dart';
import 'package:electro_cart/widgets/flash_sell_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/product_model.dart';
import '../../widgets/category_section.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  final List<String> _sliderImage = [
    'assets/images/sliders/slider1.jpg',
    'assets/images/sliders/slider2.jpg',
    'assets/images/sliders/slider3.jpg',
    'assets/images/sliders/slider4.jpg',
  ];

  List<Map<String, String>> _categories = [
    {
      "title": "Home Appliances",
      "image": 'assets/images/categoris/appliance.png',
    },
    {"title": "Furniture", "image": 'assets/images/categoris/sofa.png'},
    {"title": "Books", "image": 'assets/images/categoris/books.png'},
    {"title": "Toys", "image": 'assets/images/categoris/toys.png'},
    {"title": "Sports", "image": 'assets/images/categoris/sports.png'},
    {"title": "Groceries", "image": 'assets/images/categoris/grocery.png'},
    {"title": "Mobile Phones", "image": 'assets/images/categoris/phones.png'},
  ];

  final List<Product> flashItems = [
    Product(
      120.00,
      title: 'Headphone With 9x Volume Sound',
      image: 'assets/images/headphone.png',
      price: 239,
      discountedPrice: 199,
    ),
    Product(
      120.00,
      title: 'Headphone With 9x Volume Sound',
      image: 'assets/images/headphone.png',
      price: 239,
      discountedPrice: 199,
    ),
    Product(
      120.00,
      title: 'Headphone With 9x Volume Sound',
      image: 'assets/images/headphone.png',
      price: 239,
      discountedPrice: 199,
    ),
    Product(
      120.00,
      title: 'Headphone With 9x Volume Sound',
      image: 'assets/images/headphone.png',
      price: 239,
      discountedPrice: 199,
    ),
    Product(
      120.00,
      title: 'Headphone With 9x Volume Sound',
      image: 'assets/images/headphone.png',
      price: 239,
      discountedPrice: 199,
    ),
  ];

  Duration remainingTime = Duration(hours: 1);
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (remainingTime.inSeconds > 0) {
        setState(() {
          remainingTime -= Duration(seconds: 1);
        });
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  String twoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(child: Drawer(backgroundColor: Colors.orange)),
      appBar: AppBar(
        //backgroundColor: Colors.amberAccent,
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
                );
              },
              icon: Icon(Icons.notifications, color: Colors.black),
            ),
          ),
        ],
        title: Image.asset(
          'assets/images/Logo.png',
          height: 130.h,
          width: 160.w,
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset('assets/images/app-drawer.png', height: 30),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            buildSearchBar(),
            SizedBox(height: 15),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                viewportFraction: 0.9,
              ),
              items:
                  _sliderImage.map((imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        );
                      },
                    );
                  }).toList(),
            ),
            SizedBox(height: 15),
            category_section(),
            SizedBox(height: 10),
            buildCategorySection(),
            Padding(padding: const EdgeInsets.all(8.0), child: FlashSaleBar()),
            SizedBox(height: 10),
            SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: flashItems.length,
                itemBuilder: (context, index) {
                  final item = flashItems[index];
                  return _buildProductCard(item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(Product item) {
    return Container(
      width: 140,
      margin: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(item.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 6,
                left: 6,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "-${item.discountedPrice}%",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(item.title, maxLines: 1, overflow: TextOverflow.ellipsis),
          SizedBox(height: 4),
          Text(
            "\$${item.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "\$${item.oldPrice}",
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildCategorySection() {
    return SizedBox(
      height: 120,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: _categories.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          final category = _categories[index];
          return Container(
            width: 120.w,
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: Image.asset(
                    category['image']!,
                    height: 60,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(category['title']!, style: TextStyle()),
              ],
            ),
          );
        },
      ),
    );
  }

  Padding buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          Container(
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/images/slider-navigation.png',
                height: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
