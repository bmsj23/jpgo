import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

/// Full-screen loading overlay
class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
    this.message,
  });

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white.withOpacity(0.9),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
            if (message != null) ...[
              const SizedBox(height: 16),
              Text(
                message!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// Show loading overlay as a dialog
  static Future<void> show(BuildContext context, {String? message}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: LoadingOverlay(message: message),
      ),
    );
  }

  /// Hide loading overlay
  static void hide(BuildContext context) {
    Navigator.of(context).pop();
  }
}
