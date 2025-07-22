import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'booking_screen.dart';
import 'profile_screen.dart';
import 'rewards_screen.dart';
import 'chayan_sathi_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Background color strip
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 85, // reduced height
              child: Container(
                color: const Color(0xFFFFEDE0),
              ),
            ),

            // Back Button
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
                  'Cart',
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

            // Cart Empty Image
            Positioned(
              top: 200,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 110,
                  height: 110,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/cart_empty.png"),
                      fit: BoxFit.cover,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
              ),
            ),

            // "Your Cart is Empty"
            const Positioned(
              top: 300,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Your Cart is Empty',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SF Pro',
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            // "Lets add some services"
            const Positioned(
              top: 335,
              left: 0,
              right: 0,
              child: Center(
                child: Opacity(
                  opacity: 0.8,
                  child: Text(
                    'Lets add some services',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SF Pro',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),

            // Explore Services Button
            Positioned(
              top: 390,
              left: 0,
              right: 0,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                  child: Container(
                    width: 175,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFFE47830),
                        width: 2,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Explore Services',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'SF Pro',
                        color: Color(0xFFE47830),
                      ),
                    ),
                  ),
                ),
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
