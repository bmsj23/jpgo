import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';

/// Large toggle button for starting/ending trips (Driver app)
class TripToggleButton extends StatelessWidget {
  const TripToggleButton({
    super.key,
    required this.isOnTrip,
    required this.onPressed,
    this.isLoading = false,
  });

  final bool isOnTrip;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isOnTrip ? AppColors.error : AppColors.success,
          boxShadow: [
            BoxShadow(
              color: (isOnTrip ? AppColors.error : AppColors.success).withOpacity(0.4),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.white,
                  strokeWidth: 3,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isOnTrip ? Icons.stop_rounded : Icons.play_arrow_rounded,
                    size: 48,
                    color: AppColors.white,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    isOnTrip ? 'END' : 'START',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
      ),
    );
  }
}
