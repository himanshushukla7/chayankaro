import 'package:flutter/material.dart';
import '../../ac_repair_all/ac_repair_all_screen.dart';

class ACRepairSection extends StatelessWidget {
  const ACRepairSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'AC Repair',
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
                    builder: (_) => const ACRepairAllScreen(),
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
        const SizedBox(height: 12),

        // Scrollable Cards
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              _ACRepairCard(
                imagePath: 'assets/ac_services.png',
                title: 'AC Services',
              ),
              _ACRepairCard(
                imagePath: 'assets/ac_repair.png',
                title: 'AC Repair & Gas Refill',
              ),
              _ACRepairCard(
                imagePath: 'assets/ac_installation.jpg',
                title: 'AC Installation',
              ),
              _ACRepairCard(
                imagePath: 'assets/ac_uninstallation.png',
                title: 'AC Uninstallation',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ACRepairCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const _ACRepairCard({
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 144,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFFFD9BE)),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 144,
            height: 20,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color(0xFFFFD9BE),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontFamily: 'Inter',
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
