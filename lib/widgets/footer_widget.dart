import 'package:flutter/material.dart';
import '../constants/assets.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Center(
        child: Image.asset(
          logoBottomPage,
          width: 120,
        ),
      ),
    );
    ();
  }
}
