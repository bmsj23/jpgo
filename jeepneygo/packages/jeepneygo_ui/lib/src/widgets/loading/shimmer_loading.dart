import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';

/// Shimmer loading placeholder
class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
  });

  final double? width;
  final double? height;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.surfaceVariant,
      highlightColor: AppColors.surface,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(borderRadius ?? AppSpacing.radiusSm),
        ),
      ),
    );
  }
}

/// Shimmer loading for list items
class ShimmerListItem extends StatelessWidget {
  const ShimmerListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        children: [
          const ShimmerLoading(
            width: 56,
            height: 56,
            borderRadius: AppSpacing.radiusSm,
          ),
          const SizedBox(width: AppSpacing.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerLoading(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 16,
                ),
                const SizedBox(height: AppSpacing.sm),
                ShimmerLoading(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Shimmer loading for cards
class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const ShimmerLoading(width: 44, height: 44),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerLoading(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 16,
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      ShimmerLoading(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            const ShimmerLoading(height: 40),
          ],
        ),
      ),
    );
  }
}
