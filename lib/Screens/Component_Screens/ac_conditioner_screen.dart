import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:gemesh/Utils/ac_utils.dart';
import 'package:gemesh/Widgets/AC_Widgets/option_widget.dart';
import 'package:gemesh/Widgets/AC_Widgets/power_widget.dart';
import 'package:gemesh/Widgets/AC_Widgets/slider/slider_widget.dart';
import 'package:gemesh/Widgets/AC_Widgets/speed_widget.dart';
import 'package:rainbow_color/rainbow_color.dart';

class AcConditionerScreen extends StatefulWidget {
  final String tag;

  const AcConditionerScreen({Key? key, required this.tag}) : super(key: key);
  @override
  _AcConditionerScreenState createState() => _AcConditionerScreenState();
}

class _AcConditionerScreenState extends State<AcConditionerScreen>
    with TickerProviderStateMixin {
  Options option = Options.cooling;
  bool isActive = false;
  int speed = 1;
  double temp = 22.85;
  double progressVal = 0.49;

  var activeColor = Rainbow(spectrum: [
    const Color.fromARGB(255, 117, 213, 255),
    const Color(0xFF1086D4),
    const Color.fromARGB(255, 255, 183, 0),
    const Color.fromARGB(255, 255, 89, 0),
    const Color(0xFFE4262F)
  ], rangeStart: 0.0, rangeEnd: 1.0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.white,
                activeColor[progressVal].withOpacity(0.5),
                activeColor[progressVal]
              ]),
        ),
        child: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
              options: ParticleOptions(
            baseColor: const Color(0xFFFFFFFF),
            opacityChangeRate: 0.25,
            minOpacity: 0.1,
            maxOpacity: 0.3,
            spawnMinSpeed: speed * 60.0,
            spawnMaxSpeed: speed * 120,
            spawnMinRadius: 2.0,
            spawnMaxRadius: 5.0,
            particleCount: isActive ? speed * 150 : 0,
          )),
          vsync: this,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        options(),
                        slider(),
                        controls(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget options() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OptionWidget(
          icon: 'assets/images/clock.svg',
          isSelected: option == Options.timer,
          onTap: () => setState(() {
            option = Options.timer;
          }),
          size: 32,
        ),
        OptionWidget(
          icon: 'assets/images/snow.svg',
          isSelected: option == Options.cooling,
          onTap: () => setState(() {
            option = Options.cooling;
          }),
          size: 25,
        ),
        OptionWidget(
          icon: 'assets/images/bright.svg',
          isSelected: option == Options.heat,
          onTap: () => setState(() {
            option = Options.heat;
          }),
          size: 35,
        ),
        OptionWidget(
          icon: 'assets/images/drop.svg',
          isSelected: option == Options.dry,
          onTap: () => setState(() {
            option = Options.dry;
          }),
          size: 28,
        ),
      ],
    );
  }

  Widget slider() {
    return SliderWidget(
      progressVal: progressVal,
      color: activeColor[progressVal],
      onChange: (value) {
        setState(() {
          temp = value;
          progressVal = normalize(value, kMinDegree, kMaxDegree);
        });
      },
    );
  }

  Widget controls() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SpeedWidget(
                  speed: speed,
                  changeSpeed: (val) => setState(() {
                        speed = val;
                      })),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: PowerWidget(
                  isActive: isActive,
                  onChanged: (val) => setState(() {
                        isActive = val;
                      })),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

enum Options { timer, cooling, heat, dry }
