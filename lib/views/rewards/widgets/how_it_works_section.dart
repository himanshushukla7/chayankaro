import 'package:flutter/material.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0x66FF9437),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How it works?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16),
          Text(
            '• Invite your friends & get rewarded',
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 8),
          Text(
            '• They get 100 coins on their first service',
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 8),
          Text(
            '• You get 100 coins once their service is completed',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
