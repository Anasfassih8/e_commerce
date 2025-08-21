import 'package:flutter/material.dart';

class ScaleAnimation extends StatefulWidget {
  const ScaleAnimation({super.key, required this.child, this.delay = 0.0});
  final Widget child;
  final double delay;

  @override
  State<ScaleAnimation> createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> scaleAnimation, fadeAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    scaleAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: controller, curve: Curves.ease));
    fadeAnimation = Tween<double>(begin: -0.5, end: 1).animate(CurvedAnimation(parent: controller, curve: Curves.ease));
    Future.delayed(Duration(milliseconds: (500 * widget.delay).round())).then((value) {
      startAnimation();
    });
  }

  void startAnimation() {
    controller
      ..reset()
      ..forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      //
      child: ScaleTransition(scale: scaleAnimation, child: widget.child),
    );
  }
}