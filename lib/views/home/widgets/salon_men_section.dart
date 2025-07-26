import 'package:flutter/material.dart';
import '../../salon_men_all/salon_men_all_screen.dart';

class SalonMenSection extends StatelessWidget {
  const SalonMenSection({super.key});

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
              "Salon - Men",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SalonMenAllScreen(),
                  ),
                );
              },
              child: const Text(
                "View All >",
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              _SalonMenTile(
                imagePath: 'assets/salon_men_haircut_beard.jpg',
                label: 'Haircut & Beard Styling',
              ),
              _SalonMenTile(
                imagePath: 'assets/salon_men_haircolor_spa.jpg',
                label: 'Hair Colour & Hair Spa',
              ),
              _SalonMenTile(
                imagePath: 'assets/salon_men_facial_cleanup.jpg',
                label: 'Facial & Cleanup',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SalonMenTile extends StatelessWidget {
  final String imagePath;
  final String label;

  const _SalonMenTile({
    required this.imagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 144,
            height: 164,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFFFD9BE), width: 1),
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
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
