import 'package:flutter/material.dart';
import 'package:e_commerce/core/app_colors.dart';
import 'package:e_commerce/core/app_strings.dart';
import 'package:e_commerce/main.dart';
import 'package:e_commerce/presentation/widgets/app_button.dart';

class AlertsManager {
  static Future<T> showAppDialog<T>({
    required Widget child,
    Color? barrierColor,
    bool barrierDismissible = true,
  }) async {
    return await showDialog(
      //
      context: appContext,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      builder:
          (builder) => Dialog(
            //
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            insetPadding: const EdgeInsets.all(16),
            child: child,
          ),
    );
  }

  static Future<T?> showAppGeneralDialog<T>({
    Color? barrierColor,
    bool barrierDismissible = true,
    required Widget child,
    double finalScale = 1,
  }) async {
    return await showGeneralDialog<T>(
      context: appContext,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor!,
      transitionBuilder: (context, animation, secondaryAnimation, dialogChild) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOutQuad,
        );

        return ScaleTransition(
          scale: Tween<double>(
            begin: 0.2,
            end: finalScale,
          ).animate(curvedAnimation),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0.5, end: 1).animate(curvedAnimation),
            child: dialogChild,
          ),
        );
      },

      pageBuilder:
          (context, animation, secondaryAnimation) =>
              SafeArea(child: Center(child: Material(child: child))),
    );
  }

  static Future<void> showLoadingDialog() async {
    await showAppDialog(
      barrierDismissible: false,
      child: const CircularProgressIndicator(),
    );
  }

  static Future<T?> showAppModelSheet<T>({
    String? title,
    required Widget child,
    bool isBarrierDismissible = true,
  }) async {
    return await showModalBottomSheet<T>(
      context: appContext,
      isDismissible: isBarrierDismissible,
      builder:
          (context) => SafeArea(
            child: Wrap(
              children:
              //
              [
                //
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    //
                    spacing: 16,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(),
                      if (title != null) ...[
                        Text(
                          title,
                          //
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ],

                      child,
                      SizedBox(
                        height: MediaQuery.of(context).viewInsets.bottom,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }

  static Future<T?> showOptionalBottomSheet<T>(
    String content, {
    String? okText,
    String? cancelText,
    bool barrierDismissible = true,
    Color? okButtonColor,
    Color? cancelButtonColor,
    VoidCallback? onCancel,
    VoidCallback? onOk,
    Widget? child,
  }) async {
    return await showAppModelSheet(
      isBarrierDismissible: barrierDismissible,

      //
      child: Column(
        spacing: 16,
        children: [
          Text(
            content,
            //
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: AppButton(
                  backgroundColor: cancelButtonColor ?? Colors.white,
                  title: cancelText ?? AppStrings.cancel,
                  onPressed: () {
                    Navigator.pop(appContext);
                    if (onCancel != null) {
                      onCancel();
                    }
                  },
                ),
              ),
              Expanded(
                child: AppButton(
                  backgroundColor: okButtonColor ?? AppColors.primary,
                  title: okText ?? AppStrings.confirm,
                  onPressed: () {
                    if (onOk != null) {
                      onOk();
                    }
                    Navigator.pop(appContext);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Future<void> showAppToastMessage(
    String message, {
    Color? backgorundColor,
    Color? textColor,
  }) async {
    final snackBar = SnackBar(
      backgroundColor: backgorundColor,

      content: Text(message, style: TextStyle(color: textColor)),
    );

    ScaffoldMessenger.of(appContext).showSnackBar(snackBar);
  }
}