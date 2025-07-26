import 'package:flutter/material.dart';
import '../../widgets/chayan_header.dart'; // update this import path based on your file structure

class ManageAddressScreen extends StatelessWidget {
  const ManageAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Custom reusable header
          ChayanHeader(
            title: 'Manage Address',
            onBack: () => Navigator.pop(context), onBackTap: () {  },
          ),

          // Main content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Add Another Address
                  GestureDetector(
                    onTap: () {
                      // TODO: Add functionality
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.add, color: Color(0xFFE47830), size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Add another address',
                          style: TextStyle(
                            color: Color(0xFFE47830),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Address Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Color(0xFFEBEBEB)),
                        bottom: BorderSide(color: Color(0xFFEBEBEB)),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.home_filled, size: 20, color: Colors.black),
                            const SizedBox(width: 8),
                            const Text(
                              'Home',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Inter',
                              ),
                            ),
                            const Spacer(),
                            Icon(Icons.more_vert, size: 20, color: Colors.grey.shade700),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Plot no.209, Kavuri Hills, Madhapur, Telangana 500033\nPh: +91234567890',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Inter',
                            height: 1.5,
                            color: Color(0xFF757575),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
