import '../constants/assets.dart';
import '../constants/colors.dart';
import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final logoSize = screenSize.width < 600 ? 35.0 : 45.0;
    final iconSize = screenSize.width < 600 ? 25.0 : 35.0;
    return Container(
      width: screenSize.width,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      color: tAppbar,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(logo,
              fit: BoxFit.cover, width: logoSize, height: logoSize, alignment: Alignment.center),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                size: iconSize,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
