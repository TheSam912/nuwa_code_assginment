import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nuwa/constants/strings.dart';
import '../constants/assets.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/dialogs/connect_dialog.dart';
import '../widgets/dialogs/loading_dialog.dart';
import '../widgets/dialogs/success_dialog.dart';

class DataCollectionPage extends StatefulWidget {
  @override
  State<DataCollectionPage> createState() => _DataCollectionPageState();
}

class _DataCollectionPageState extends State<DataCollectionPage> {
  bool isPencilConnected = false;
  late Random random;
  String? word;

  selectRandomWord() {
    random = Random();
    setState(() {
      word = randomWords[random.nextInt(randomWords.length)];
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      500.ms,
      () => checkPencilConnection(),
    );
  }

  void checkPencilConnection() {
    if (!isPencilConnected) {
      showConnectDialog();
    }
  }

  void showConnectDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ConnectDialog(
          onConnectPressed: startFakeConnection,
        ),
      ),
    );
  }

  void startFakeConnection() {
    Navigator.pop(context);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: const LoadingDialog(),
      ),
    );

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pop(context);
      setState(() {
        isPencilConnected = true;
      });
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: SuccessDialog(
            onConnectPressed: () {
              Navigator.pop(context);
              selectRandomWord();
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppbarWidget(),
            headerWidgetCollection(context),
            titleAndButton(
                context, textExperiment, btnRefresh, Icons.refresh, () => selectRandomWord()),
            autoTextGenerator(context),
            titleAndButton(context, pleaseWriteBelow, btnExport, Icons.download_sharp, () {}),
            Container(
              width: double.infinity,
              height: 300,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: tGreen, width: 1)),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  autoTextGenerator(context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: Text(
        word ?? "No word available",
        style: TextStyles.custom(context: context, fontSize: 26),
      ),
    );
  }

  titleAndButton(context, title, buttonText, icon, VoidCallback voidCallBack) {
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

  headerWidgetCollection(context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dataCollectionPageTitle,
            style: TextStyles.subHeadline(context),
          ),
          connectedButton(context, isPencilConnected)
        ],
      ),
    );
  }

  connectedButton(context, connected) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: connected ? tLightGreen : Colors.redAccent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: connected
                  ? Image.asset(
                      connectedIcon,
                      width: 16,
                      height: 16,
                    )
                  : null,
            ),
            Text(
              connected ? btnConnected : btnDisconnect,
              style: TextStyles.custom(
                  context: context, fontSize: 12, color: connected ? tGreen : Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
