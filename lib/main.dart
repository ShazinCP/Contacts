import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalx_machine_task/controller/auth_provider.dart';
import 'package:totalx_machine_task/controller/phone_provider.dart';
import 'package:totalx_machine_task/view/login_screen.dart';
import 'package:totalx_machine_task/view/otp_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PhoneProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Contacts',
        home: OtpScreen(verificationId: ''),
      ),
    );
  }
}
