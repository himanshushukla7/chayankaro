import 'package:flutter/material.dart';

class ACRepairAllScreen extends StatelessWidget {
  const ACRepairAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AC Repair Services'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          final serviceTitles = [
            "AC Services",
            "AC Repair & Gas Refill",
            "AC Installation",
            "AC Uninstallation"
          ];
          final imageNames = [
            "ac_services.png",
            "ac_repair.png",
            "ac_installation.jpg",
            "ac_uninstallation.png"
          ];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFFFD9BE)),
              image: DecorationImage(
                image: AssetImage("assets/${imageNames[index]}"),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFD9BE),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Text(
                  serviceTitles[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 10,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
