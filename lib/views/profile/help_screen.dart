import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/chayan_header.dart'; // ✅ make sure this is the correct import

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final List<HelpTopic> topics = [
    HelpTopic(
      title: 'Account',
      icon: Icons.person_outline,
      content: '...',
    ),
    HelpTopic(
      title: 'Getting started with Chayan Karo',
      icon: Icons.play_circle_outline,
      content: '...',
    ),
    HelpTopic(
      title: 'Payment & Chayan Coin',
      icon: Icons.account_balance_wallet_outlined,
      content: '...',
    ),
    HelpTopic(
      title: 'Chayan Safety',
      icon: Icons.shield_outlined,
      content: '...',
    ),
    HelpTopic(
      title: 'Claim Warranty',
      icon: Icons.assignment_turned_in_outlined,
      content: '...',
    ),
  ];

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse('https://chayankaro.com');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ✅ Custom Header used across screens
          ChayanHeader(
            title: 'Help',
            onBackTap: () => Navigator.pop(context),
          ),

          // ✅ Main content
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              children: [
                const Text(
                  'All Topics',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.24,
                  ),
                ),
                const SizedBox(height: 30),
                ...topics.map((topic) => HelpExpansionTile(topic: topic, launchUrl: _launchUrl)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HelpTopic {
  final String title;
  final IconData icon;
  final String content;

  HelpTopic({
    required this.title,
    required this.icon,
    required this.content,
  });
}

class HelpExpansionTile extends StatelessWidget {
  final HelpTopic topic;
  final VoidCallback launchUrl;

  const HelpExpansionTile({Key? key, required this.topic, required this.launchUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      leading: Icon(topic.icon, color: Colors.orange, size: 26),
      title: Text(
        topic.title,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 4.0, bottom: 16.0),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'SF Pro',
                height: 1.5,
                color: Colors.black87,
              ),
              children: [
                const TextSpan(text: 'At '),
                TextSpan(
                  text: 'chayankaro.com',
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = launchUrl,
                ),
                const TextSpan(
                  text:
                      ', booking a service is simple, transparent, and stress-free. We empower you to choose exactly what you need – with the right professional – at your convenience. Enjoy trusted services, seamless booking, and complete peace of mind, all from the comfort of your home.',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
