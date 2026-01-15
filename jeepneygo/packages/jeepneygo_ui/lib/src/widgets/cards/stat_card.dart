import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';

/// Small stat card for dashboard displays
class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.title,
    required this.value,
    this.icon,
    this.trend,
    this.trendValue,
    this.backgroundColor,
    this.iconColor,
  });

  final String title;
  final String value;
  final IconData? icon;
  final TrendDirection? trend;
  final String? trendValue;
  final Color? backgroundColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null)
                Container(
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: (iconColor ?? AppColors.primary).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                  ),
                  child: Icon(
                    icon,
                    size: 20,
                    color: iconColor ?? AppColors.primary,
                  ),
                ),
              const Spacer(),
              if (trend != null && trendValue != null)
                _TrendBadge(trend: trend!, value: trendValue!),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                ),
          ),
        ],
      ),
    );
  }
}

enum TrendDirection { up, down, neutral }

class _TrendBadge extends StatelessWidget {
  const _TrendBadge({
    required this.trend,
    required this.value,
  });

  final TrendDirection trend;
  final String value;

  @override
  Widget build(BuildContext context) {
    final Color color;
    final IconData icon;

    switch (trend) {
      case TrendDirection.up:
        color = AppColors.success;
        icon = Icons.trending_up;
        break;
      case TrendDirection.down:
        color = AppColors.error;
        icon = Icons.trending_down;
        break;
      case TrendDirection.neutral:
        color = AppColors.textSecondary;
        icon = Icons.trending_flat;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: AppSpacing.xs),
          Text(
            value,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: color,
                ),
          ),
        ],
      ),
    );
  }
}
