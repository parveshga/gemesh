import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemesh/Screens/Auth_Screens/OTP_Screen/otp_verification_screen.dart';
import 'package:gemesh/Widgets/Styles/custom_text_style.dart';
import 'package:gemesh/Widgets/custom_text_form_field.dart';

class NumberAuthScreen extends StatefulWidget {
  const NumberAuthScreen({super.key});

  @override
  State<NumberAuthScreen> createState() => _NumberAuthScreenState();
}

class _NumberAuthScreenState extends State<NumberAuthScreen>
    with TickerProviderStateMixin {
  late AnimationController firstAniCon;
  late Animation firstAni;

  @override
  void initState() {
    firstAniCon = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(milliseconds: 500),
    );
    firstAni = Tween<double>(begin: 0.741, end: 0).animate(
      CurvedAnimation(
        parent: firstAniCon,
        curve: Curves.easeOutCubic,
        reverseCurve: Curves.easeInCubic,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    firstAniCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 30),
              FadeInUp(
                duration: const Duration(milliseconds: 1700),
                child: Center(
                  child: Icon(
                    CupertinoIcons.bubble_left_bubble_right_fill,
                    color: Colors.blue.shade800,
                    size: 100,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              _buildNumberFields(),
              const SizedBox(height: 30),
              FadeInUp(
                duration: const Duration(milliseconds: 1600),
                child: const Text(
                  'We will send you and One-Time-Password(OTP)',
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 50),
              Center(
                child: FadeInUp(
                  duration: const Duration(milliseconds: 1500),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                        isDismissible: false,
                        backgroundColor: Colors.white,
                        transitionAnimationController: firstAniCon,
                        context: context,
                        builder: (BuildContext context) => StatefulBuilder(
                          builder: (context, setState) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(35),
                                  topRight: Radius.circular(35),
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color.fromARGB(255, 207, 207, 207),
                                  ),
                                ],
                              ),
                              child: const OTPScreen(),
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade800,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Text('Continue',
                            style: CustomTextStyles.labelLargeWhiteA700Bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return FadeInUp(
      duration: const Duration(milliseconds: 1300),
      child: const Center(
        child: Text(
          'OTP Verification',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildNumberFields() {
    return FadeInUp(
      duration: const Duration(milliseconds: 1400),
      child: Column(
        children: [
          emailTextField(),
        ],
      ),
    );
  }

  Widget emailTextField() {
    return CustomTextFormField(
      labelText: 'Enter Your Phone Number',
      prefix: const Icon(CupertinoIcons.device_phone_portrait),
      autofocus: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }
}
