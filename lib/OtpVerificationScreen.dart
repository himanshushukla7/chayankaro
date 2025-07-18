import 'package:flutter/material.dart';
import 'dart:async';

class OtpVerificationScreen extends StatefulWidget {
  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  late Timer _timer;
  int _secondsRemaining = 60;
  bool _canResend = false;
  String _phoneNumber = "";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is String) {
      _phoneNumber = args;
    }
    _startTimer();
  }

  void _startTimer() {
    _canResend = false;
    _secondsRemaining = 60;
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_secondsRemaining == 0) {
        setState(() {
          _canResend = true;
        });
        timer.cancel();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  void _verifyOtp() {
    String otp = _otpController.text.trim();
    if (otp.length == 6) {
      // TODO: Replace this with real verification logic
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a valid 6-digit OTP")),
      );
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter OTP",
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'SFProBold',
                color: Color(0xFFB94D05),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "We sent a 6-digit OTP to +91 $_phoneNumber",
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'SFProRegular',
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 24),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              style: TextStyle(fontFamily: 'SFProRegular', fontSize: 16),
              decoration: InputDecoration(
                hintText: "Enter OTP",
                counterText: "",
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFFF6F00), width: 2),
                ),
              ),
            ),
            SizedBox(height: 12),
            if (!_canResend)
              Text(
                "Resend available in $_secondsRemaining sec",
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'SFProRegular',
                  color: Colors.grey[600],
                ),
              )
            else
              TextButton(
                onPressed: () {
                  _startTimer();
                  // TODO: Resend OTP API call
                },
                child: Text(
                  "Resend OTP",
                  style: TextStyle(
                    fontFamily: 'SFProSemibold',
                    color: Color(0xFFFF6F00),
                  ),
                ),
              ),
            Spacer(),
            ElevatedButton(
              onPressed: _verifyOtp,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF6F00),
                minimumSize: Size(double.infinity, 54),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Verify",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'SFProSemibold',
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
