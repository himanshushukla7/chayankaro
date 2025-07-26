import 'package:flutter/material.dart';
import '../../appliances_repairs_all/appliances_repairs_all_screen.dart';

class AppliancesRepairsSection extends StatelessWidget {
  const AppliancesRepairsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> appliances = [
      {'title': 'Chimney', 'image': 'assets/chimney.png'},
      {'title': 'Washing Machine', 'image': 'assets/washing_machine.png'},
      {'title': 'Water Purifier', 'image': 'assets/water_purifier.jpg'},
      {'title': 'Refrigerator', 'image': 'assets/refrigerator.jpg'},
      {'title': 'Air Cooler', 'image': 'assets/air_cooler.jpg'},
      {'title': 'Television', 'image': 'assets/television.jpg'},
      {'title': 'AC Services and Repair', 'image': 'assets/ac_repair.png'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Appliances & Repairs',
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AppliancesRepairsAllScreen(),
                  ),
                );
              },
              child: const Text(
                'View All >',
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Color(0xFFE47830),
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
            children: appliances.map((appliance) {
              return Container(
                margin: const EdgeInsets.only(right: 12),
                child: Column(
                  children: [
                    Container(
                      width: 144,
                      height: 164,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFFFFD9BE),
                          width: 1,
                        ),
                        image: DecorationImage(
                          image: AssetImage(appliance['image']!),
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
                        appliance['title']!,
                        style: const TextStyle(
                          fontSize: 10,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
