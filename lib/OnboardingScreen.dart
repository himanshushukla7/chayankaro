import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/onboard1.jpg",
      "title": "Professional Home Services",
      "subtitle": "We provide trusted services at a friendly price — right at your doorstep.",
    },
    {
      "image": "assets/onboard2.jpg",
      "title": "Easy Booking & Scheduling",
      "subtitle": "Book appointments effortlessly and manage your time your way.",
    },
    {
      "image": "assets/onboard3.jpg",
      "title": "Grooming at Your Home",
      "subtitle": "Get salon-quality beauty and personal care services at your home.",
    },
  ];

  void _nextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  void _skip() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        _onboardingData[index]['image']!,
                        height: 220,
                        width: 220,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      _onboardingData[index]['title']!,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'SFProBold',
                        color: Color(0xFFB94D05),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      _onboardingData[index]['subtitle']!,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'SFProRegular',
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),

          // Skip Button
          Positioned(
            top: 50,
            right: 24,
            child: GestureDetector(
              onTap: _skip,
              child: Text(
                "Skip",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'SFProSemibold',
                  color: Color(0xFFFF6F00),
                ),
              ),
            ),
          ),

          // Bottom Arrow
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: _nextPage,
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFF6F00),
                  ),
                  child: Icon(Icons.arrow_forward, color: Colors.white, size: 28),
                ),
              ),
            ),
          ),

          // Indicator Dots
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _onboardingData.length,
                (index) => buildDot(index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      height: 8,
      width: _currentPage == index ? 24 : 8,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: _currentPage == index ? Color(0xFFFF6F00) : Colors.grey.shade300,
      ),
    );
  }
}
