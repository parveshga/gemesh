import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemesh/Constants/color_constant.dart';

class LightScreen extends StatefulWidget {
  const LightScreen({super.key});

  @override
  State<LightScreen> createState() => _LightScreenState();
}

class _LightScreenState extends State<LightScreen> {
  bool isOn = true;
  double brightness = 0.22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFCFEFF),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Back button
                      Positioned(
                        top: 70,
                        left: 20,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.onBoardIndicatior,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),

                      // Info button
                      Positioned(
                        top: 75,
                        right: 20,
                        child: IconButton(
                          icon: const Icon(
                            CupertinoIcons.info_circle_fill,
                            color: AppColors.primary,
                          ),
                          onPressed: () {},
                        ),
                      ),

                      // Light image
                      Positioned(
                        top: 50,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Image.asset(
                            'assets/images/light.png',
                            width: double.infinity,
                          ),
                        ),
                      ),

                      // Light effect (CustomPainter)
                      if (isOn)
                        Positioned(
                          top: 365,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: CustomPaint(
                              size: const Size(300, 150),
                              painter: RPSCustomPainter(),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/rectangle_blue.png',
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      top: 0,
                      left: 165,
                      child: Column(
                        children: [
                          const Text(
                            'Light',
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paintFill = Paint()
      ..color = const Color.fromARGB(255, 255, 253, 108).withOpacity(0.7)
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);

    Path path = Path();

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
      ..color = const Color.fromARGB(255, 255, 253, 108).withOpacity(0.7)
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 30);

    final Path glowPath = Path()
      ..addOval(
        Rect.fromCircle(
          center: Offset(size.width * 0.5, size.height * 0.2),
          radius: size.width * 0.15,
        ),
      );

    canvas.drawPath(glowPath, glowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
