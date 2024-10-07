import 'package:flutter/material.dart';
import 'package:gemesh/Constants/color_constant.dart';

class ContactUsScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: AppBar(
        backgroundColor: AppColors.whiteBackground,
        surfaceTintColor: AppColors.whiteBackground,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Contact Us'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Help Center',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 24),
              CustomTextField(
                label: 'Name',
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter your name' : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'Please enter your email';
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value!)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Mobile Number',
                keyboardType: TextInputType.phone,
                validator: (value) => value?.isEmpty ?? true
                    ? 'Please enter your mobile number'
                    : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Message',
                maxLines: 5,
                hintText: 'Leave your message here...',
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter your message' : null,
              ),
              const SizedBox(height: 40),
              Center(
                child: Container(
                  height: 60,
                  width: 130,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.whiteBackground,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: AppColors.primary,
                      width: 3,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: AppColors.onBoardIndicatior,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              // Center(
              //   child: ElevatedButton(
              //     onPressed: () {
              //       if (_formKey.currentState?.validate() ?? false) {
              //         // Handle form submission
              //       }
              //     },
              //     style: ElevatedButton.styleFrom(
              //       minimumSize: const Size(150, 45),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(25),
              //       ),
              //     ),
              //     child: const Text('Submit'),
              //   ),
              // ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(
                    icon: Icons.facebook,
                    onTap: () {},
                  ),
                  SocialButton(
                    icon: Icons.wechat_sharp,
                    onTap: () {},
                  ),
                  SocialButton(
                    icon: Icons.web,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final int maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.label,
    this.hintText,
    this.maxLines = 1,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
      ),
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const SocialButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(25),
        child: Icon(
          icon,
          size: 24,
        ),
      ),
    );
  }
}
