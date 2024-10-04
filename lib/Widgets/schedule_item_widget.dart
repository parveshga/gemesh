import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gemesh/Constants/image_constant.dart';
import 'package:gemesh/Widgets/Styles/app_decoration.dart';
import 'package:gemesh/Widgets/Styles/custom_text_style.dart';
import 'package:gemesh/Widgets/custom_icon_button.dart';

class ScheduleItemWidget extends StatefulWidget {
  final ScheduleItem item;
  const ScheduleItemWidget({super.key, required this.item});

  @override
  State<ScheduleItemWidget> createState() => _ScheduleItemWidgetState();
}

class _ScheduleItemWidgetState extends State<ScheduleItemWidget> {
  bool isSelectedSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 1),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomIconButton(
                  height: 42,
                  width: 42,
                  padding: const EdgeInsets.all(9),
                  decoration: IconButtonStyleHelper
                      .gradientLightBlueToOnErrorContainerTL8,
                  child: SvgPicture.asset(
                    widget.item.iconImage!,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    bottom: 9,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item.title!,
                        style: CustomTextStyles.labelLargeSemiBold,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.item.device!,
                        style: CustomTextStyles.labelMediumGray800,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // CustomSwitch(
                //   margin: const EdgeInsets.only(
                //     top: 4,
                //     bottom: 5,
                //   ),
                //   value: isSelectedSwitch,
                //   onChange: (value) {
                //     setState(() {
                //       isSelectedSwitch = !isSelectedSwitch;
                //     });
                //   },
                // ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              SvgPicture.asset(
                ImageConstant.imgRepeatIcon,
                height: 14,
                width: 14,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  widget.item.days!,
                  style: CustomTextStyles.labelMedium10,
                ),
              ),
            ],
          ),
          const SizedBox(height: 11),
          Row(
            children: [
              SvgPicture.asset(
                ImageConstant.imgClockErrorcontainer,
                height: 14,
                width: 14,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "6:00 am - 7:00 am",
                  style: CustomTextStyles.labelMedium10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ScheduleItem {
  final String? iconImage;
  final String? device;
  final String? title;
  final String? days;

  ScheduleItem({
    required this.days,
    required this.iconImage,
    required this.title,
    required this.device,
  });
}
