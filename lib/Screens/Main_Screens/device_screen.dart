import 'package:flutter/material.dart';
import 'package:gemesh/Constants/color_constant.dart';
import 'package:gemesh/Screens/Component_Screens/fan_control_screen.dart';
import 'package:gemesh/Screens/Component_Screens/rgb_light_screen.dart';
import 'package:gemesh/Screens/Component_Screens/speaker_screen.dart';
import 'package:gemesh/Widgets/room_category_screen.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar with filter
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search For Devices',
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 15),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: AppColors.onBoardIndicatior,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.1), width: 1),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.blueBorder, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: Colors.black.withOpacity(0.1), width: 1),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.filter_list),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Location Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Room categories
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    RoomCategory(
                      icon: Icons.home,
                      label: 'All',
                      isSelected: true,
                    ),
                    RoomCategory(
                      icon: Icons.weekend,
                      label: 'Living Room',
                    ),
                    RoomCategory(
                      icon: Icons.kitchen,
                      label: 'Kitchen',
                    ),
                    RoomCategory(
                      icon: Icons.bed,
                      label: 'Bed Room',
                    ),
                    RoomCategory(
                      icon: Icons.balcony,
                      label: 'Balcony',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Appliances Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Appliances',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '9 Appliances',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Appliances Grid
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    _buildApplianceCard(
                        icon: Icons.wind_power,
                        title: 'Fan',
                        subtitle: 'Bedroom',
                        status: 'Active',
                        deviceName: 'SRT',
                        isOn: true,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const FanControlScreen()));
                        }),
                    _buildApplianceCard(
                        icon: Icons.lightbulb,
                        title: 'Dimmer Light',
                        subtitle: 'Bedroom',
                        status: 'Inactive',
                        deviceName: 'SRT3',
                        isOn: false,
                        onTap: () {}),
                    _buildApplianceCard(
                        icon: Icons.camera_alt,
                        title: 'Camera',
                        subtitle: 'Living Room',
                        status: 'Inactive',
                        deviceName: 'SRT3',
                        isOn: false,
                        onTap: () {}),
                    _buildApplianceCard(
                        icon: Icons.light,
                        title: 'Light',
                        subtitle: 'Bedroom',
                        status: 'Inactive',
                        deviceName: 'SRT3',
                        isOn: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RgbLightScreen(),
                            ),
                          );
                        }),
                    _buildApplianceCard(
                        icon: Icons.speaker,
                        title: 'Speaker',
                        subtitle: 'Bedroom',
                        status: 'Active',
                        deviceName: 'SRT4',
                        isOn: true,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SpeakerScreen()));
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildApplianceCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String status,
    required String deviceName,
    required bool isOn,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: isOn
              ? const LinearGradient(
                  colors: [
                    AppColors.blueshadeBackground,
                    AppColors.blueBorder,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : LinearGradient(
                  colors: [
                    Colors.grey.shade200,
                    Colors.grey.shade100,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  color: isOn ? Colors.blue[900] : Colors.grey[600],
                ),
                Switch(
                  value: isOn,
                  onChanged: (value) {},
                  activeColor: Colors.blue[900],
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isOn ? Colors.blue[900] : Colors.grey[800],
                      ),
                    ),
                    Text(
                      deviceName,
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    )
                  ],
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                Text(
                  status,
                  style: TextStyle(
                    color: isOn ? Colors.green : Colors.red,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
