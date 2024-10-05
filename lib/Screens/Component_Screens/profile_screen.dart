import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemesh/Constants/color_constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: AppBar(
        backgroundColor: AppColors.whiteBackground,
        surfaceTintColor: AppColors.whiteBackground,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Profile Settings',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Profile Image
              Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        backgroundImage:
                            NetworkImage('https://via.placeholder.com/100'),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 130,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.qr_code,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Profile Information Fields
              _buildProfileField(
                'Name',
                'Parvesh',
                Icons.person_outline,
                trailing: const Icon(Icons.edit, size: 20),
              ),
              _buildProfileField(
                'Email',
                'parvesg@gemicates.in',
                Icons.email_outlined,
                trailing: const Icon(Icons.verified, color: Colors.green),
              ),
              _buildProfileField(
                'Phone',
                '9876543210',
                Icons.phone_outlined,
                trailing: const Icon(
                  Icons.verified,
                  color: Colors.green,
                ),
              ),

              // Switch Users Section
              const SizedBox(height: 10),
              const Text(
                'Switch Users',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              _buildSwitchUsers(),
              const SizedBox(height: 20),
              Divider(
                color: Colors.grey.shade300,
              ),

              // Subscription Plan Card
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Your Plan',
                  style: TextStyle(
                    color: AppColors.onBoardIndicatior,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              _buildPlanCard(),

              //change Plan
              Center(
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Change Plan',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, String value, IconData icon,
      {Widget? trailing}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.secondaryColor),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  Widget _buildSwitchUsers() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          4,
          (index) => Container(
            margin: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey.shade200,
              backgroundImage:
                  const NetworkImage('https://via.placeholder.com/48'),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlanCard() {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.buttonBackground,
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Basic Plan - 2BHK',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '₹ 729 / Year ',
                    style: TextStyle(
                      color: AppColors.onBoardIndicatior,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Valid till 22nd of December 2024',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              Icon(
                CupertinoIcons.info_circle_fill,
                color: AppColors.primary,
                size: 30,
              )
            ],
          ),
        ));
  }
}
