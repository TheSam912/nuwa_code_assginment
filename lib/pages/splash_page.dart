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
    return Scaffold(
      backgroundColor: tBackground,
      body: Center(
        child: Image.asset(
          logo,
          width: screenWidth / 3,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
