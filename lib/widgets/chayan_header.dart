import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChayanHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;

  const ChayanHeader({
    Key? key,
    required this.title,
    this.onBack, required void Function() onBackTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFFFEEE0); // Your peach color

    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: backgroundColor, // Needed for Android
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light, // For iOS
      ),
      child: Column(
        children: [
          // Fill status bar space with background color
          Container(
            height: statusBarHeight,
            color: backgroundColor,
          ),
          Container(
            height: 56,
            color: backgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                GestureDetector(
                  onTap: onBack ?? () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back_ios_new, size: 20, color: Colors.black),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 32), // Right side spacer to balance
              ],
            ),
          ),
        ],
      ),
    );
  }
}
