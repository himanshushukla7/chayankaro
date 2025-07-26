import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import '../booking/booking_screen.dart';
import '../chayan_sathi/chayan_sathi_screen.dart';
import '../rewards/rewards_screen.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../profile/EditProfileScreen.dart';
import '../profile/manage_address_screen.dart';
import '../profile/help_screen.dart';
import '../profile/chyancoinsscreen.dart';
import '../profile/rating_screen.dart';
import '../../widgets/chayan_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
        break;
      case 3:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => RewardsScreen()));
        break;
      case 4:
        break;
    }
  }

  Widget buildQuickAction(String label, String iconPath) {
    return Container(
      width: 97,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xB5E47830)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFFFFEDE0),
            radius: 20,
            child: Image.asset(
              iconPath,
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF161616),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListItem(String iconPath, String label, {VoidCallback? onTap}) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(0xFFFFF2E6),
        child: ColorFiltered(
          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
          child: Image.asset(iconPath, width: 20, height: 20),
        ),
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ChayanHeader(title: 'Profile', onBackTap: () {  },),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                const SizedBox(height: 24),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/icons/userprofile.png'),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Ayush Srivastav (LALA)',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '+91 7355640235',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF161616),
                          ),
                        ),
                        SizedBox(height: 2),
                        Opacity(
                          opacity: 0.55,
                          child: Text(
                            '9.9 Rating',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF161616),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE47830),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(Icons.edit, color: Colors.white, size: 20),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => BookingScreen()));
                      },
                      child: buildQuickAction("My Bookings", 'assets/icons/bookings.png'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const ChayanCoinsScreen()));
                      },
                      child: buildQuickAction("My Chayan Coins", 'assets/icons/coins.png'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const HelpScreen()));
                      },
                      child: buildQuickAction("Help & Support", 'assets/icons/help.png'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Divider(color: Color(0xFFEBEBEB)),
                buildListItem('assets/icons/location.png', "Manage Address", onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ManageAddressScreen()));
                }),
                buildListItem('assets/icons/refer.png', "Refer & Earn", onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const RewardsScreen()));
                }),
                buildListItem('assets/icons/rate.png', "Rate us", onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => RatingScreen()));
                }),
                buildListItem('assets/icons/about.png', "About Chayan karo Services"),
                buildListItem('assets/icons/settings.png', "Settings"),
                buildListItem('assets/icons/logout.png', "Logout"),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEDE0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.card_giftcard, size: 50, color: Color(0xFFE47830)),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Refer & earn 100 coins',
                              style: TextStyle(
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Get 100 coins when your friend completes their first booking',
                              style: TextStyle(
                                fontFamily: 'SF Pro',
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
