import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.onPressed, this.child, this.title = '', this.style, this.backgroundColor, this.width, this.height});
  final VoidCallback onPressed;
  final Widget? child;
  final String? title;
  final TextStyle? style;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(backgroundColor: WidgetStateProperty.all(backgroundColor), foregroundColor: WidgetStateProperty.all(Colors.black)),
        onPressed: onPressed,
        child:
            child ??
            Text(
              title!,
              //
              style: style,

              //
            ),
      ),
    );
  }
}