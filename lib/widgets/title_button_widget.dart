import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';
import 'button_widget.dart';

titleButtonWidget(context, title, buttonText, icon, VoidCallback voidCallBack) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyles.subHeadline(context),
        ),
        CustomButton(
          text: buttonText,
          backgroundColor: Colors.white,
          textColor: tTextColor,
          horizontalPadding: 12,
          verticalPadding: 0,
          fontSize: 12,
          icon: Icon(
            icon,
            color: Colors.grey.shade400,
            size: 20,
          ),
          onPressed: voidCallBack,
        )
      ],
    ),
  );
}
