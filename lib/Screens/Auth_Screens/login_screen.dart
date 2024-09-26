import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gemesh/Constants/image_constant.dart';
import 'package:gemesh/Screens/Auth_Screens/Register_Screen/register_screen.dart';
import 'package:gemesh/Widgets/Styles/custom_text_style.dart';
import 'package:gemesh/Widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscured = true;

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
              const SizedBox(height: 20),
              _buildEmailAndPasswordFields(),
              const SizedBox(height: 20),
              Center(
                child: FadeInUp(
                  duration: const Duration(milliseconds: 1500),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade800,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Text('Login',
                            style: CustomTextStyles.labelLargeWhiteA700Bold),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildOrLoginWith(),
              const SizedBox(height: 30),
              _buildSocialButtons(),
              const SizedBox(height: 30),
              _buildRegisterLink(),
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
          'LogIn Now',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildEmailAndPasswordFields() {
    return FadeInUp(
      duration: const Duration(milliseconds: 1400),
      child: Column(
        children: [
          emailTextField(),
          const SizedBox(height: 10),
          passwordTextField(),
          const SizedBox(height: 10),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Forget Password?',
              style: TextStyle(color: Colors.blue, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrLoginWith() {
    return FadeInUp(
      duration: const Duration(milliseconds: 1600),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: Divider()),
          Text("Or Login With", style: TextStyle(color: Colors.grey)),
          Expanded(child: Divider()),
        ],
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSocialButton(ImageConstant.imgApple, "Apple", Colors.black),
        _buildSocialButton(ImageConstant.imgGoogle, "Google", Colors.white,
            isOutlined: true),
      ],
    );
  }

  Widget _buildSocialButton(String imagePath, String label, Color color,
      {bool isOutlined = false}) {
    return FadeInUp(
      duration: const Duration(milliseconds: 1700),
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue.shade800),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                imagePath,
              ),
              const SizedBox(width: 15),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterLink() {
    return FadeInUp(
      duration: const Duration(milliseconds: 1800),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Don't have an account? ",
              style: TextStyle(color: Colors.black)),
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegisterScreen())),
            child: Text(
              '  Register Now',
              style: TextStyle(
                  color: Colors.blue.shade800, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
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

  Widget passwordTextField() {
    return CustomTextFormField(
      labelText: 'Password',
      prefix: const Icon(CupertinoIcons.lock_fill),
      suffix: GestureDetector(
        onTap: _togglePasswordVisibility,
        child: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
      ),
      obscureText: _isObscured,
      autofocus: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }
}
