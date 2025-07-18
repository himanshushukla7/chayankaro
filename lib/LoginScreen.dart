import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();

  void _continueToOtp() {
    if (_phoneController.text.isNotEmpty && _phoneController.text.length == 10) {
      Navigator.pushNamed(context, '/otp', arguments: _phoneController.text);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a valid 10-digit mobile number")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/logo.jpg", height: 120),
              SizedBox(height: 40),
              Text(
                "Enter Mobile Number",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SFProBold',
                  color: Color(0xFFB94D05),
                ),
              ),
              SizedBox(height: 12),
              Text(
                "We will send you an OTP to verify",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'SFProRegular',
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                style: TextStyle(
                  fontFamily: 'SFProRegular',
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintText: "Enter your 10-digit number",
                  counterText: "",
                  prefixText: "+91 ",
                  prefixStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SFProSemibold',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.orange.shade200),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFFFF6F00), width: 2),
                  ),
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: _continueToOtp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF6F00),
                  minimumSize: Size(double.infinity, 54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Continue",
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
      ),
    );
  }
}
