import 'package:flutter/material.dart';
import 'package:nuwa/pages/collection_page.dart';
import 'package:nuwa/pages/dashboard_page.dart';
import 'package:nuwa/pages/splash_page.dart';

import 'animations/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NUWA Code Assignment',
      home: const SplashPage(),
      onGenerateRoute: (settings) {
        return switch (settings.name) {
          'AdminDashboard' => FadePageRoute(page: const AdminDashboardPage()),
          'DataCollection' => FadePageRoute(
              page: DataCollectionPage(),
            ),
          _ => FadePageRoute(page: const AdminDashboardPage())
        };
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
