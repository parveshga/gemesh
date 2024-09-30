import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gemesh/Constants/image_constant.dart';
import 'package:gemesh/Screens/Auth_Screens/OTP_Screen/number_auth_screen.dart';
import 'package:gemesh/Screens/Auth_Screens/Register_Screen/register_screen.dart';
import 'package:gemesh/Screens/Auth_Screens/login_screen.dart';
import 'package:gemesh/Services/google_auth_service.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
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
    final googleSignInService = Provider.of<GoogleSignInService>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.blue.shade900,
          Colors.blue.shade400,
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
                      FadeInUp(
                          duration: const Duration(milliseconds: 1300),
                          child: const Text(
                            'LogIn Now',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      const SizedBox(
                        height: 50,
                      ),
                      FadeInUp(
                          duration: const Duration(milliseconds: 1400),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    transitionAnimationController: firstAniCon,
                                    context: context,
                                    builder: (BuildContext context) =>
                                        StatefulBuilder(
                                      builder: (context, setState) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(35),
                                              topRight: Radius.circular(35),
                                            ),
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color.fromARGB(
                                                    255, 207, 207, 207),
                                              ),
                                            ],
                                          ),
                                          child: const NumberAuthScreen(),
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                    width: 300,
                                    height: 60,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade800,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            CupertinoIcons
                                                .device_phone_portrait,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            'Continue with Mobile Number',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                              const SizedBox(
                                height: 10,
                              ),

                              //email
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    transitionAnimationController: firstAniCon,
                                    context: context,
                                    builder: (BuildContext context) =>
                                        StatefulBuilder(
                                      builder: (context, setState) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(35),
                                              topRight: Radius.circular(35),
                                            ),
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color.fromARGB(
                                                    255, 207, 207, 207),
                                              ),
                                            ],
                                          ),
                                          child: const LoginScreen(),
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                    width: 300,
                                    height: 60,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.blue.shade800),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            CupertinoIcons
                                                .device_phone_portrait,
                                            color: Colors.black,
                                          ),
                                          Text(
                                            'Continue with E-Mail',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 70,
                      ),
                      FadeInUp(
                          duration: const Duration(milliseconds: 1500),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(child: Divider()),
                              Text(
                                "Or Login With",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Expanded(child: Divider()),
                            ],
                          )),
                      const SizedBox(
                        height: 40,
                      ),

                      //google apples signin
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FadeInUp(
                              duration: const Duration(milliseconds: 1600),
                              child: Container(
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                  // border:
                                  //     Border.all(color: Colors.blue.shade800),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        ImageConstant.imgApple,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      const Text(
                                        "Apple",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          FadeInUp(
                              duration: const Duration(milliseconds: 1600),
                              child: GestureDetector(
                                onTap: () async {
                                  await googleSignInService.signInWithGoogle();
                                },
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.blue.shade800)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            ImageConstant.imgGoogle),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        const Text(
                                          "Google",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1700),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                fontFamily: 'SfPro',
                                color: Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen(),
                                    ));
                              },
                              child: Text(
                                '  Register Now',
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
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
