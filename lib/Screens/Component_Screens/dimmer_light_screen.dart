import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemesh/Constants/color_constant.dart';

class DimmerLightScreen extends StatefulWidget {
  const DimmerLightScreen({super.key});

  @override
  State<DimmerLightScreen> createState() => _DimmerLightScreenState();
}

class _DimmerLightScreenState extends State<DimmerLightScreen> {
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
                      top: -30,
                      right: -15,
                      child: Image.asset(
                        'assets/images/dimmer.png',
                        width: 250,
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
                            'Dimmer Light',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '70%',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 45,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Brightness',
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
