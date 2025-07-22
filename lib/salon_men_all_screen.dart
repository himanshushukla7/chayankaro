import 'package:flutter/material.dart';

class SalonMenAllScreen extends StatelessWidget {
  const SalonMenAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> services = [
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
      appBar: AppBar(
        title: const Text("Salon - Men"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: services.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final service = services[index];
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(service['image']!),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(color: const Color(0xFFFFD9BE)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  width: double.infinity,
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
                  service['title']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
