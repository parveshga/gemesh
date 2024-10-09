import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemesh/Constants/color_constant.dart';

class SpeakerScreen extends StatefulWidget {
  const SpeakerScreen({super.key});

  @override
  State<SpeakerScreen> createState() => _SpeakerScreenState();
}

class _SpeakerScreenState extends State<SpeakerScreen> {
  @override
  Widget build(BuildContext context) {
    bool isOn = true;
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.onBoardIndicatior,
                    ),
                  ),
                  const Icon(
                    CupertinoIcons.info_circle_fill,
                    color: AppColors.primary,
                    size: 25,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Speaker',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CupertinoSwitch(
                    activeColor: AppColors.primary,
                    value: isOn,
                    onChanged: (value) {
                      setState(() {
                        isOn = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            SizedBox(
              width: double.infinity,
              height: 400,
              child: Stack(
                children: [
                  //text
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.bolt_circle_fill,
                          color: AppColors.primary,
                          size: 40,
                        ),
                        Text(
                          ' 98 %',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: -90,
                    child: SizedBox(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/speaker.png',
                            width: 350,
                          )
                        ],
                      ),
                    ),
                  ),

                  //verticle slid
                  const Positioned(
                    right: 40,
                    child: VerticalVolumeSlider(),
                  )
                ],
              ),
            ),

            ///
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 90,
                  width: 80,
                  decoration: BoxDecoration(
                    color: AppColors.blueBorder,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.wifi,
                        color: AppColors.primary,
                        size: 40,
                      ),
                      Text(
                        'Wifi',
                      )
                    ],
                  ),
                ),

                //
                Container(
                  height: 90,
                  width: 80,
                  decoration: BoxDecoration(
                    color: AppColors.blueBorder,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.mic_off,
                        color: AppColors.primary,
                        size: 40,
                      ),
                      Text(
                        'Mic',
                      )
                    ],
                  ),
                ),

                //
                Container(
                  height: 90,
                  width: 80,
                  decoration: BoxDecoration(
                    color: AppColors.blueBorder,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.alarm,
                        color: AppColors.primary,
                        size: 40,
                      ),
                      Text(
                        'Alarm',
                      )
                    ],
                  ),
                ),

                //
              ],
            )
          ],
        ),
      ),
    );
  }
}

class VerticalVolumeSlider extends StatefulWidget {
  final double initialValue;
  final ValueChanged<double>? onChanged;
  final double height;

  const VerticalVolumeSlider({
    super.key,
    this.initialValue = 70,
    this.onChanged,
    this.height = 300,
  });

  @override
  State<VerticalVolumeSlider> createState() => _VerticalVolumeSliderState();
}

class _VerticalVolumeSliderState extends State<VerticalVolumeSlider> {
  late double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${_value.round()}%',
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: RotatedBox(
              quarterTurns: 3,
              child: SliderTheme(
                data: SliderThemeData(
                  trackHeight: 12,
                  activeTrackColor: Colors.blue[300],
                  inactiveTrackColor: Colors.grey[200],
                  thumbColor: Colors.white,
                  thumbShape:
                      RectangularSliderThumbShape(), // Custom thumb shape
                  overlayColor: Colors.blue.withOpacity(0.2),
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 10),
                ),
                child: Slider(
                  value: _value,
                  min: 0,
                  max: 100,
                  onChanged: (newValue) {
                    setState(() {
                      _value = newValue;
                    });
                    widget.onChanged?.call(newValue);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RectangularSliderThumbShape extends SliderComponentShape {
  final double _width;
  final double _height;

  RectangularSliderThumbShape({
    double width = 16,
    double height = 12,
  })  : _width = width,
        _height = height;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(_width, _height);
  }

  @override
  void paint(
    PaintingContext context,
    Offset thumbCenter, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required Size sizeWithOverflow,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double textScaleFactor,
    required double value,
  }) {
    final Canvas canvas = context.canvas;
    final Paint paint = Paint()
      ..color = sliderTheme.thumbColor ?? Colors.blue
      ..style = PaintingStyle.fill;

    final Rect rect = Rect.fromCenter(
      center: thumbCenter,
      width: _width,
      height: _height,
    );

    canvas.drawRect(rect, paint);
  }
}
