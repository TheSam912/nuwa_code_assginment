import '../constants/assets.dart';
import '../constants/colors.dart';
import '../pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../animations/page_transition.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  route(context) {
    Future.delayed(
      2.seconds,
      () {
        Navigator.of(context).pushReplacement(
          FadePageRoute(page: const AdminDashboardPage()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    route(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: tBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          Center(
            child: Image.asset(
              logo,
              width: screenWidth / 3,
              height: screenHeight / 3,
              fit: BoxFit.contain,
            ).animate(delay: 300.ms).flipH(duration: 400.ms),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Image.asset(
              logoBottomPage,
              width: 120,
              fit: BoxFit.contain,
            ).animate(delay: 300.ms).fade(duration: 400.ms),
          )
        ],
      ),
    );
  }
}
