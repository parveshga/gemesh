import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemesh/Constants/color_constant.dart';

class FanControlScreen extends StatelessWidget {
  const FanControlScreen({super.key});

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
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Fan image at the top center
                  Image.asset(
                    'assets/images/fan.png',
                    width: double.infinity,
                  ),
                  Positioned(
                    top: 100,
                    left: 25,
                    child: Column(
                      children: [
                        const Text(
                          'Fan ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        CupertinoSwitch(
                          activeColor: AppColors.primary,
                          value: isOn,
                          onChanged: (value) {},
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //speed
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '3',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Speed',
                    style: TextStyle(
                      color: AppColors.onBoardIndicatior,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            //
          ],
        ),
      ),
    );
  }
}
