class SubscriptionPlan {
  final String type; // 1BHK, 2BHK, 3BHK
  final String duration; // Monthly, Quarterly, Yearly
  final double price;
  final String title;
  final String descrption1;
  final String descrption2;
  final String validity;

  SubscriptionPlan({
    required this.type,
    required this.duration,
    required this.price,
    required this.title,
    required this.descrption1,
    required this.descrption2,
    required this.validity,
  });
}
