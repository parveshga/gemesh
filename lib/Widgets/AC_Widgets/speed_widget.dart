import 'package:flutter/material.dart';
import 'package:gemesh/Widgets/AC_Widgets/transparent_card.dart';

class SpeedWidget extends StatelessWidget {
  final int speed;
  final Function(int) changeSpeed;

  const SpeedWidget({Key? key, required this.speed, required this.changeSpeed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TransparentCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Speed",
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbColor: Colors.white,
              activeTrackColor: Colors.white,
              inactiveTrackColor: Colors.white.withOpacity(0.4),
              overlayColor: Colors.white.withOpacity(0.2),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
              trackHeight: 2.0,
            ),
            child: Slider(
              value: speed.toDouble(),
              min: 1,
              max: 3,
              divisions: 2,
              onChanged: (value) {
                changeSpeed(value.toInt());
              },
            ),
          ),
        ],
      ),
    );
  }
}
