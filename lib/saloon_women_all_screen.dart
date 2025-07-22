import 'package:flutter/material.dart';

class SaloonWomenAllScreen extends StatelessWidget {
  const SaloonWomenAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {'title': 'Bleach & Detan', 'image': 'assets/saloon_bleach.png'},
      {'title': 'Pedicure', 'image': 'assets/saloon_pedicure.png'},
      {'title': 'Waxing', 'image': 'assets/saloon_waxing.png'},
      {'title': 'Facial & Cleanup', 'image': 'assets/saloon_facial.png'},
      {'title': 'Threading', 'image': 'assets/saloon_threading.png'},
      {'title': 'Manicure', 'image': 'assets/saloon_manicure.jpg'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Saloon - Women',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'SF Pro',
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
    );
  }

  Widget _buildServiceCard(String title, String imageAsset) {
    return GestureDetector(
      onTap: () {
        // Handle navigation or sheet
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageAsset),
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
      ),
    );
  }
}
