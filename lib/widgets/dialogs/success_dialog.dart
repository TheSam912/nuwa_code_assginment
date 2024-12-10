import 'package:flutter/material.dart';
import 'package:nuwa/constants/colors.dart';

import '../../constants/assets.dart';
import '../../constants/strings.dart';
import '../../constants/styles.dart';
import '../button_widget.dart';

class SuccessDialog extends StatelessWidget {
  final VoidCallback onConnectPressed;

  const SuccessDialog({Key? key, required this.onConnectPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isLargeTablet = screenSize.width > 900;
    return Container(
      height: isLargeTablet ? screenSize.height / 2 : screenSize.height / 2.5,
      width: isLargeTablet ? screenSize.width / 3 : screenSize.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            pencilConnectedIcon,
            width: 80,
            height: 80,
          ),
          const SizedBox(height: 16),
          Text(
            btnConnected,
            style: TextStyles.custom(context: context, fontSize: 18),
          ),
          const SizedBox(height: 8),
          Text(
            connectedPencilDescription,
            textAlign: TextAlign.center,
            style: TextStyles.custom(
                context: context, fontSize: 14, color: tGrey, fontWeight: FontWeight.w400),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: CustomButton(
              text: start,
              onPressed: onConnectPressed,
              backgroundColor: tGreen,
              fontSize: 16,
              verticalPadding: 12,
            ),
          )
        ],
      ),
    );
  }
}
