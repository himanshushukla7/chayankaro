import 'package:flutter/material.dart';

class AppliancesRepairsAllScreen extends StatelessWidget {
  const AppliancesRepairsAllScreen({super.key});

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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Appliances & Repairs',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: appliances.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.72,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final appliance = appliances[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFFFFD9BE),
                      width: 1,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      appliance['image']!,
                      fit: BoxFit.contain, // Show full image
                    ),
                  ),
                ),
                Container(
                  height: 25,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFD9BE),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    appliance['title']!,
                    style: const TextStyle(
                      fontSize: 11,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
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
