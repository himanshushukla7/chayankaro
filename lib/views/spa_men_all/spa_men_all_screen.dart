import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/common_top_bar.dart';
import '../../widgets/custom_bottom_nav_bar.dart';

class MaleSpaAllScreen extends StatelessWidget {
  const MaleSpaAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {'title': 'Swedish Massage', 'image': 'assets/spa_men_swedish.jpg'},
      {'title': 'Back Relief', 'image': 'assets/spa_men_backrelief.jpg'},
      {'title': 'Body Polish', 'image': 'assets/spa_men_bodypolish.jpg'},
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFFFEEE0),
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: const CommonTopBar(
                title: 'Spa - Men',
                showShareIcon: true,
              ),
            ),
            const SizedBox(height: 8),
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
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: 0,
          onItemTapped: (index) {
            // Handle navigation
          },
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
