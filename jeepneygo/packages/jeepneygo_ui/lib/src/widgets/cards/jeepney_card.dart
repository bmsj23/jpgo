import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';

/// Card displaying a jeepney's real-time info (for commuter app)
class JeepneyCard extends StatelessWidget {
  const JeepneyCard({
    super.key,
    required this.plateNumber,
    required this.routeName,
    required this.currentPassengers,
    required this.capacity,
    this.etaMinutes,
    this.nextStop,
    this.lastUpdated,
    this.onTap,
    this.onTrack,
  });

  final String plateNumber;
  final String routeName;
  final int currentPassengers;
  final int capacity;
  final int? etaMinutes;
  final String? nextStop;
  final DateTime? lastUpdated;
  final VoidCallback? onTap;
  final VoidCallback? onTrack;

  Color get _capacityColor {
    final percentage = currentPassengers / capacity;
    if (percentage <= 0.5) return AppColors.capacityLow;
    if (percentage <= 0.8) return AppColors.capacityMedium;
    return AppColors.capacityHigh;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.cardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row
              Row(
                children: [
                  // Jeepney icon
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                    ),
                    child: const Icon(
                      Icons.directions_bus,
                      color: AppColors.primary,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),

                  // Plate and route
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          plateNumber,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          routeName,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.textSecondary,
                              ),
                        ),
                      ],
                    ),
                  ),

                  // Track button
                  if (onTrack != null)
                    IconButton(
                      onPressed: onTrack,
                      icon: const Icon(Icons.gps_fixed),
                      color: AppColors.secondary,
                    ),
                ],
              ),

              const SizedBox(height: AppSpacing.md),
              const Divider(),
              const SizedBox(height: AppSpacing.md),

              // Stats row
              Row(
                children: [
                  // Capacity
                  Expanded(
                    child: _StatItem(
                      icon: Icons.people,
                      label: 'Capacity',
                      value: '$currentPassengers/$capacity',
                      valueColor: _capacityColor,
                    ),
                  ),

                  // ETA
                  if (etaMinutes != null && nextStop != null)
                    Expanded(
                      child: _StatItem(
                        icon: Icons.access_time,
                        label: nextStop!,
                        value: '$etaMinutes min',
                        valueColor: AppColors.secondary,
                      ),
                    ),
                ],
              ),

              // Last updated
              if (lastUpdated != null) ...[
                const SizedBox(height: AppSpacing.md),
                Text(
                  'Updated ${_formatTime(lastUpdated!)}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textHint,
                      ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    final diff = DateTime.now().difference(time);
    if (diff.inSeconds < 60) return 'just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    return '${diff.inHours}h ago';
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.textSecondary),
        const SizedBox(width: AppSpacing.sm),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: valueColor,
                  ),
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
