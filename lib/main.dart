import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_bookly/constants.dart';
import 'package:my_bookly/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const MyBooklyApp());
}

class MyBooklyApp extends StatelessWidget {
  const MyBooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bookly',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: MyConstants.KprimaryColor),
      home: const SplashView(),
    );
  }
}
