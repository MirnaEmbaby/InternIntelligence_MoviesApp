import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app/modules/login_screen/login_screen.dart';
import 'package:movies_app/shared/components/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: const Icon(
        Icons.movie_filter_rounded,
        color: mainColor,
        size: 150,
      ),
    );
  }
}
