import 'package:flutter/material.dart';
import 'all_most_used_services_screen.dart';
import 'service_bottom_sheet.dart';
import 'cart_screen.dart';
import 'saloon_women_all_screen.dart';
import 'spa_women_all_screen.dart';
import 'spa_men_all_screen.dart';
import 'ac_repair_all_screen.dart';
import 'salon_men_all_screen.dart';
import 'appliances_repairs_all_screen.dart';


import 'chayan_sathi_screen.dart';
import 'booking_screen.dart';
import 'rewards_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2; // Home tab is center

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

    // Navigate to appropriate screens except for index 2 (home)
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (_) => ChayanSathiScreen()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (_) => BookingScreen()));
        break;
      case 2:
        // Already on HomeScreen
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
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16, 12, 16, MediaQuery.of(context).viewInsets.bottom + 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.location_on_outlined, color: Colors.orange),
                          SizedBox(width: 8),
                          Text(
                            'Home\nIndira Nagar - 226024',
                            style: TextStyle(fontSize: 14, fontFamily: 'SFProSemibold', height: 1.3),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen()));
                        },
                        child: const Icon(Icons.shopping_cart_outlined),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Search Bar
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for services',
                      prefixIcon: const Icon(Icons.search),
                      fillColor: const Color(0xFFF8F6F2),
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Categories Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: categories.length,
                    padding: EdgeInsets.zero,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (_, index) {
                      final cat = categories[index];
                      return Column(
                        children: [
                          Container(
                            height: 56,
                            width: 56,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF5EB),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(child: Image.asset(cat['icon']!, height: 28)),
                          ),
                          const SizedBox(height: 6),
                          Text(cat['title']!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  // Banner
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF8F39), Color(0xFFFF6F00)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
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
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'SFProSemibold',
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                      "Salon for women",
                                      style: TextStyle(fontSize: 12, color: Colors.white, fontFamily: 'SFProRegular'),
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
                          child: Image.asset('assets/banner_woman.png', height: 120, width: 100, fit: BoxFit.cover),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildServiceSection('Your go-to services', goToServices),
                  const SizedBox(height: 24),
                  _buildMostUsedServices(mostUsedServices),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFFFFFEFD),
        elevation: 8,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem('assets/icons/chayansathi.png', 'Chayan Sathi', 0),
              _buildNavItem('assets/icons/bookings.png', 'Bookings', 1),
              _buildCenterNavItem('assets/icons/chayankaro.jpg'),
              _buildNavItem('assets/icons/rewards.png', 'Rewards', 3),
              _buildNavItem('assets/icons/profile.png', 'Profile', 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String iconPath, String label, int index) {
    final isActive = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(iconPath, width: 28, height: 28, color: isActive ? Colors.black : Colors.grey),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isActive ? Colors.black : Colors.grey,
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCenterNavItem(String iconPath) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFFF6F00), width: 2),
      ),
      child: Image.asset(iconPath, width: 32, height: 32),
    );
  }


  Widget _buildServiceSection(String title, List<Map<String, dynamic>> data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'SFProSemibold',
        ),
      ),
      const SizedBox(height: 12),
      SizedBox(
        height: 160,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final item = data[index];
            return GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => ServiceBottomSheet(
                    title: item['title'],
                    subtitle: item['subtitle'],
                    images: List<String>.from(item['images']),
                  ),
                );
              },
              child: Container(
                width: 220,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title'],
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: Text(
                        item['subtitle'],
                        style: const TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: List.generate(2, (colIndex) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Column(
                            children: List.generate(2, (rowIndex) {
                              int imageIndex = colIndex + rowIndex * 2;
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    item['images'][imageIndex],
                                    width: 52,
                                    height: 47,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      }),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title & View All
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Most used services', style: TextStyle(fontSize: 16, fontFamily: 'SFProSemibold')),
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
              child: const Text('View All', style: TextStyle(color: Colors.orange)),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Horizontal Scroll Cards
        SizedBox(
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];
              return Container(
                width: 160,
                margin: const EdgeInsets.only(right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 116,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(service['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      service['title']!,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'Inter'),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Text('4.8 (23k)', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                        const SizedBox(width: 4),
                        Image.asset('assets/star.jpg', height: 16, width: 16),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: const [
                        Text('₹499', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Color(0xFFFA9441))),
                        SizedBox(width: 6),
                        Text('₹599', style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400, color: Color(0xFF757575), decoration: TextDecoration.lineThrough)),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      const SizedBox(height: 24),
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16),
child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    const Text(
      'Saloon - Women',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: 'SF Pro',
      ),
    ),
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const SaloonWomenAllScreen()),
        );
      },
      child: const Text(
        'View All',
        style: TextStyle(
          fontSize: 13,
          color: Color(0xFFFF6F00),
        ),
      ),
    ),
  ],
),

),
const SizedBox(height: 12),
_singleRow([
  _buildServiceCard('Bleach & Detan', 'assets/saloon_bleach.png'),
  _buildServiceCard('Pedicure', 'assets/saloon_pedicure.png'),
  _buildServiceCard('Waxing', 'assets/saloon_waxing.png'),
]),
const SizedBox(height: 12),
_singleRow([
  _buildServiceCard('Facial & Cleanup', 'assets/saloon_facial.png'),
  _buildServiceCard('Threading', 'assets/saloon_threading.png'),
  _buildServiceCard('Manicure', 'assets/saloon_manicure.jpg'),
]),
// == Spa - Women Section ==
Padding(
  padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Spa - Women',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: 'SF Pro',
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SpaWomenAllScreen()),
          );
        },
        child: const Text(
          'View All',
          style: TextStyle(
            fontSize: 13,
            color: Color(0xFFFF6F00),
          ),
        ),
      ),
    ],
  ),
),
const SizedBox(height: 12),

// == Horizontal List ==
SizedBox(
  height: 170,
  child: ListView(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    children: [
      _buildSpaCard('assets/spa_massage.png'),
      const SizedBox(width: 12),
      _buildSpaCard('assets/spa_scrub.png'),
      const SizedBox(width: 12),
      _buildSpaCard('assets/spa_steam.png'),
    ],
  ),
),
// Male Spa Section
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Spa - Men',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: 'SF Pro',
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const MaleSpaAllScreen()),
          );
        },
        child: const Text(
          'View All',
          style: TextStyle(
            fontSize: 13,
            color: Color(0xFFFF6F00),
          ),
        ),
      ),
    ],
  ),
),
const SizedBox(height: 8),
SizedBox(
  height: 164,
  child: ListView(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.only(left: 16),
    children: [
      _buildMaleSpaCard('assets/spa_men_swedish.jpg', 'Swedish Massage'),
      const SizedBox(width: 12),
      _buildMaleSpaCard('assets/spa_men_backrelief.jpg', 'Back Relief'),
      const SizedBox(width: 12),
      _buildMaleSpaCard('assets/spa_men_bodypolish.jpg', 'Body Polish'),
      const SizedBox(width: 16),
    ],
  ),
),
// AC Repair Section
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'AC Repair',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: 'SF Pro',
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ACRepairAllScreen()),
          );
        },
        child: const Text(
          'View All',
          style: TextStyle(
            fontSize: 13,
            color: Color(0xFFFF6F00),
          ),
        ),
      ),
    ],
  ),
),

const SizedBox(height: 12),

SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  padding: const EdgeInsets.only(left: 16),
  child: Row(
    children: [
      _buildACRepairCard('assets/ac_services.png', 'AC Services'),
      const SizedBox(width: 12),
      _buildACRepairCard('assets/ac_repair.png', 'AC Repair & Gas Refill'),
      const SizedBox(width: 12),
      _buildACRepairCard('assets/ac_installation.jpg', 'AC Installation'),
      const SizedBox(width: 12),
      _buildACRepairCard('assets/ac_uninstallation.png', 'AC Uninstallation'),
      const SizedBox(width: 16),
    ],
  ),
),

const SizedBox(height: 24),
// ----------------------
// SALON - MEN SECTION
// ----------------------
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        "Salon - Men",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SalonMenAllScreen()),
          );
        },
        child: const Text(
          "All >",
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ],
  ),
),
SizedBox(
  height: 200,
  child: ListView(
    scrollDirection: Axis.horizontal,
    children: [
      _buildSalonMenTile('assets/salon_men_haircut_beard.jpg', 'Haircut & beard Styling'),
      _buildSalonMenTile('assets/salon_men_haircolor_spa.jpg', 'Hair colour & Hair spa'),
      _buildSalonMenTile('assets/salon_men_facial_cleanup.jpg', 'Facial & cleanup'),
    ],
  ),
),
const SizedBox(height: 12),

appliancesRepairsSection(context),
const SizedBox(height: 20),

         ],
 );
  }
}
Widget _singleRow(List<Widget> cards) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      children: [
        ...cards.expand((card) => [card, const SizedBox(width: 12)]).toList()..removeLast(),
      ],
    ),
  );
}

Widget _buildServiceCard(String title, String imageAsset) {
  return GestureDetector(
    onTap: () {
      // Add navigation or modal logic here
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 144,
          height: 164,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageAsset),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFFFD9BE), width: 1),
          ),
        ),
        Container(
          width: 144,
          height: 22,
          decoration: const BoxDecoration(
            color: Color(0xFFFFD9BE),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
          ),
        ),
      ],
    ),
  );
}
Widget _buildSpaCard(String imagePath) {
  return Container(
    width: 144,
    height: 164,
    decoration: ShapeDecoration(
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFFFFD9BE)),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

Widget _buildMaleSpaCard(String imagePath, String label) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 144,
        height: 134,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFFFD9BE), width: 1),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
      const SizedBox(height: 4),
      Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          fontFamily: 'Inter',
        ),
      ),
    ],
  );
}
Widget _buildACRepairCard(String imagePath, String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 116,
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFFFD9BE)),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
      const SizedBox(height: 6),
      Opacity(
        opacity: 0.80,
        child: SizedBox(
          width: 116,
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 8,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ],
  );
}
Widget _buildSalonMenTile(String imagePath, String label) {
  return Padding(
    padding: const EdgeInsets.only(right: 12),
    child: Column(
      children: [
        Container(
          width: 144,
          height: 164,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            border: Border.all(color: const Color(0xFFFFD9BE)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          width: 144,
          height: 15,
          decoration: const BoxDecoration(
            color: Color(0xFFFFD9BE),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}

Widget appliancesRepairsSection(BuildContext context) {
  final List<Map<String, String>> appliances = [
    {'title': 'Chimney', 'image': 'assets/chimney.png'},
    {'title': 'Washing Machine', 'image': 'assets/washing_machine.png'},
    {'title': 'Water Purifier', 'image': 'assets/water_purifier.jpg'},
    {'title': 'Refrigerator', 'image': 'assets/refrigerator.jpg'},
    {'title': 'Air Cooler', 'image': 'assets/air_cooler.jpg'},
    {'title': 'Television', 'image': 'assets/television.jpg'},
    {'title': 'AC Services and Repair', 'image': 'assets/ac_repair.png'},
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Appliances & Repairs',
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AppliancesRepairsAllScreen(),
                  ),
                );
              },
              child: const Text(
                'All >',
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Color(0xFFE47830),
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 210,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemCount: appliances.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final appliance = appliances[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(appliance['image']!),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: const Color(0xFFFFD9BE),
                      width: 1,
                    ),
                  ),
                ),
                Container(
                  width: 120,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFD9BE),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    appliance['title']!,
                    style: const TextStyle(
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    ],
  );
}
