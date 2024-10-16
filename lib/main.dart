import 'package:flutter/material.dart';
import 'package:gemesh/Screens/Splash_Screen/splash_screen.dart';
import 'package:gemesh/Services/google_auth_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SplashScreen(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GoogleSignInService(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: true,
        home: SplashScreen(),
      ),
    );
  }
}
