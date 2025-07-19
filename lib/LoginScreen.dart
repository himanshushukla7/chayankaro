import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(() {
      setState(() {
        _isButtonEnabled = _phoneController.text.length == 10;
      });
    });
  }

  void _continueToOtp() {
    Navigator.pushNamed(context, '/otp', arguments: _phoneController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset("assets/logo.jpg", height: 120)),
              SizedBox(height: 40),
              Center(
                child: Text(
                  "Enter Mobile Number",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'SFProBold',
                    color: Color(0xFFB94D05),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Center(
                child: Text(
                  "We will send you an OTP to verify",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'SFProRegular',
                    color: Colors.black87,
                  ),
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
                  counterText: "",
                  hintText: "Enter your 10-digit number",
                  prefixIcon: Container(
                    padding: EdgeInsets.only(left: 12, right: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "+91",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'SFProSemibold',
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          width: 1,
                          height: 28,
                          color: Color(0xFF79747E),
                        ),
                      ],
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFF79747E)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFFFF6F00), width: 2),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "An OTP will be sent on given phone number for verification.\nStandard message and data rates apply.",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Inter',
                  height: 1.5,
                  color: Color(0xFF757575),
                ),
              ),
              SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _isButtonEnabled ? _continueToOtp : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isButtonEnabled
                        ? Color(0xFFFF6F00)
                        : Color(0xFFE6EAFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "Get Verification OTP",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'SFProSemibold',
                      color:
                          _isButtonEnabled ? Colors.white : Color(0xFF757575),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Center(
                child: Text(
                  "By Continuing, You agree to our T&C and Privacy Policy",
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'SFProRegular',
                    color: Colors.black.withOpacity(0.8),
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
