import 'package:flutter/material.dart';

class SpaWomenAllScreen extends StatelessWidget {
  const SpaWomenAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Spa - Women Services',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: [
          _buildSpaCard('assets/spa_massage.png'),
          _buildSpaCard('assets/spa_scrub.png'),
          _buildSpaCard('assets/spa_steam.png'),
          _buildSpaCard('assets/spa_aromatherapy.png'),
        ],
      ),
    );
  }

  Widget _buildSpaCard(String imagePath) {
    return Container(
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
}
