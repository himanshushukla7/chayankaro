import 'package:flutter/material.dart';

// Screens
import '../all_most_used_services/all_most_used_services_screen.dart';
import '/widgets/service_bottom_sheet.dart';
import '../cart/cart_screen.dart';
import '../chayan_sathi/chayan_sathi_screen.dart';
import '../booking/booking_screen.dart';
import '../rewards/rewards_screen.dart';
import '../profile/profile_screen.dart';

// Modular sections
import '../home/widgets/appliances_repairs_section.dart';
import '../home/widgets/salon_men_section.dart';
import '../home/widgets/ac_repair_section.dart';
import '../home/widgets/male_spa_section.dart';
import '../home/widgets/spa_women_section.dart';
import '../home/widgets/saloon_women_section.dart';
import '../home/widgets/horizontal_service_scroll.dart';
import '../../widgets/custom_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2;

  final List<Map<String, String>> categories = [
    {'title': 'Female Saloon', 'icon': 'assets/icons/female_saloon.png'},
    {'title': 'Female Spa', 'icon': 'assets/icons/female_spa.png'},
    {'title': 'Male Saloon', 'icon': 'assets/icons/male_saloon.png'},
    {'title': 'Male Spa', 'icon': 'assets/icons/male_spa.png'},
    {'title': 'Hair & Skin', 'icon': 'assets/icons/hair_skin.png'},
    {'title': 'Home Repairs', 'icon': 'assets/icons/home_repairs.png'},
    {'title': 'Cleaning', 'icon': 'assets/icons/cleaning.png'},
    {'title': 'AC Services', 'icon': 'assets/icons/ac_service.png'},
  ];

  final List<Map<String, dynamic>> goToServices = [
    {
      'title': 'Beauty & Wellness (Men)',
      'subtitle': '10 services',
      'images': ['assets/m1.jpg', 'assets/m2.jpg', 'assets/m3.jpg', 'assets/m4.jpg'],
    },
    {
      'title': 'Appliance and Repair',
      'subtitle': '4 services',
      'images': ['assets/a1.jpg', 'assets/a2.jpg', 'assets/a3.jpg', 'assets/a4.jpg'],
    },
    {
      'title': 'Carpenter & Plumber',
      'subtitle': '2 services',
      'images': ['assets/c1.png', 'assets/c2.png', 'assets/c3.png', 'assets/c4.png'],
    },
  ];

  final List<Map<String, String>> mostUsedServices = [
    {'image': 'assets/z1.png', 'title': 'Window AC frame Installation'},
    {'image': 'assets/z2.png', 'title': 'Women Salon Services'},
    {'image': 'assets/z3.png', 'title': 'Home Deep Cleaning'},
    {'image': 'assets/z4.png', 'title': 'Spa for Men'},
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (_) => ChayanSathiScreen()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (_) => BookingScreen()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (_) => RewardsScreen()));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: 12,
            bottom: MediaQuery.of(context).padding.bottom + 70,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔺 Location and cart
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.location_on_outlined, color: Colors.orange),
                        SizedBox(width: 8),
                        Text(
                          'Home\nIndira Nagar - 226024',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'SFProSemibold',
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const CartScreen()),
                      ),
                      child: const Icon(Icons.shopping_cart_outlined),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // 🔍 Search
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for services',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Color(0xFFF8F6F2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 📦 Categories
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (_, index) {
                    final cat = categories[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xFFFFD9BE)),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x14FFA85F),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(cat['icon']!, width: 40, height: 40),
                            const SizedBox(height: 6),
                            Text(
                              cat['title']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                height: 1.3,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              // 🎯 Banner
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFF8F39), Color(0xFFFF6F00)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Let’s make a package just\nfor you, Manvi!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    "Salon for women",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Icon(Icons.arrow_forward, size: 16, color: Colors.white),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        child: Image.asset(
                          'assets/banner_woman.png',
                          height: 120,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 🧩 Service Sections
              _buildServiceSection('Your go-to services', goToServices),
              const SizedBox(height: 24),
              _buildMostUsedServices(mostUsedServices),
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

  Widget _buildServiceSection(String title, List<Map<String, dynamic>> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'SFProSemibold',
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 12),
            itemCount: data.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final item = data[index];
              return GestureDetector(
                onTap: () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => ServiceBottomSheet(
                    title: item['title'],
                    subtitle: item['subtitle'],
                    images: List<String>.from(item['images']),
                  ),
                ),
                child: Container(
                  width: 170,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x11000000),
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title'],
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item['subtitle'],
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Expanded(
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 4,
                          padding: EdgeInsets.zero,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4,
                            childAspectRatio: 1,
                          ),
                          itemBuilder: (_, i) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                item['images'][i],
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

Widget _buildMostUsedServices(List<Map<String, String>> services) {
  return Padding(
    padding: const EdgeInsets.only(left: 16.0), // Add left padding to whole section
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Most Used Services Heading
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Most used services',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'SFProSemibold',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AllMostUsedServicesScreen(
                      mostUsedServices: mostUsedServices,
                    ),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 16), // maintain right spacing for "View all"
                child: Text(
                  'View all >',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        HorizontalServiceScroll(services: services),
        const SizedBox(height: 24),
        const SaloonWomenSection(),
        const SizedBox(height: 24),
        const SpaWomenSection(),
        const SizedBox(height: 24),
        const MaleSpaSection(),
        const SizedBox(height: 24),
        const ACRepairSection(),
        const SizedBox(height: 24),
        const SalonMenSection(),
        const SizedBox(height: 24),
        const AppliancesRepairsSection(),
        const SizedBox(height: 24),
      ],
    ),
  );
}


}
