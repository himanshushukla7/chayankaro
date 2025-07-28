import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../widgets/custom_bottom_nav_bar.dart';
import '../../widgets/common_top_bar.dart'; // ✅ Import CommonTopBar

class AppliancesRepairsAllScreen extends StatelessWidget {
  const AppliancesRepairsAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appliances = [
      {'title': 'Chimney', 'image': 'assets/chimney.png'},
      {'title': 'Washing Machine', 'image': 'assets/washing_machine.png'},
      {'title': 'Water Purifier', 'image': 'assets/water_purifier.jpg'},
      {'title': 'Refrigerator', 'image': 'assets/refrigerator.jpg'},
      {'title': 'Air Cooler', 'image': 'assets/air_cooler.jpg'},
      {'title': 'Television', 'image': 'assets/television.jpg'},
      {'title': 'AC Services and Repair', 'image': 'assets/ac_repair.png'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // ✅ Common Top Bar
                CommonTopBar(
                  title: 'Appliances & Repairs',
                  showShareIcon: true,
                  onBack: () => Navigator.pop(context),
                  onShare: () {
                    Share.share('Check out Appliances & Repairs services!');
                  },
                ),

                const SizedBox(height: 8),

                // 🔶 Grid Body
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
                    child: GridView.builder(
                      itemCount: appliances.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (context, index) {
                        final appliance = appliances[index];
                        return _buildServiceCard(appliance['title']!, appliance['image']!);
                      },
                    ),
                  ),
                ),
              ],
            ),

            // 🔶 Bottom Navigation Bar
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: CustomBottomNavBar(
                selectedIndex: 0,
                onItemTapped: (index) {
                  // Handle navigation
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(String title, String imageAsset) {
    return GestureDetector(
      onTap: () {
        // Open service details / sheet
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFFFD9BE), width: 1),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imageAsset,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 8,
              bottom: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD9BE),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
