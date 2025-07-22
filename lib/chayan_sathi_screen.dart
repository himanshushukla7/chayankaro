import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'booking_screen.dart';
import 'rewards_screen.dart';

class ChayanSathiScreen extends StatelessWidget {
  final List<Map<String, dynamic>> saathiList = [
    {
      "name": "Ansh Kumar",
      "rating": "4.8",
      "jobs": "1.3k",
      "image": "assets/saathi1.png",
    },
    {
      "name": "Riya Singh",
      "rating": "4.6",
      "jobs": "980",
      "image": "assets/saathi2.png",
    },
    {
      "name": "Sandeep Tripathi",
      "rating": "4.9",
      "jobs": "1.7k",
      "image": "assets/saathi3.png",
    },
    {
      "name": "Shweta Mehta",
      "rating": "4.7",
      "jobs": "1.1k",
      "image": "assets/saathi2.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Light background for top header
          Container(
            height: 90,
            width: double.infinity,
            color: const Color(0xFFFFEDE0),
          ),

          // Main content
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(Icons.arrow_back, color: Colors.black),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Chayan Sathi',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'SFProDisplay',
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF161616),
                        ),
                      ),
                    ],
                  ),
                ),

                // Grid List
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 90),
                    itemCount: saathiList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.68,
                    ),
                    itemBuilder: (context, index) {
                      final saathi = saathiList[index];
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey.shade300),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                              child: Image.asset(
                                saathi["image"],
                                height: 140,
                                width: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              saathi["name"],
                              style: const TextStyle(
                                fontFamily: 'SFProSemibold',
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star, color: Colors.orange, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  saathi["rating"],
                                  style: const TextStyle(
                                    fontFamily: 'SFPro',
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                const Icon(Icons.work_outline, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  "${saathi["jobs"]} jobs",
                                  style: const TextStyle(
                                    fontFamily: 'SFPro',
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: const Color(0xFFFFFEFD),
            border: Border(top: BorderSide(color: Colors.grey.shade400, width: 0.5)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, -1),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(context, 'Chayan Sathi', 'assets/icons/chayansathi.png', true),
              _buildNavItem(context, 'Bookings', 'assets/icons/bookings.png', false,
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => BookingScreen()))),
              _buildHomeNavItem(context, 'assets/icons/chayankaro.jpg'),
              _buildNavItem(context, 'Rewards', 'assets/icons/rewards.png', false,
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RewardsScreen()))),
              _buildNavItem(context, 'Profile', 'assets/icons/profile.png', false,
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()))),
            ],
          ),
        ),
      ),
    );
  }

  // Normal nav item
  Widget _buildNavItem(BuildContext context, String label, String iconPath, bool isActive,
      {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 65,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 20,
              backgroundImage: AssetImage(iconPath),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'SFPro',
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: isActive ? Colors.black : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Special center logo-only button for Home
  Widget _buildHomeNavItem(BuildContext context, String iconPath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
      },
      child: Container(
        width: 55,
        height: 55,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFFFEDE0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            iconPath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
