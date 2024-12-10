import 'package:flutter/cupertino.dart';

import '../constants/colors.dart';

statusWidget(){
  return PreferredSize(
      preferredSize: const Size(0, 0),
      child: Container(
        color: tAppbar.withOpacity(0.93),
      ));
}