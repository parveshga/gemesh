import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemesh/Constants/color_constant.dart';
import 'package:gemesh/Widgets/room_category_screen.dart';
import 'package:gemesh/Widgets/wifi_device_card_widget.dart';

class WifiDevicesScreen extends StatelessWidget {
  const WifiDevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: AppBar(
        backgroundColor: AppColors.whiteBackground,
        surfaceTintColor: AppColors.whiteBackground,
        elevation: 0,
        leading: const BackButton(color: AppColors.onBoardIndicatior),
        title: const Text(
          'Wifi Devices',
          style: TextStyle(
            color: AppColors.onBoardIndicatior,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              right: 10,
            ),
            child: Icon(CupertinoIcons.add,
                size: 25, color: AppColors.onBoardIndicatior),
          )
        ],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
                          borderSide: const BorderSide(
                              color: AppColors.blueBorder, width: 1),
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
                      border: Border.all(color: AppColors.blueBorder),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.filter_list),
                      onPressed: () {},
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
              const SizedBox(height: 16),

              // Devices list
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return DeviceCard(
                      deviceName: 'Device Name',
                      location: 'Room 1',
                      isActive: index != 2,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
