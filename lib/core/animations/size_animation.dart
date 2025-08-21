import 'package:flutter/material.dart';

///Adding Size Effect to a given child
class SizeAnimation extends StatefulWidget {
  final Widget child;

  final double delay;
  final Duration? duration;
  const SizeAnimation({super.key, required this.child, this.delay = 0.0, this.duration});

  @override
  SizeAnimationState createState() => SizeAnimationState();
}

class SizeAnimationState extends State<SizeAnimation> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> sizeAnimation, fadeAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));

    sizeAnimation = Tween<double>(begin: 0, end: 1).animate(
      //
      CurvedAnimation(parent: controller, curve: Curves.ease),
    );
    fadeAnimation = Tween<double>(begin: -1, end: 1).animate(CurvedAnimation(parent: controller, curve: Curves.ease));
    Future.delayed(Duration(milliseconds: (500 * widget.delay).round())).then((value) {
      startAnimation();
    });
  }

  void startAnimation() {
    // Enable animation: reset and play
    controller
      ..reset()
      ..forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: sizeAnimation,

      //
      child: FadeTransition(opacity: fadeAnimation, child: widget.child),
    );
  }
}