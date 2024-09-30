import 'package:flutter/material.dart';
import 'package:gemesh/Widgets/Styles/custom_text_style.dart';
import 'package:gemesh/Widgets/subscrption_card_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:gemesh/Constants/color_constant.dart';
import 'package:gemesh/Constants/subscrption_plan_data.dart';

class SubscriptionPlanScreen extends StatefulWidget {
  const SubscriptionPlanScreen({super.key});

  @override
  State<SubscriptionPlanScreen> createState() => _SubscriptionPlanScreenState();
}

class _SubscriptionPlanScreenState extends State<SubscriptionPlanScreen> {
  int _selectedDurationIndex = 0;
  final PageController _pageController = PageController();

  final List<String> durations = ['Monthly', 'Quarterly', 'Yearly'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text(
                'Pricing Plan',
                style: CustomTextStyles.labelLargeGray900,
              ),
            ),
            //
            const SizedBox(
              height: 10,
            ),

            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Unlock Smart Living\nwith the ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'Perfect Plan!',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),

            //slogan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Home automation has never been this easy nor this affordable',
                style: CustomTextStyles.labelSmallGray800,
                textAlign: TextAlign.center,
              ),
            ),

            //Selection
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: durations.map((duration) {
                    final index = durations.indexOf(duration);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDurationIndex = index;
                          _pageController.jumpToPage(0);
                        });
                      },
                      child: Container(
                        width: 110,
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          gradient: _selectedDurationIndex == index
                              ? LinearGradient(
                                  colors: [
                                    Colors.blue,
                                    Colors.blue.shade900,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )
                              : const LinearGradient(
                                  colors: [
                                    AppColors.buttonBackground,
                                    AppColors.buttonBackground
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            duration,
                            style: TextStyle(
                              fontWeight: _selectedDurationIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: _selectedDurationIndex == index
                                  ? Colors.white
                                  : AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            // PageView for BHK options
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent, //buttonBackground,
                      borderRadius: BorderRadius.circular(20)),
                  child: PageView(
                    controller: _pageController,
                    children: [
                      SubscriptionTypePage(
                          type: '1BHK',
                          duration: durations[_selectedDurationIndex]),
                      SubscriptionTypePage(
                          type: '2BHK',
                          duration: durations[_selectedDurationIndex]),
                      SubscriptionTypePage(
                          type: '3BHK',
                          duration: durations[_selectedDurationIndex]),
                    ],
                  ),
                ),
              ),
            ),
            // Page Indicator for BHK PageView
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: const ExpandingDotsEffect(
                spacing: 3,
                activeDotColor: AppColors.primary,
                dotColor: Colors.grey,
                dotHeight: 5,
                dotWidth: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubscriptionTypePage extends StatelessWidget {
  final String type;
  final String duration;

  const SubscriptionTypePage(
      {super.key, required this.type, required this.duration});

  @override
  Widget build(BuildContext context) {
    final plans = subscriptionPlans
        .where((plan) => plan.type == type && plan.duration == duration)
        .toList();

    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: PageController(),
            itemCount: plans.length,
            itemBuilder: (context, index) {
              final plan = plans[index];
              return PlanCard(
                type: plan.type,
                price: plan.price.toStringAsFixed(2),
                slogan: plan.title.toString(),
                descrption1: plan.descrption1.toString(),
                descrption2: plan.descrption2.toString(),
                validity: plan.validity,
              );
            },
          ),
        ),
      ],
    );
  }
}
