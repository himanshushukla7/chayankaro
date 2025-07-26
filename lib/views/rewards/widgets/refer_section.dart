import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReferSection extends StatelessWidget {
  const ReferSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/reward_giftbox.png',
          width: 170,
          height: 170,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 20),
        const Text(
          'Refer and Earn',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'SF Pro',
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        const Opacity(
          opacity: 0.8,
          child: Text(
            'Share the app with friends',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'SF Pro',
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          '...............................................        Refer via        ................................................',
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _SocialIcon(
              icon: FontAwesomeIcons.whatsapp,
              label: 'Whatsapp',
              color: Color(0xFF25D366),
            ),
            _SocialIcon(
              icon: FontAwesomeIcons.facebookMessenger,
              label: 'Messenger',
              color: Color(0xFF0084FF),
            ),
            _SocialIcon(
              icon: Icons.copy,
              label: 'Copy Link',
              color: Colors.black54,
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _SocialIcon({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(icon, color: Colors.white, size: 24),
          ),
        ),
        const SizedBox(height: 8),
        const DefaultTextStyle(
          style: TextStyle(fontSize: 12, color: Colors.white),
          child: Text(""),
        ),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.white)),
      ],
    );
  }
}
