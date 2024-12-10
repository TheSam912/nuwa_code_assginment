import 'dart:async';
import '../constants/assets.dart';
import '../constants/colors.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  final double size;
  final Duration duration;

  const LoadingWidget({
    Key? key,
    this.size = 100.0,
    this.duration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  late Timer _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    _timer = Timer.periodic(widget.duration, (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % loadingIcons.length;
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
    return Container(
      width: widget.size,
      height: widget.size,
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(shape: BoxShape.circle, color: tPurple),
      alignment: Alignment.center,
      child: Image.asset(
        loadingIcons[_currentIndex],
        fit: BoxFit.contain,
      ),
    );
  }
}
