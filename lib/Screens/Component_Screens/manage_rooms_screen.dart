import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gemesh/Constants/color_constant.dart';

class User {
  final String name;
  final String imageUrl;

  User({
    required this.name,
    required this.imageUrl,
  });
}

class ManageRoomsScreen extends StatefulWidget {
  const ManageRoomsScreen({super.key});

  @override
  State<ManageRoomsScreen> createState() => _ManageRoomsScreenState();
}

class _ManageRoomsScreenState extends State<ManageRoomsScreen> {
  final List<User> users = [
    User(
      name: 'Living Room',
      imageUrl: 'assets/images/off.png',
    ),
    User(
      name: 'Kitchen',
      imageUrl: 'assets/avatar2.png',
    ),
    User(
      name: 'Bed Room',
      imageUrl: 'assets/avatar3.png',
    ),
    User(
      name: 'Balcony',
      imageUrl: 'assets/avatar4.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueshadeBackground,
      appBar: AppBar(
        backgroundColor: AppColors.blueshadeBackground,
        surfaceTintColor: AppColors.blueshadeBackground,
        elevation: 0,
        leading: const BackButton(color: AppColors.onBoardIndicatior),
        title: const Text(
          'Manage Rooms',
          style: TextStyle(
            color: AppColors.onBoardIndicatior,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              right: 10,
            ),
            child: Icon(CupertinoIcons.add,
                size: 25, color: AppColors.onBoardIndicatior),
          )
        ],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // User List
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return Slidable(
                      endActionPane: ActionPane(
                        motion: const BehindMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) => {},
                            icon: Icons.delete,
                            backgroundColor: Colors.redAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.whiteBackground,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.blueBorder,
                            )),
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage(user.imageUrl),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primary,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
