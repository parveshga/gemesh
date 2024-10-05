import 'package:flutter/material.dart';
import 'package:gemesh/Constants/color_constant.dart';

class DeviceConfigurationScreen extends StatefulWidget {
  const DeviceConfigurationScreen({super.key});

  @override
  State<DeviceConfigurationScreen> createState() =>
      _DeviceConfigurationScreenState();
}

class _DeviceConfigurationScreenState extends State<DeviceConfigurationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueshadeBackground,
      appBar: AppBar(
        backgroundColor: AppColors.blueshadeBackground,
        surfaceTintColor: AppColors.blueshadeBackground,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'DEVICE CONFIGURATION',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          // Tab buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                _buildTabButton('WIFI DEVICES', _tabController.index == 0, 0),
                const SizedBox(width: 16),
                _buildTabButton('HAGWAY DEVICES', _tabController.index == 1, 1),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          // Swipeable content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // WiFi Devices Tab
                ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    _buildDeviceCard('SRT', '2 Appliances'),
                    _buildDeviceCard('SRF', '4 Appliances'),
                    _buildDeviceCard('SRE1', '8 Appliances'),
                    _buildDeviceCard('SRE2', '6 Appliances'),
                    _buildDeviceCard('SRE3', '6 Appliances'),
                  ],
                ),
                // Hagway Devices Tab
                ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    _buildDeviceCard('HAG1', '3 Appliances'),
                    _buildDeviceCard('HAG2', '5 Appliances'),
                    _buildDeviceCard('HAG3', '2 Appliances'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String text, bool isSelected, int index) {
    return InkWell(
      onTap: () {
        _tabController.animateTo(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          if (isSelected)
            Container(
              height: 2,
              width: 100,
              color: Colors.black,
            ),
        ],
      ),
    );
  }

  Widget _buildDeviceCard(String name, String applianceCount) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.whiteBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.blueBorder,
          )),
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(Icons.wifi, color: Colors.blue.shade600),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Active',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.green.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              applianceCount,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
