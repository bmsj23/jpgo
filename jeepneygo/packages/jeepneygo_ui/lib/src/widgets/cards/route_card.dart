import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';

/// Card displaying a jeepney route
class RouteCard extends StatelessWidget {
  const RouteCard({
    super.key,
    required this.routeName,
    required this.shortName,
    required this.startPoint,
    required this.endPoint,
    required this.activeJeepneys,
    this.routeColor,
    this.onTap,
    this.isSelected = false,
  });

  final String routeName;
  final String shortName;
  final String startPoint;
  final String endPoint;
  final int activeJeepneys;
  final Color? routeColor;
  final VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final color = routeColor ?? AppColors.primary;

    return Card(
      elevation: isSelected ? 4 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        side: isSelected
            ? BorderSide(color: color, width: 2)
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.cardPadding),
          child: Row(
            children: [
              // Route badge
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),
                child: Center(
                  child: Text(
                    shortName,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: color,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.lg),

              // Route details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      routeName,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      '$startPoint → $endPoint',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              // Active count
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: activeJeepneys > 0
                      ? AppColors.successLight
                      : AppColors.surfaceVariant,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.directions_bus,
                      size: 16,
                      color: activeJeepneys > 0
                          ? AppColors.success
                          : AppColors.textSecondary,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      '$activeJeepneys',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: activeJeepneys > 0
                                ? AppColors.success
                                : AppColors.textSecondary,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
