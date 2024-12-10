import 'package:flutter/material.dart';
import 'package:nuwa/constants/colors.dart';
import 'package:nuwa/widgets/button_widget.dart';
import '../../constants/assets.dart';
import '../../constants/strings.dart';
import '../../constants/styles.dart';

class ConnectPencilDialog extends StatelessWidget {
  final VoidCallback onConnectPressed;

  const ConnectPencilDialog({Key? key, required this.onConnectPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height / 2.5,
      width: screenSize.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(pencilIcon, width: 80, height: 80),
          const SizedBox(height: 16),
          Text(
            notConnectedPencilTitle,
            style: TextStyles.custom(context: context, fontSize: 18),
          ),
          const SizedBox(height: 8),
          Text(
            notConnectedPencilDescription,
            textAlign: TextAlign.center,
            style: TextStyles.custom(
                context: context, fontSize: 14, color: tGrey, fontWeight: FontWeight.w400),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: CustomButton(
              text: connect,
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
