import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'booking_screen.dart';
import 'profile_screen.dart';
import 'chayan_sathi_screen.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Stack(
          children: [
            // Top header background strip
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 85,
              child: Container(
                color: const Color(0xFFFFEDE0),
              ),
            ),

            // Back button
            Positioned(
              top: 16,
              left: 16,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 45,
                  height: 41,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEDE0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(Icons.arrow_back_ios_new, size: 18),
                ),
              ),
            ),

            // Title
            const Positioned(
              top: 26,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Rewards',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF161616),
                    fontFamily: 'SF Pro',
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ),

            // Reward illustration
            Positioned(
              top: 160,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  'assets/reward_giftbox.png',
                  width: 170,
                  height: 170,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Main message
            const Positioned(
              top: 340,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Refer and Earn',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SF Pro',
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            const Positioned(
              top: 375,
              left: 0,
              right: 0,
              child: Center(
                child: Opacity(
                  opacity: 0.8,
                  child: Text(
                    'Share the app with friends',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SF Pro',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),

            // Share buttons
            Positioned(
              top: 430,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _shareIcon('assets/icons/whatsapp.png'),
                  _shareIcon('assets/icons/fb.png'),
                  _shareIcon('assets/icons/gift.png'),
                  _shareIcon('assets/icons/copy.png'),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        elevation: 8,
        color: const Color(0xFFFFFEFD),
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                context,
                iconPath: 'assets/icons/chayansathi.png',
                label: 'Chayan Sathi',
                screen: ChayanSathiScreen(),
              ),
              _buildNavItem(
                context,
                iconPath: 'assets/icons/bookings.png',
                label: 'Bookings',
                screen: BookingScreen(),
              ),
              _buildCenterNavItem(
                context,
                iconPath: 'assets/icons/chayankaro.jpg',
                screen: const HomeScreen(),
              ),
              _buildNavItem(
                context,
                iconPath: 'assets/icons/rewards.png',
                label: 'Rewards',
                screen: const RewardsScreen(),
              ),
              _buildNavItem(
                context,
                iconPath: 'assets/icons/profile.png',
                label: 'Profile',
                screen: const ProfileScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _shareIcon(String imagePath) {
    return GestureDetector(
      onTap: () {
        // Share logic (placeholder)
      },
      child: Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFFFFEDE0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context,
      {required String iconPath, required String label, required Widget screen}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => screen),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, width: 30, height: 30),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontFamily: 'SF Pro',
              color: Colors.black,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCenterNavItem(BuildContext context,
      {required String iconPath, required Widget screen}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => screen),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFE47830), width: 2),
        ),
        child: Image.asset(iconPath, width: 34, height: 34, fit: BoxFit.cover),
      ),
    );
  }
}
