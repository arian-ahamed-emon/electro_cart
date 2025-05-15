import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:electro_cart/features/home/data/models/aririvals_product_model.dart';
import 'package:electro_cart/features/home/ui/screens/notification_screen.dart';
import 'package:electro_cart/features/home/ui/widgets/flash_sell_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/product_model.dart';
import '../widgets/category_section.dart';

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
  final List<NewArrivalsProduct> arrivalItems = [
    NewArrivalsProduct(
      oldPrice: 120,
      price: 130,
      discountPrice: 300,
      title: 'BrandNew BackPack 9x Expensive',
      image: 'assets/images/bag-1.png',
    ),
    NewArrivalsProduct(
      oldPrice: 120,
      price: 130,
      discountPrice: 300,
      title: 'BrandNew BackPack 9x Expensive',
      image: 'assets/images/bag-1.png',
    ),
    NewArrivalsProduct(
      oldPrice: 120,
      price: 130,
      discountPrice: 300,
      title: 'BrandNew BackPack 9x Expensive',
      image: 'assets/images/bag-1.png',
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
      drawer: SafeArea(child: Drawer(child: buildDrawerSection(context))),
      appBar: AppBar(
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
                child: Image.asset('assets/images/app-drawer.png', height: 30.h),
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
                height: 200.0.h,
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
            SizedBox(height: 10),
            CategorySection(
              title: 'Category',
              buttonText: 'See All',
              onPressed: () {},
            ),
            buildCategorySection(),
            Padding(padding: const EdgeInsets.all(8.0), child: FlashSaleBar()),
            SizedBox(
              height: 160.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: flashItems.length,
                itemBuilder: (context, index) {
                  final item = flashItems[index];
                  return _buildProductCard(item);
                },
              ),
            ),
            CategorySection(
              title: 'New Arrivals ',
              buttonText: 'See All',
              onPressed: () {},
            ),
            SizedBox(
              height: 230,
              child: ListView.builder(
                itemCount: arrivalItems.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final item = arrivalItems[index];
                  return _buildNewArrivalCard(item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column buildDrawerSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.orange),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundImage: AssetImage(
                  'assets/images/profile.jpg',
                ), // Use user's profile image
              ),
              SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, Arian 👋",
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                  Text(
                    "dev.emon.bd@gmail.com",
                    style: TextStyle(fontSize: 14.sp, color: Colors.white70),
                  ),
                ],
              ),
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.home, color: Colors.orange),
          title: Text("Home"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.shopping_cart, color: Colors.orange),
          title: Text("My Cart"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.favorite, color: Colors.orange),
          title: Text("Wishlist"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.category, color: Colors.orange),
          title: Text("Categories"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.notifications, color: Colors.orange),
          title: Text("Notifications"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationScreen()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.settings, color: Colors.orange),
          title: Text("Settings"),
          onTap: () {},
        ),
        Spacer(),
        Divider(),
        ListTile(
          leading: Icon(Icons.logout, color: Colors.redAccent),
          title: Text("Logout"),
          onTap: () {
            // Handle logout logic
          },
        ),
      ],
    );
  }

  Widget _buildNewArrivalCard(NewArrivalsProduct item) {
    return Container(
      width: 160.w,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5.r, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  item.image,
                  height: 150.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 6,
                left: 6,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "-${item.discountPrice}%",
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
                  ),
                ),
              ),
              Positioned(
                bottom: 6,
                right: 6,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 14.r,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                    size: 18.sp,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "\$${item.price}",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$${item.oldPrice}",
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Product item) {
    return Container(
      width: 140.w,
      margin: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 100.h,
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
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
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
      height: 90.h,
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
                    height: 60.h,
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
                    blurRadius: 10.r,
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
                height: 20.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
