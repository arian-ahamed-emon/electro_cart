import 'package:electro_cart/features/auth/ui/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final userName = 'Arian Ahmed Emon';
    final email = 'dev.emon.bd@gmail.com';
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orangeAccent, Colors.orange],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.r),
                    bottomRight: Radius.circular(30.r),
                  ),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60.r,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      userName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      email,
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.purple,
                        shape: StadiumBorder(),
                      ),
                      child: Text("Edit Profile"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Wallet & Points
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildInfoCard(
                      "Wallet",
                      "\$120.00",
                      Icons.account_balance_wallet,
                    ),
                    _buildInfoCard("Points", "120", Icons.stars),
                    _buildInfoCard("Status", "Gold", Icons.verified),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Quick Actions
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  childAspectRatio: 1,
                  children: [
                    _buildActionItem(Icons.shopping_bag, "My Orders"),
                    _buildActionItem(Icons.favorite, "Wishlist"),
                    _buildActionItem(Icons.settings, "Settings"),
                    _buildActionItem(Icons.local_shipping, "Track Order"),
                    _buildActionItem(Icons.card_giftcard, "Coupons"),
                    _buildActionItem(Icons.support_agent, "Support"),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Settings Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _buildSettingsTile(
                      Icons.notifications,
                      "Notifications",
                      onTap: () {},
                    ),
                    _buildSettingsTile(
                      Icons.language,
                      "Language",
                      onTap: () {},
                    ),
                    _buildSettingsTile(
                      Icons.lock,
                      "Change Password",
                      onTap: () {},
                    ),
                    _buildSettingsTile(
                      Icons.logout,
                      "Log Out",
                      color: Colors.red,
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                          (_) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value, IconData icon) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 100.w,
        child: Column(
          children: [
            Icon(icon, color: Colors.deepPurple),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            Text(title, style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildActionItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.purple[50],
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(12),
          child: Icon(icon, color: Colors.deepPurple),
        ),
        const SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 12.sp)),
      ],
    );
  }

  Widget _buildSettingsTile(
    IconData icon,
    String title, {
    Color color = Colors.black,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(color: color)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: color),
      onTap: onTap,
    );
  }
}
