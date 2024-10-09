import 'package:flutter/material.dart';
import 'package:gemesh/Constants/color_constant.dart';

class RoomCategory extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const RoomCategory({
    super.key,
    required this.icon,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.whiteBackground,
              border: Border.all(
                  color: isSelected ? AppColors.primary : Colors.grey.shade200,
                  width: 5),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppColors.primary,
              size: 24,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
