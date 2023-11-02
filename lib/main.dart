import 'package:flutter/material.dart';
import 'package:hackaton/Provider/Auth/login_provider.dart';
import 'package:hackaton/Provider/Events/event_provider.dart';
import 'package:hackaton/Provider/Payment/payment.dart';
import 'package:hackaton/Provider/Profile/profile_provider.dart';
import 'package:hackaton/Provider/Util/util_provider.dart';
import 'package:hackaton/View/Intro/init_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PaypalProvider()),
        ChangeNotifierProvider(create: (_) => UtilPovider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => EventProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider(context)),
      ],
      builder: (context, wi1dget) => MaterialApp(
        title: 'Hackaton',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: 'SF Pro Text'),
        home: InitScreen(),
      ),
    );
  }
}
