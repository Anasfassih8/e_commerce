import 'package:flutter/material.dart';

class HorizontalAnimation extends StatefulWidget {
  const HorizontalAnimation({super.key, required this.child, this.leftToRight = true});

  final Widget child;
  final bool? leftToRight;

  @override
  State<HorizontalAnimation> createState() => _HorizontalAnimationState();
}

class _HorizontalAnimationState extends State<HorizontalAnimation> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fadeAnimation;

  late Animation<Offset> translateAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));

    translateAnimation = Tween<Offset>(
      //
      begin: widget.leftToRight ?? false ? const Offset(-1, 0) : Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.fastEaseInToSlowEaseOut));

    fadeAnimation = Tween<double>(
      //
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.ease));

    startAnimation();
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
      child: SlideTransition(position: translateAnimation, child: widget.child),
    );
  }
}