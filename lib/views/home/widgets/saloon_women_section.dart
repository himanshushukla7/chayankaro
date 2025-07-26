import 'package:flutter/material.dart';
import '../../saloon_women_all/saloon_women_all_screen.dart';

class SaloonWomenSection extends StatelessWidget {
  const SaloonWomenSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {
        'title1': 'Bleach & Detan',
        'image1': 'assets/saloon_bleach.png',
        'title2': 'Facial & Cleanup',
        'image2': 'assets/saloon_facial.png',
      },
      {
        'title1': 'Pedicure',
        'image1': 'assets/saloon_pedicure.png',
        'title2': 'Threading',
        'image2': 'assets/saloon_threading.png',
      },
      {
        'title1': 'Waxing',
        'image1': 'assets/saloon_waxing.png',
        'title2': 'Manicure',
        'image2': 'assets/saloon_manicure.jpg',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Heading
        Row(
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
                  MaterialPageRoute(
                    builder: (_) => const SaloonWomenAllScreen(),
                  ),
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
        const SizedBox(height: 8),

        // Scrollable card layout
        SizedBox(
          height: 384,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero, // remove default padding
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final item = items[index];
              return Column(
                children: [
                  _ServiceCard(
                    title: item['title1']!,
                    imageAsset: item['image1']!,
                  ),
                  const SizedBox(height: 8),
                  _ServiceCard(
                    title: item['title2']!,
                    imageAsset: item['image2']!,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final String title;
  final String imageAsset;

  const _ServiceCard({required this.title, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
          ),
        ),
      ],
    );
  }
}
