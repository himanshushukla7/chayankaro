import 'package:flutter/material.dart';

class MaleSpaAllScreen extends StatelessWidget {
  const MaleSpaAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spa - Men'),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w600,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMaleSpaCard('assets/spa_men_swedish.jpg', 'Swedish Massage'),
          const SizedBox(height: 16),
          _buildMaleSpaCard('assets/spa_men_backrelief.jpg', 'Back Relief'),
          const SizedBox(height: 16),
          _buildMaleSpaCard('assets/spa_men_bodypolish.jpg', 'Body Polish'),
        ],
      ),
    );
  }

  Widget _buildMaleSpaCard(String imagePath, String label) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFFD9BE), width: 1),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(12),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          backgroundColor: Color(0xFFFFD9BE),
        ),
      ),
    );
  }
}
