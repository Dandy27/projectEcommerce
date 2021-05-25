import 'package:flutter/material.dart';
import 'package:projectecommerce/routs.dart';
import 'package:projectecommerce/screens/splash/splash_screen.dart';
import 'package:projectecommerce/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter E-commerce',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      // home: SplashScreen(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
