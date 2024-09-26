// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gemesh/Constants/image_constant.dart';
import 'package:gemesh/Screens/Auth_Screens/auth_screen.dart';
import 'package:gemesh/Widgets/Styles/custom_button_style.dart';
import 'package:gemesh/Widgets/Styles/custom_text_style.dart';
import 'package:gemesh/Widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;

  List<Map<String, dynamic>> onboardingData = [
    {
      'imagePath': ImageConstant.imgTrustYourSmart,
      'text': 'Trust Your Smart Home With Us',
    },
    {
      'imagePath': ImageConstant.imgSmartHomeBro1,
      'text': 'Control Your Device From Anywhere',
    },
    {
      'imagePath': ImageConstant.imgSmartHomePana,
      'text': 'Save Your Time And Energy For Things You Love',
    },
    {
      'imagePath': ImageConstant.imgJoinNowBeAPart,
      'text': 'Join Now And Be A Part Of Our Family',
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 37.0, vertical: 20.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    _completeOnboarding();
                  },
                  child:
                      Text("Skip", style: CustomTextStyles.bodySmallBlack900),
                ),
              ),
              const Spacer(flex: 43),
              SvgPicture.asset(
                onboardingData[currentIndex]['imagePath'],
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fitHeight,
                semanticsLabel: 'Acme Logo',
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                width: 266.0,
                child: Text(
                  onboardingData[currentIndex]['text'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 22.0),
              CustomElevatedButton(
                height: 40.0,
                width: 150.0,
                text: currentIndex == onboardingData.length - 1
                    ? "Continue"
                    : "Next",
                buttonStyle: CustomButtonStyles.fillPrimaryTL4,
                buttonTextStyle: CustomTextStyles.titleSmallWhiteA700,
                onPressed: onTapNext,
              ),
              const Spacer(flex: 56),
              SizedBox(
                height: 4.0,
                child: AnimatedSmoothIndicator(
                  activeIndex: currentIndex,
                  count: onboardingData.length,
                  effect: const ExpandingDotsEffect(
                    spacing: 4,
                    activeDotColor: Colors.blue,
                    dotColor: Colors.grey,
                    dotHeight: 4.0,
                    dotWidth: 4.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTapNext() {
    setState(() {
      if (currentIndex < onboardingData.length - 1) {
        currentIndex++;
      } else {
        _completeOnboarding();
      }
    });
  }

  Future<void> _completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'hasSeenOnboarding', true); // Save that onboarding was completed

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AuthScreen()),
    );
  }
}
