import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gemesh/Constants/color_constant.dart';

class User {
  final String name;
  final String role;
  final String imageUrl;
  final int notifications;

  User({
    required this.name,
    required this.role,
    required this.imageUrl,
    this.notifications = 0,
  });
}

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  final List<User> users = [
    User(
      name: 'Parvesh',
      role: 'Admin',
      imageUrl: 'assets/images/off.png',
    ),
    User(
      name: 'Ram',
      role: 'Guest User',
      imageUrl: 'assets/avatar2.png',
      notifications: 4,
    ),
    User(
      name: 'Jerome',
      role: 'Guest User',
      imageUrl: 'assets/avatar3.png',
      notifications: 2,
    ),
    User(
      name: 'Anai',
      role: 'Guest User',
      imageUrl: 'assets/avatar4.png',
      notifications: 3,
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
          'User Management',
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
                        motion: const StretchMotion(),
                        children: [
                          SlidableAction(
                            flex: 2,
                            borderRadius: BorderRadius.circular(30),
                            spacing: 2,
                            onPressed: ((context) {}),
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: CupertinoIcons.delete_solid,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.whiteBackground,
                            borderRadius: BorderRadius.circular(20),
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
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      user.role,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (user.notifications > 0)
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[50],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.notifications_none,
                                          color: Colors.blue),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${user.notifications}',
                                        style:
                                            const TextStyle(color: Colors.blue),
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
