import 'package:flutter/material.dart';
import 'package:gemesh/Constants/color_constant.dart';
import 'package:gemesh/Screens/Component_Screens/create_schedule_screen.dart';
import 'package:gemesh/Widgets/custom_search_view.dart';
import 'package:gemesh/Widgets/schedule_item_widget.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  List<String> dropdownItemList = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  List<ScheduleItem> items = [
    ScheduleItem(
      days: "Mon, Tue, Wed, Thu, Fri",
      iconImage: "assets/images/Group (1).svg",
      title: "Wake Up Scenario",
      device: "active devices(4)",
    ),
    ScheduleItem(
      days: "Mon, Tue, Wed, Thu, Fri",
      iconImage: "assets/images/Group (2).svg",
      title: "Exercise Scenario",
      device: "active devices(6)",
    ),
    ScheduleItem(
      days: "Fri, Sat",
      iconImage: "assets/images/wok.svg",
      title: "Wrok Scenario",
      device: "active devices(6)",
    ),
    ScheduleItem(
      days: "Sat, Sun",
      iconImage: "assets/images/movie.svg",
      title: "Movie Scenario",
      device: "active devices(6)",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: SafeArea(
        child: Container(
          color: Colors.transparent,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const BottomSearchSection(),
                const SizedBox(
                  height: 20,
                ),

                //
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Schedules',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateScheduleScreen()));
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),

                //
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SizedBox(child: buildScheduleItems(context)),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Schedule Widget
  Widget buildScheduleItems(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        //physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ScheduleItemWidget(
            item: items[index],
          );
        },
      ),
    );
  }
}
