import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemesh/Constants/color_constant.dart';

class RgbLightScreen extends StatefulWidget {
  const RgbLightScreen({super.key});

  @override
  State<RgbLightScreen> createState() => _RgbLightScreenState();
}

class _RgbLightScreenState extends State<RgbLightScreen> {
  bool isOn = true;
  Color currentColor = Colors.red;
  double brightness = 0.22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFCFEFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Back button
                    Positioned(
                      top: 70,
                      left: 20,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.onBoardIndicatior,
                        ),
                      ),
                    ),

                    Positioned(
                      top: 75,
                      right: 20,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          CupertinoIcons.info_circle_fill,
                          color: AppColors.primary,
                        ),
                      ),
                    ),

                    // Light image
                    Positioned(
                      top: 15,
                      right: -82,
                      child: Image.asset(
                        'assets/images/light.png',
                        width: 400,
                      ),
                    ),

                    // RGB Light label and switch
                    Positioned(
                      top: 150,
                      left: 25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'RGB Light',
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

                    // Light effect (CustomPainter)
                    if (isOn)
                      Expanded(
                        child: Positioned(
                          top: 340,
                          left: 0,
                          right: -160,
                          child: Center(
                            child: CustomPaint(
                              size: const Size(350, 155),
                              painter: RPSCustomPainter(
                                currentColor.withOpacity(brightness),
                                brightness,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),

          // Color chooser
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Choose Color',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0066A2),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: ColorSlider(
                    onColorChanged: (Color color) {
                      setState(() {
                        currentColor = color;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ColorSlider extends StatefulWidget {
  final Function(Color) onColorChanged;

  const ColorSlider({
    super.key,
    required this.onColorChanged,
  });

  @override
  State<ColorSlider> createState() => _ColorSliderState();
}

class _ColorSliderState extends State<ColorSlider> {
  double _position = 0.0;
  late Color _currentColor;
  final double _sliderHeight = 30.0;
  bool _isDragging = false;

  final List<Color> _colors = const [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.cyan,
    Colors.blue,
    Colors.purple,
    Colors.red,
  ];

  @override
  void initState() {
    super.initState();
    _currentColor = _colors.first;
  }

  Color _calculateSelectedColor(double position, double maxWidth) {
    final double colorPercent = position / maxWidth;
    final int index = (colorPercent * (_colors.length - 1)).floor();
    final double remainder = ((colorPercent * (_colors.length - 1)) - index);

    if (index < _colors.length - 1) {
      return Color.lerp(
            _colors[index],
            _colors[index + 1],
            remainder,
          ) ??
          Colors.white;
    }
    return _colors.last;
  }

  void _handleColorChange(double position, BoxConstraints constraints) {
    final newColor = _calculateSelectedColor(position, constraints.maxWidth);
    if (newColor != _currentColor) {
      setState(() {
        _currentColor = newColor;
      });
      widget.onColorChanged(_currentColor);
    }
  }

  void _updatePosition(Offset localPosition, BoxConstraints constraints) {
    final double halfThumbWidth = _sliderHeight / 2;
    double newPosition = localPosition.dx
        .clamp(halfThumbWidth, constraints.maxWidth - halfThumbWidth);

    setState(() {
      _position = newPosition - halfThumbWidth;
    });

    _handleColorChange(_position, constraints);
  }

  Widget _buildThumb() {
    return Container(
      width: 30,
      height: _sliderHeight,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(_isDragging ? 0.3 : 0.2),
            blurRadius: _isDragging ? 8 : 4,
            spreadRadius: _isDragging ? 1 : 0,
            offset: Offset(0, _isDragging ? 4 : 2),
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: _sliderHeight * 0.6,
          height: _sliderHeight * 0.6,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentColor,
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Container(
                  height: _sliderHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(_sliderHeight / 2),
                    gradient: LinearGradient(colors: _colors),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  child: GestureDetector(
                    onPanStart: (details) {
                      setState(() => _isDragging = true);
                      _updatePosition(details.localPosition, constraints);
                    },
                    onPanUpdate: (details) {
                      _updatePosition(details.localPosition, constraints);
                    },
                    onPanEnd: (details) {
                      setState(() => _isDragging = false);
                    },
                    onTapDown: (details) {
                      _updatePosition(details.localPosition, constraints);
                    },
                  ),
                ),
                Positioned(
                  left: _position,
                  child: AnimatedScale(
                    scale: _isDragging ? 1.1 : 1.0,
                    duration: const Duration(milliseconds: 150),
                    child: _buildThumb(),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  final Color color;
  final double brightness;

  RPSCustomPainter(this.color, this.brightness);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paintFill = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 20 * brightness);

    Path path = Path();

    // Starting point at the left edge of the arc
    path.moveTo(size.width * 0.3, size.height * 0.2);

    path.addArc(
      Rect.fromCircle(
        center: Offset(size.width * 0.5, size.height * 0.2),
        radius: size.width * 0.2,
      ),
      pi,
      pi,
    );

    path.lineTo(size.width * 0.8, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.close();

    canvas.drawPath(path, paintFill);

    final Paint glowPaint = Paint()
      ..color = color.withOpacity(brightness * 0.1)
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 30 * brightness);

    final Path glowPath = Path()
      ..addOval(
        Rect.fromCircle(
          center: Offset(size.width * 0.5, size.height * 0.2),
          radius: size.width * 0.15,
        ),
      );

    canvas.drawPath(glowPath, glowPaint);

    // Brightness text
    final textPainter = TextPainter(
      text: TextSpan(
        text: '${(brightness * 100).round()}%',
        style: TextStyle(
          color: Colors.black.withOpacity(0.7),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        (size.width - textPainter.width) / 2,
        size.height * 0.4,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
