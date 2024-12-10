import 'package:flutter/material.dart';
import 'package:nuwa/constants/strings.dart';
import 'package:nuwa/widgets/loading_widget.dart';

import '../../constants/colors.dart';
import '../../constants/styles.dart';
import '../button_widget.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

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
          const LoadingWidget(
            size: 80,
          ),
          const SizedBox(height: 16),
          Text(
            connecting,
            style: TextStyles.custom(context: context, fontSize: 18),
          ),
          const SizedBox(height: 8),
          Text(
            loadingConnectionDescription,
            textAlign: TextAlign.center,
            style: TextStyles.custom(
                context: context, fontSize: 15, color: tGrey, fontWeight: FontWeight.w400),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: CustomButton(
              text: start,
              onPressed: () {},
              backgroundColor: tWhiteGreen,
              fontSize: 14,
              textColor: Colors.white,
              verticalPadding: 12,
            ),
          )
        ],
      ),
    );
  }
}
