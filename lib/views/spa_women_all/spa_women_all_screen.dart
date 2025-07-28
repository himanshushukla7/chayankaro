import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/custom_bottom_nav_bar.dart';
import '../../widgets/common_top_bar.dart'; // ✅ Reusable header

class SpaWomenAllScreen extends StatelessWidget {
  const SpaWomenAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final spaServices = [
      {'title': 'Massage', 'image': 'assets/spa_massage.png'},
      {'title': 'Body Scrub', 'image': 'assets/spa_scrub.png'},
      {'title': 'Steam Therapy', 'image': 'assets/spa_steam.png'},
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
                title: 'All Spa - Women Services',
                showShareIcon: true,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  itemCount: spaServices.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    final service = spaServices[index];
                    return _buildSpaCard(service['title']!, service['image']!);
                  },
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: 0,
          onItemTapped: (index) {
            // TODO: Implement navigation
          },
        ),
      ),
    );
  }

  Widget _buildSpaCard(String title, String imagePath) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFFFD9BE), width: 1),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFFFD9BE),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
          ),
        ),
      ],
    );
  }
}
