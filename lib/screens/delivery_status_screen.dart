import 'package:flutter/material.dart';

class DeliveryStatusScreen extends StatelessWidget {
  const DeliveryStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header Bar
            Container(
              color: const Color(0xFFFFA451),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.arrow_back_ios, size: 14, color: Colors.black),
                          SizedBox(width: 4),
                          Text(
                            'Go back',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'Delivery Status',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Order Status Steps List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                children: [
                  _buildStatusItem(
                    imagePath: 'assets/images/order_taken.png',
                    title: 'Order Taken',
                    status: 'Completed',
                    isCompleted: true,
                    showLine: true,
                  ),
                  _buildStatusItem(
                    imagePath: 'assets/images/order_prepared.png',
                    title: 'Order Is Being Prepared',
                    status: 'In Progress',
                    isCompleted: true,
                    showLine: true,
                  ),
                  _buildStatusItem(
                    imagePath: 'assets/images/delivery_bike.png',
                    title: 'Order Is Being Delivered',
                    status: 'Your delivery agent is coming',
                    isCompleted: false,
                    showLine: true,
                    hasPhoneIcon: true,
                  ),
                  _buildMapSection(),
                  _buildStatusItem(
                    imagePath: 'assets/images/small_check.png',
                    title: 'Order Received',
                    status: 'Pending',
                    isCompleted: false,
                    showLine: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildStatusItem({
    required String imagePath,
    required String title,
    required String status,
    required bool isCompleted,
    required bool showLine,
    bool hasPhoneIcon = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFAEB),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                imagePath,
                errorBuilder: (c, e, s) => Icon(
                  isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                  color: const Color(0xFFFFA451),
                ),
              ),
            ),
            if (showLine)
              Container(
                width: 2,
                height: 40,
                color: const Color(0xFFFFA451).withOpacity(0.3),
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF27214D),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                status,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
        if (isCompleted)
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Icon(Icons.check_circle, color: Color(0xFF4CD964), size: 24),
          )
        else if (hasPhoneIcon)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Color(0xFFFFA451),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.phone, color: Colors.white, size: 20),
            ),
          ),
      ],
    );
  }

  static Widget _buildMapSection() {
    return Container(
      margin: const EdgeInsets.only(left: 66, bottom: 20),
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage('assets/images/map_view.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}