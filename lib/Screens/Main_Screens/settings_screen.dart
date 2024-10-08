import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemesh/Constants/color_constant.dart';
import 'package:gemesh/Constants/image_constant.dart';
import 'package:gemesh/Screens/Component_Screens/about_us_screen.dart';
import 'package:gemesh/Screens/Component_Screens/contact_us_screen.dart';
import 'package:gemesh/Screens/Component_Screens/device_configuration_screen.dart';
import 'package:gemesh/Screens/Component_Screens/manage_rooms_screen.dart';
import 'package:gemesh/Screens/Component_Screens/network_screen.dart';
import 'package:gemesh/Screens/Component_Screens/profile_screen.dart';
import 'package:gemesh/Screens/Component_Screens/user_management.dart';
import 'package:gemesh/Screens/Component_Screens/wifi_devices_screen.dart';
import 'package:gemesh/Widgets/Styles/app_decoration.dart';
import 'package:gemesh/Widgets/Styles/custom_text_style.dart';
import 'package:gemesh/Widgets/Styles/theme_helper.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: AppBar(
        shadowColor: Colors.grey[400],
        surfaceTintColor: AppColors.whiteBackground,
        backgroundColor: AppColors.whiteBackground,
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Settings',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildUserManual(context),
              const SizedBox(
                height: 20,
              ),
              _buildHagway(context),
              const SizedBox(
                height: 20,
              ),
              _buildAboutUsContent(context),
              const SizedBox(
                height: 20,
              ),
              _buildLogOutContetnt(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserManual(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        decoration: AppDecoration.outlineBlack.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder34,
            border: Border.all(
              color: AppColors.backgroundColor,
            )),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileScreen()),
                      );
                    },
                    child: _buildContactUsIcon(
                      context,
                      contactUsIcon: ImageConstant.imgUserIcon11,
                      users: "Profile",
                    ),
                  )),
              const SizedBox(height: 19),
              Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserManagementScreen()),
                      );
                    },
                    child: _buildContactUsIcon(
                      context,
                      contactUsIcon: ImageConstant.imgContactUsIcon,
                      users: "Users",
                    ),
                  )),
              const SizedBox(height: 16),
              Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 4, bottom: 3), // Apply margin here
                          child: SvgPicture.asset(
                            ImageConstant
                                .imgThemeIcon1, // Replace ImageConstant.imgThemeIcon1 with your SVG file path
                            height: 24,
                            width: 24,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 17, top: 3, bottom: 3),
                            child: Text("Theme",
                                style: CustomTextStyles.labelLargeGray900_1)),
                        const Spacer(),
                        // CustomSwitch(
                        //     value: isSelectedSwitch,
                        //     onChange: (value) {
                        //       setState(() {
                        //         isSelectedSwitch = value;
                        //       });
                        //     })
                      ])),
              const SizedBox(height: 17),
              Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ManageRoomsScreen()),
                      );
                    },
                    child: _buildContactUsIcon(
                      context,
                      contactUsIcon: ImageConstant.imgRoomsIcon1,
                      users: "Manage Rooms",
                    ),
                  ))
            ]));
  }

  /// Section Widget
  Widget _buildHagway(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        decoration: AppDecoration.outlineBlack.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder34,
            border: Border.all(
              color: AppColors.backgroundColor,
            )),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const HagwayPage()),
                      // );
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset(ImageConstant.imgHagwayIcon,
                              height: 24, width: 24),
                          Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text("Hagway",
                                  style: CustomTextStyles.labelLargeGray900_1)),
                          const Spacer(),
                          SvgPicture.asset(ImageConstant.imgArrowRight,
                              height: 24, width: 24)
                        ]),
                  )),
              const SizedBox(height: 16),
              Padding(
                  padding: const EdgeInsets.only(right: 3),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const DeviceConfigurationScreen()),
                      );
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset(ImageConstant.imgDeviceConfigaration,
                              height: 24, width: 24),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text("Device Configure",
                                style: CustomTextStyles.labelLargeGray900_1),
                          ),
                          const Spacer(),
                          SvgPicture.asset(ImageConstant.imgArrowRight,
                              height: 24, width: 24)
                        ]),
                  )),
              const SizedBox(height: 18),
              Padding(
                  padding: const EdgeInsets.only(left: 1, right: 3),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WifiDevicesScreen()));
                    },
                    child: _buildGlobe(
                      context,
                      globeImage: ImageConstant.imgUpload,
                      networksText: "Wifi Devices",
                    ),
                  )),
              const SizedBox(height: 17),
              Padding(
                  padding: const EdgeInsets.only(left: 1, right: 3),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NetworkScreen()));
                    },
                    child: _buildGlobe(context,
                        globeImage: ImageConstant.imgGlobe,
                        networksText: "Networks"),
                  )),
              const SizedBox(height: 19),
              Padding(
                  padding: const EdgeInsets.only(left: 1, right: 3),
                  child: _buildGlobe(context,
                      globeImage: ImageConstant.imgMusic,
                      networksText: "App Language"))
            ]));
  }

  /// Section Widget
  Widget _buildAboutUsContent(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 19),
        decoration: AppDecoration.outlineBlack.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder34,
            border: Border.all(
              color: AppColors.backgroundColor,
            )),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
              padding: const EdgeInsets.only(right: 3),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactUsScreen()),
                  );
                },
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  SvgPicture.asset(ImageConstant.imgContrast,
                      height: 24, width: 24),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text("Contact Us",
                        style: CustomTextStyles.labelLargeGray900_1),
                  ),
                  const Spacer(),
                  SvgPicture.asset(ImageConstant.imgArrowRight,
                      height: 24, width: 24)
                ]),
              )),
          const SizedBox(height: 19),
          Padding(
              padding: const EdgeInsets.only(right: 3),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AboutUsScreen()),
                  );
                },
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  SvgPicture.asset(ImageConstant.imgInbox,
                      height: 24, width: 24),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text("About Us",
                        style: CustomTextStyles.labelLargeGray900_1),
                  ),
                  const Spacer(),
                  SvgPicture.asset(ImageConstant.imgArrowRight,
                      height: 24, width: 24)
                ]),
              )),
        ]));
  }

  /// Section Widget
  Widget _buildLogOutContetnt(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: AppDecoration.outlineBlack.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder34,
            border: Border.all(
              color: AppColors.backgroundColor,
            )),
        child: Row(children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: 2),
              child: SvgPicture.asset(
                ImageConstant.imgLogOut,
                height: 24,
                width: 24,
              )),
          Padding(
              padding: const EdgeInsets.only(left: 20, top: 4),
              child:
                  Text("Log Out", style: CustomTextStyles.labelLargeGray900_1))
        ]));
  }

  /// Common widget
  Widget _buildContactUsIcon(
    BuildContext context, {
    required String contactUsIcon,
    required String users,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SvgPicture.asset(contactUsIcon, height: 24, width: 24),
      Padding(
          padding: const EdgeInsets.only(left: 17),
          child: Text(users,
              style: CustomTextStyles.labelLargeGray900_1
                  .copyWith(color: appTheme.gray900))),
      const Spacer(),
      SvgPicture.asset(
        ImageConstant.imgArrowRight,
        height: 24,
        width: 24,
      )
    ]);
  }

  /// Common widget
  Widget _buildGlobe(
    BuildContext context, {
    required String globeImage,
    required String networksText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      SvgPicture.asset(globeImage, height: 24, width: 24),
      Padding(
          padding: const EdgeInsets.only(left: 17),
          child: Text(networksText,
              style: CustomTextStyles.labelLargeGray900_1
                  .copyWith(color: appTheme.gray900))),
      const Spacer(),
      SvgPicture.asset(ImageConstant.imgArrowRight, height: 24, width: 24)
    ]);
  }
}
