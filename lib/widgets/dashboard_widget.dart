import 'dart:async';
import '../pages/collection_page.dart';
import '../widgets/button_widget.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../animations/page_transition.dart';
import '../constants/styles.dart';

class DashboardWidget extends StatefulWidget {
  final List<String> imageList;
  final String dialogText;
  final String buttonText;

  const DashboardWidget({
    Key? key,
    required this.imageList,
    required this.dialogText,
    required this.buttonText,
  }) : super(key: key);

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  int _currentIndex = 0;
  bool _isVisible = true;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startFadingImages();
  }

  void _startFadingImages() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _isVisible = false;
      });

      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _currentIndex = (_currentIndex + 1) % widget.imageList.length;
          _isVisible = true;
        });
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLargeTablet = screenWidth > 900;
    return SingleChildScrollView(
      child: Container(
        width: isLargeTablet ? screenWidth / 2 : screenWidth * 0.8,
        constraints: BoxConstraints(maxHeight: screenHeight * 0.8),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Image.asset(
                  widget.imageList[_currentIndex],
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: screenHeight * 0.2,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Flexible(
              child: Text(
                widget.dialogText,
                textAlign: TextAlign.center,
                style: TextStyles.headline(context),
              ),
            ),
            const SizedBox(height: 20.0),
            CustomButton(
              text: widget.buttonText,
              backgroundColor: tGreen,
              fontSize: 14,
              horizontalPadding: screenWidth * 0.1,
              textColor: tTextColor,
              verticalPadding: 18.0,
              onPressed: () => Navigator.of(context).pushReplacement(
                FadePageRoute(page: DataCollectionPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
