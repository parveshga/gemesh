import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gemesh/Screens/Auth_Screens/Register_Screen/register_screen_password.dart';
import 'package:gemesh/Widgets/Styles/custom_text_style.dart';
import 'package:gemesh/Widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
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
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.blue.shade900,
          Colors.blue.shade800,
          Colors.blue.shade400
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      child: const Text(
                        "Let's Upgrade Your Future Smarter",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  FadeInUp(
                      duration: const Duration(milliseconds: 1300),
                      child: const Text(
                        "Upgrade with smart automation and convenience",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        //title
                        _buildHeader(),
                        const SizedBox(
                          height: 30,
                        ),
                        _buildCustomdFields(),
                        const SizedBox(
                          height: 50,
                        ),
                        //Login now
                        FadeInUp(
                          duration: const Duration(milliseconds: 1700),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "You have and Account?",
                                style: TextStyle(
                                  fontFamily: 'SfPro',
                                  color: Colors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  ' LogIn Now',
                                  style: TextStyle(
                                    fontFamily: 'SfPro',
                                    color: Colors.blue.shade800,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return FadeInUp(
      duration: const Duration(milliseconds: 1300),
      child: const Center(
        child: Text(
          'Register Now',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildCustomdFields() {
    return FadeInUp(
      duration: const Duration(milliseconds: 1400),
      child: Column(
        children: [
          nameTextField(),
          const SizedBox(height: 20),
          emailTextField(),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterScreenPassword()));
            },
            child: Container(
              height: 50,
              width: 130,
              decoration: BoxDecoration(
                color: Colors.blue.shade900,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: Text(
                  'Continue',
                  style: CustomTextStyles.labelLargeWhiteA700Bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget nameTextField() {
    return CustomTextFormField(
      labelText: 'Name',
      prefix: const Icon(Icons.person),
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

  Widget emailTextField() {
    return CustomTextFormField(
      labelText: 'Email',
      prefix: const Icon(Icons.email),
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
