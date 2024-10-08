import 'package:flutter/material.dart';
import 'package:gemesh/Utils/ac_utils.dart';
import 'package:gemesh/Widgets/AC_Widgets/slider/custom_arc.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SliderWidget extends StatelessWidget {
  final double progressVal;
  final Color color;
  final Function(double) onChange;

  const SliderWidget(
      {Key? key,
      required this.progressVal,
      required this.color,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200 + 35,
      height: 200 + 35,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 200 + 35,
            height: 200 + 35,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
          ),
          Center(
            child:
                CustomArc(color: color, diameter: 200, sweepAngle: progressVal),
          ),
          Center(
            child: Container(
              width: 200 - 20,
              height: 200 - 20,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 15,
                    style: BorderStyle.solid,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ]),
              child: SleekCircularSlider(
                min: kMinDegree,
                max: kMaxDegree,
                initialValue: angleRange(progressVal, kMinDegree, kMaxDegree),
                appearance: CircularSliderAppearance(
                  spinnerMode: false,
                  startAngle: 180,
                  angleRange: 180,
                  size: 200 - 30,
                  customWidths: CustomSliderWidths(
                    trackWidth: 20,
                    shadowWidth: 0,
                    progressBarWidth: 01,
                    handlerSize: 5,
                  ),
                  customColors: CustomSliderColors(
                    hideShadow: true,
                    progressBarColor: Colors.transparent,
                    trackColor: Colors.transparent,
                    dotColor: color,
                  ),
                ),
                onChange: onChange,
                innerWidget: (percentage) {
                  return Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          percentage.toInt().toString(),
                          style: const TextStyle(
                              height: 0,
                              fontSize: 45,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Text(
                                "o",
                                style: TextStyle(
                                    height: 0,
                                    letterSpacing: 2,
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                "C",
                                style: TextStyle(
                                    height: 0,
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
