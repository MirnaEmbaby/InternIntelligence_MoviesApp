import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/modules/login_screen/login_screen.dart';
import 'package:movies_app/shared/components/constants.dart';

class MySplashScreen extends StatelessWidget {
  const MySplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/images/video-play-128.png'),
      durationInSeconds: 2,
      showLoader: false,
      logoWidth: 200,
      backgroundColor: defBlack,
      navigator: const LoginScreen(),
    );
  }
}
