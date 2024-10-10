import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemesh/Constants/color_constant.dart';
import 'package:gemesh/Screens/Component_Screens/ac_conditioner_screen.dart';
import 'package:gemesh/Screens/Component_Screens/dimmer_light_screen.dart';
import 'package:gemesh/Screens/Component_Screens/fan_control_screen.dart';
import 'package:gemesh/Screens/Component_Screens/light_screen.dart';
import 'package:gemesh/Screens/Component_Screens/location_viewall_screen.dart';
import 'package:gemesh/Screens/Component_Screens/rgb_light_screen.dart';
import 'package:gemesh/Screens/Component_Screens/speaker_screen.dart';
import 'package:gemesh/Widgets/room_category_screen.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({super.key});

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  final Map<String, bool> _deviceStates = {
    'Fan': true,
    'Dimmer Light': false,
    'AC': false,
    'RGB Light': true,
    'Light': true,
    'Speaker': true,
  };

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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LocationListScreen(),
                        ),
                      );
                    },
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
                        deviceName: 'SRT',
                        isOn: _deviceStates['Fan']!,
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
                        deviceName: 'SRT3',
                        isOn: _deviceStates['Dimmer Light']!,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DimmerLightScreen(),
                            ),
                          );
                        }),
                    _buildApplianceCard(
                        icon: Icons.ac_unit,
                        title: 'AC',
                        subtitle: 'Living Room',
                        deviceName: 'SRT3',
                        isOn: _deviceStates['AC']!,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AcConditionerScreen(
                                tag: 'AC',
                              ),
                            ),
                          );
                        }),
                    _buildApplianceCard(
                        icon: Icons.light,
                        title: 'RGB Light',
                        subtitle: 'Bedroom',
                        deviceName: 'SRT3',
                        isOn: _deviceStates['RGB Light']!,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RgbLightScreen(),
                            ),
                          );
                        }),
                    _buildApplianceCard(
                        icon: Icons.light,
                        title: 'Light',
                        subtitle: 'Bedroom',
                        deviceName: 'SRT3',
                        isOn: _deviceStates['Light']!,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LightScreen(),
                            ),
                          );
                        }),
                    _buildApplianceCard(
                      icon: Icons.speaker,
                      title: 'Speaker',
                      subtitle: 'Bedroom',
                      deviceName: 'SRT4',
                      isOn: _deviceStates['Speaker']!,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SpeakerScreen()));
                      },
                    ),
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
                CupertinoSwitch(
                  value: isOn,
                  onChanged: (value) {
                    setState(() {
                      _deviceStates[title] = value;
                    });
                  },
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
                        fontSize: 10,
                        color: isOn ? Colors.blue[900] : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: isOn ? Colors.blue[900] : Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  isOn ? 'Active' : 'Inactive',
                  style: TextStyle(
                    fontSize: 10,
                    color: isOn ? Colors.green : Colors.redAccent,
                    fontWeight: FontWeight.bold,
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
