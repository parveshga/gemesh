import 'package:flutter/material.dart';
import 'package:gemesh/Constants/color_constant.dart';

class InfoContainer extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const InfoContainer({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 32, bottom: 10),
          padding: const EdgeInsets.only(
            top: 52,
            bottom: 20,
            left: 20,
            right: 20,
          ),
          decoration: BoxDecoration(
            color: AppColors.buttonBackground,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              // Title
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              // Description
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        // Elevated icon container
        Positioned(
          top: -15,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors.blueshadeBackground,
                ),
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                icon,
                color: Colors.blue,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
