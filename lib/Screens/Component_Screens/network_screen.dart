import 'package:flutter/material.dart';
import 'package:gemesh/Constants/color_constant.dart';
import 'package:gemesh/Widgets/Styles/custom_text_style.dart';

class NetworkScreen extends StatelessWidget {
  const NetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: AppBar(
        backgroundColor: AppColors.whiteBackground,
        surfaceTintColor: AppColors.whiteBackground,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Networks',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Admin Network Card
            Container(
              decoration: BoxDecoration(
                color: AppColors.whiteBackground,
                border: Border.all(
                  color: AppColors.blueBorder,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: const Icon(Icons.person),
                ),
                title: const Text('Network ABC'),
                subtitle: const Text('Admin'),
              ),
            ),
            const SizedBox(height: 24),
            // Available Networks Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available Networks',
                  style: CustomTextStyles.bodySmallBlack900,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Refresh',
                    style: CustomTextStyles.bodySmallBlack90012,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _buildNetworkTile('Network A', 'Guest User'),
            const SizedBox(height: 10),
            _buildNetworkTile('Network B', 'Guest User'),
            const SizedBox(height: 10),
            _buildNetworkTile('Network C', 'Remote User'),
            const SizedBox(height: 10),
            _buildNetworkTile('Network D', 'Remote User'),
            const Spacer(),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Scan to Switch Network',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColors.primary,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNetworkTile(String name, String userType) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteBackground,
        border: Border.all(
          color: AppColors.blueBorder,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: const Icon(Icons.router),
        title: Text(name),
        subtitle: Text(userType),
        onTap: () {},
      ),
    );
  }
}

class QRCodePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF005F8C)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    // Draw corner markers
    final cornerSize = size.width * 0.2;

    // Top-left corner
    canvas.drawPath(
      Path()
        ..moveTo(0, cornerSize)
        ..lineTo(0, 0)
        ..lineTo(cornerSize, 0),
      paint,
    );

    // Top-right corner
    canvas.drawPath(
      Path()
        ..moveTo(size.width - cornerSize, 0)
        ..lineTo(size.width, 0)
        ..lineTo(size.width, cornerSize),
      paint,
    );

    // Bottom-left corner
    canvas.drawPath(
      Path()
        ..moveTo(0, size.height - cornerSize)
        ..lineTo(0, size.height)
        ..lineTo(cornerSize, size.height),
      paint,
    );

    // Bottom-right corner
    canvas.drawPath(
      Path()
        ..moveTo(size.width - cornerSize, size.height)
        ..lineTo(size.width, size.height)
        ..lineTo(size.width, size.height - cornerSize),
      paint,
    );

    // Center line
    canvas.drawLine(
      Offset(size.width * 0.3, size.height * 0.5),
      Offset(size.width * 0.7, size.height * 0.5),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
