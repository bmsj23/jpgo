import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';

/// Custom map controls widget
class MapControls extends StatelessWidget {
  const MapControls({
    super.key,
    this.onZoomIn,
    this.onZoomOut,
    this.onMyLocation,
    this.onRecenter,
    this.showRecenter = false,
  });

  final VoidCallback? onZoomIn;
  final VoidCallback? onZoomOut;
  final VoidCallback? onMyLocation;
  final VoidCallback? onRecenter;
  final bool showRecenter;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // My Location
        _MapControlButton(
          icon: Icons.my_location,
          onPressed: onMyLocation,
          tooltip: 'My Location',
        ),

        // Recenter (only when tracking)
        if (showRecenter) ...[
          const SizedBox(height: AppSpacing.sm),
          _MapControlButton(
            icon: Icons.gps_fixed,
            onPressed: onRecenter,
            tooltip: 'Recenter',
            color: AppColors.secondary,
          ),
        ],

        const SizedBox(height: AppSpacing.lg),

        // Zoom controls
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _MapControlButton(
                icon: Icons.add,
                onPressed: onZoomIn,
                tooltip: 'Zoom In',
                hasContainer: false,
              ),
              Container(
                height: 1,
                width: 24,
                color: AppColors.divider,
              ),
              _MapControlButton(
                icon: Icons.remove,
                onPressed: onZoomOut,
                tooltip: 'Zoom Out',
                hasContainer: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MapControlButton extends StatelessWidget {
  const _MapControlButton({
    required this.icon,
    this.onPressed,
    this.tooltip,
    this.color,
    this.hasContainer = true,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final Color? color;
  final bool hasContainer;

  @override
  Widget build(BuildContext context) {
    final button = Material(
      color: hasContainer ? AppColors.surface : Colors.transparent,
      borderRadius: hasContainer ? BorderRadius.circular(AppSpacing.radiusSm) : null,
      elevation: hasContainer ? 2 : 0,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        child: SizedBox(
          width: AppSpacing.mapButtonSize,
          height: AppSpacing.mapButtonSize,
          child: Icon(
            icon,
            color: color ?? AppColors.textPrimary,
            size: 24,
          ),
        ),
      ),
    );

    if (tooltip != null) {
      return Tooltip(
        message: tooltip!,
        child: button,
      );
    }

    return button;
  }
}
