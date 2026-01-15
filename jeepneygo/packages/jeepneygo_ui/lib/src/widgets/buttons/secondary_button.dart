import 'package:flutter/material.dart';

import '../../theme/app_spacing.dart';

/// Secondary outlined button
class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.isEnabled = true,
    this.icon,
    this.width,
  });

  final VoidCallback? onPressed;
  final String label;
  final bool isEnabled;
  final IconData? icon;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: AppSpacing.buttonHeight,
      child: OutlinedButton(
        onPressed: isEnabled ? onPressed : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 20),
              const SizedBox(width: AppSpacing.sm),
            ],
            Text(label),
          ],
        ),
      ),
    );
  }
}
