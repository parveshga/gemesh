import 'package:flutter/material.dart';
import 'package:gemesh/Constants/color_constant.dart';
import 'package:gemesh/Widgets/Styles/custom_text_style.dart';

class SubscrptionPaymentScreen extends StatefulWidget {
  final String planName;
  final String planPrice;

  const SubscrptionPaymentScreen(
      {super.key, required this.planName, required this.planPrice});

  @override
  State<SubscrptionPaymentScreen> createState() =>
      _SubscrptionPaymentScreenState();
}

class _SubscrptionPaymentScreenState extends State<SubscrptionPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.buttonBackground,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Plan: ',
                          style: CustomTextStyles.bodySmallBlack900,
                        ),
                        Text(
                          widget.planName,
                          style: CustomTextStyles.titleMediumBlack900,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Amount Payable: ',
                          style: CustomTextStyles.bodySmallBlack900,
                        ),
                        Text(
                          '₹ ${widget.planPrice}',
                          style: CustomTextStyles.titleMediumBlack900,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
