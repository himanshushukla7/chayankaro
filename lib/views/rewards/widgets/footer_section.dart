import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Terms and conditions        FAQs',
          style: TextStyle(
            fontSize: 11,
            color: Color(0xFF0C3998),
            letterSpacing: 0.55,
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'You are yet to earn any scratch cards',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.9,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Starts referring to get surprises',
          style: TextStyle(
            fontSize: 13,
            color: Colors.black.withOpacity(0.75),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '......................................................................................',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.6,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Earn 100 coins on every successful referral',
          style: TextStyle(
            fontSize: 12,
            letterSpacing: 0.6,
          ),
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}
