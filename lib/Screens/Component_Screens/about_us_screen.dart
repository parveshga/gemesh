import 'package:flutter/material.dart';
import 'package:gemesh/Constants/color_constant.dart';
import 'package:gemesh/Widgets/info_container_about_us_widget.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: AppBar(
        backgroundColor: AppColors.whiteBackground,
        surfaceTintColor: AppColors.whiteBackground,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'About Us',
          style: TextStyle(
            color: AppColors.onBoardIndicatior,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //text
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.blue.shade900,
                    Colors.blue.shade500,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: const Text(
                  'Gemesh by Gemicates',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              //
              const Text(
                'Empowering Smart Living',
                style: TextStyle(
                  color: AppColors.onBoardIndicatior,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 30),
              const InfoContainer(
                title: 'Who We Are',
                description:
                    'At Gemicotes, we believe in making everyday life simpler and more efficient. Our passion is in creating innovative IoT solutions that empower homeowners to take control of their living spaces.',
                icon: Icons.people_outline,
              ),
              const SizedBox(height: 16),
              const InfoContainer(
                title: 'Our Vision',
                description:
                    'To lead the future of home automation by providing innovative, reliable, and highly customizable smart home solutions.',
                icon: Icons.visibility_outlined,
              ),
              const SizedBox(height: 16),
              const InfoContainer(
                title: 'Our Mission',
                description:
                    'To innovate and provide user-friendly, secure, and efficient home automation experiences that enhance the quality of life for our customers.',
                icon: Icons.track_changes_outlined,
              ),
              const SizedBox(height: 16),
              const InfoContainer(
                title: 'Our Journey',
                description:
                    'Founded with the vision of making technology accessible and beneficial for everyone, Gemicotes has grown into a trusted name in the IoT industry.',
                icon: Icons.timeline_outlined,
              ),
              const SizedBox(height: 24),
              _buildContactSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Get In Touch',
            style: TextStyle(
              fontSize: 18,
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Got questions? We are here to help!',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.blueBorder,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildContactItem('Email: support@gemicates.com'),
          _buildContactItem('Phone: +1-800-GEM-1234'),
          _buildContactItem('Website: www.gemicates.com'),
        ],
      ),
    );
  }

  Widget _buildContactItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: AppColors.onBoardIndicatior,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
