import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../widgets/custom_bottom_nav_bar.dart';
import '../../widgets/common_top_bar.dart';

class SalonMenAllScreen extends StatelessWidget {
  const SalonMenAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {
        'title': 'Haircut & beard Styling',
        'image': 'assets/salon_men_haircut_beard.jpg',
      },
      {
        'title': 'Hair colour & Hair spa',
        'image': 'assets/salon_men_haircolor_spa.jpg',
      },
      {
        'title': 'Facial & cleanup',
        'image': 'assets/salon_men_facial_cleanup.jpg',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // ✅ CommonTopBar used here
                CommonTopBar(
                  title: 'Salon - Men',
                  showShareIcon: true,
                  onShare: () {
                    Share.share('Check out Salon - Men services!');
                  },
                ),

                const SizedBox(height: 8),

                // 🔶 Grid Body
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      itemCount: services.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (context, index) {
                        final service = services[index];
                        return _buildServiceCard(service['title']!, service['image']!);
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
