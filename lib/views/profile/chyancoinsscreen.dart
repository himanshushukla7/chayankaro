import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../home/home_screen.dart';
import '../booking/booking_screen.dart';
import '../profile/profile_screen.dart';
import '../chayan_sathi/chayan_sathi_screen.dart';
import '../rewards/rewards_screen.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../../widgets/chayan_header.dart'; // ✅ Import the reusable header

class ChayanCoinsScreen extends StatefulWidget {
  const ChayanCoinsScreen({super.key});

  @override
  State<ChayanCoinsScreen> createState() => _ChayanCoinsScreenState();
}

class _ChayanCoinsScreenState extends State<ChayanCoinsScreen> {
  int _selectedIndex = 4;

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ChayanSathiScreen()));
        break;
      case 1:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => BookingScreen()));
        break;
      case 2:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
        break;
      case 3:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const RewardsScreen()));
        break;
      case 4:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
        break;
    }
  }

  void _launchChayanKaro() async {
    const url = 'https://chayankaro.com';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Replaced manual header with reusable ChaynHeader
              ChayanHeader(title: 'Chayan Coins', onBackTap: () {  },),

              const SizedBox(height: 20),

              // Refer & Earn section
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RewardsScreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE0C7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Refer & earn 100 coins',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Get 100 coins when your friend completes their first booking',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Refer now',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF757575),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.card_giftcard, size: 40, color: Color(0xFFE47830)),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/coins.png',
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Chayan Coins',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0x2BFF9437),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: const Text(
                        '100',
                        style: TextStyle(
                          color: Color(0xFFE47830),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Formely Chayan Coins. Applicable on all services',
                  style: TextStyle(fontSize: 16),
                ),
              ),

              const SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: const Text(
                    'Have a Question?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  children: [
                    GestureDetector(
                      onTap: _launchChayanKaro,
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: Text.rich(
                          TextSpan(
                            text: 'At ',
                            children: [
                              TextSpan(
                                text: 'chayankaro.com',
                                style: TextStyle(color: Colors.blue),
                              ),
                              TextSpan(
                                text:
                                    ', booking a service is simple, transparent, and stress-free. We empower you to choose exactly what you need - with the right professional - at your convenience. Enjoy trusted services, seamless booking, and complete peace of mind, all from the comfort of your home.',
                              ),
                            ],
                          ),
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Divider(thickness: 1, color: Colors.grey),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Wallet Activity',
                  style: TextStyle(fontSize: 20),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Divider(thickness: 1, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
