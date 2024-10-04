import 'package:flutter/material.dart';
import 'package:gemesh/Constants/color_constant.dart';

class CreateScheduleScreen extends StatefulWidget {
  const CreateScheduleScreen({super.key});

  @override
  State<CreateScheduleScreen> createState() => _CreateScheduleScreenState();
}

class _CreateScheduleScreenState extends State<CreateScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: AppBar(
        backgroundColor: AppColors.whiteBackground,
        title: const Text('Create Schedule',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            )),
      ),
      body: const Column(
        children: [
          Column(
            children: [
              Text(
                'Schedule Name',
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  decoration: InputDecoration(hintText: 'Enter Schedule Name'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
