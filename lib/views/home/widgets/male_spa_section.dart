import 'package:flutter/material.dart';
import '../../spa_men_all/spa_men_all_screen.dart';

class MaleSpaSection extends StatelessWidget {
  const MaleSpaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Row
        Row(
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
        const SizedBox(height: 12),

        // Horizontal Scroll Cards
        SizedBox(
          height: 186, // 164 image + 22 label
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _maleSpaItems.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final item = _maleSpaItems[index];
              return _MaleSpaCard(
                imagePath: item['imagePath']!,
                label: item['label']!,
              );
            },
          ),
        ),
      ],
    );
  }
}

final List<Map<String, String>> _maleSpaItems = [
  {
    'imagePath': 'assets/spa_men_swedish.jpg',
    'label': 'Swedish Massage',
  },
  {
    'imagePath': 'assets/spa_men_backrelief.jpg',
    'label': 'Back Relief',
  },
  {
    'imagePath': 'assets/spa_men_bodypolish.jpg',
    'label': 'Body Polish',
  },
];

class _MaleSpaCard extends StatelessWidget {
  final String imagePath;
  final String label;

  const _MaleSpaCard({
    required this.imagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 144,
          height: 164,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFFFD9BE), width: 1),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: 144,
          height: 22,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color(0xFFFFD9BE),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
