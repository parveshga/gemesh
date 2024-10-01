import 'package:flutter/material.dart';
import 'package:gemesh/Constants/color_constant.dart';
import 'package:gemesh/Constants/image_constant.dart';
import 'package:gemesh/Screens/Main_Screens/bottom_navigation.dart';
import 'package:gemesh/Widgets/Styles/custom_text_style.dart';

class PlanCard extends StatefulWidget {
  const PlanCard({
    super.key,
    required this.type,
    required this.price,
    required this.slogan,
    required this.descrption1,
    required this.descrption2,
    required this.validity,
  });

  @override
  State<PlanCard> createState() => _PlanCardState();

  final String type;
  final String price;
  final String slogan;
  final String descrption1;
  final String descrption2;
  final String validity;
}

class _PlanCardState extends State<PlanCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.buttonBackground,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //iamge
            Image.asset(
              ImageConstant.imgSubscrption,
              height: 70,
            ),
            //type bhks
            Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.buttonBackground,
                    border: Border.all(
                      color: AppColors.primary,
                    )),
                child: Center(
                    child: Text(
                  widget.type,
                  style: CustomTextStyles.titleMediumBlack900,
                ))),

            //price
            Text(
              '₹ ${widget.price}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            //slogan
            Text(
              widget.slogan,
              style: CustomTextStyles.titleMediumBlack900,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //desc
                Text(
                  '✔ ${widget.descrption1}',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '✔ ${widget.descrption2}',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                //validity
                Text(
                  '✔ ${widget.validity}',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),

            //button
            // Gradient Button
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.blue.shade600,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text(
                  'Buy Now',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CustomBottomNavigation(),
                      ));
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => SubscrptionPaymentScreen(
                  //         planName: widget.type,
                  //         planPrice: widget.price,
                  //       ),
                  //     ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
