import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';
import '../booking/booking_screen.dart';
import '../rewards/rewards_screen.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../../widgets/chayan_header.dart'; // New header import

class ChayanSathiScreen extends StatelessWidget {
  final List<Map<String, dynamic>> saathiList = [
    {
      "name": "Pankaj Tiwari",
      "rating": "4.8",
      "jobs": "1.5k",
      "image": "assets/saathi1.png",
    },
    {
      "name": "Sudheer Shukla",
      "rating": "4.7",
      "jobs": "1.2k",
      "image": "assets/saathi3.png",
    },
    {
      "name": "Riya Singh",
      "rating": "4.6",
      "jobs": "980",
      "image": "assets/saathi2.png",
    },
    {
      "name": "Ansh Kumar",
      "rating": "4.9",
      "jobs": "1.7k",
      "image": "assets/saathi1.png",
    },
    {
      "name": "Shweta Mehta",
      "rating": "4.5",
      "jobs": "1.0k",
      "image": "assets/saathi3.png",
    },
    {
      "name": "Sandeep Tripathi",
      "rating": "4.9",
      "jobs": "1.6k",
      "image": "assets/saathi1.png",
    },
  ];

  final int _selectedIndex = 0;

  void _onItemTapped(BuildContext context, int index) {
    if (index == _selectedIndex) return;

    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => BookingScreen()));
        break;
      case 2:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
        break;
      case 3:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => RewardsScreen()));
        break;
      case 4:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ProfileScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background color extending to status bar
          Container(
            height: 100,
            width: double.infinity,
            color: const Color(0xFFFFEDE0),
          ),

          SafeArea(
            bottom: false,
            child: Column(
              children: [
                // 🟠 Updated reusable header
                ChayanHeader(title: 'Chayan Sathi', onBackTap: () {  },),

                // 🧑‍🤝‍🧑 Saathi Grid
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
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) => _onItemTapped(context, index),
      ),
    );
  }
}
