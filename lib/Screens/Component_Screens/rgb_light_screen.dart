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
  double brightness = 0.52;

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
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
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
                        )),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 110.0),
                        child: Image.asset(
                          'assets/images/light.png',
                          width: 350,
                        ),
                      ),
                    ),

                    // Positioned switch and label
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
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // Light visualization
              if (isOn)
                Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentColor.withOpacity(brightness),
                      boxShadow: [
                        BoxShadow(
                          color: currentColor.withOpacity(brightness * 0.5),
                          blurRadius: 30,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            height: 1,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${(brightness * 100).round()}%',
                                style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Brightness',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              const SizedBox(height: 30),
            ],
          ),

          CustomPaint(
            size: Size(200, (200 * 0.5833333333333334).toDouble()),
            painter: RPSCustomPainter(
              currentColor.withOpacity(brightness),
            ),
          ),

          //choose color
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

// Rest of the ColorSlider class remains the same...
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
  final Color color; // Add a color field

  RPSCustomPainter(this.color); // Constructor to accept color

  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1
    Paint paintFill0 = Paint()
      ..color = color // Use the passed color
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path0 = Path();
    path0.moveTo(size.width * 0.2933333, size.height * 0.2885714);
    path0.lineTo(size.width * 0.5425000, size.height * 0.2857143);
    path0.lineTo(size.width * 0.6508333, size.height * 0.7157143);
    path0.lineTo(size.width * 0.2100000, size.height * 0.7157143);
    path0.lineTo(size.width * 0.1775000, size.height * 0.7142857);
    path0.lineTo(size.width * 0.2933333, size.height * 0.2885714);
    path0.close();

    canvas.drawPath(path0, paintFill0);

    // Layer 1 Stroke (You can modify or remove this part if not needed)
    Paint paintStroke0 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path0, paintStroke0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
