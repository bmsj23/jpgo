import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeepneygo_ui/jeepneygo_ui.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // set preferred orientations (portrait only for commuter app)
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  // initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const ProviderScope(child: CommuterApp()));
}

class CommuterApp extends StatelessWidget {
  const CommuterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JeepneyGo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const CommuterHomeScreen(),
    );
  }
}

/// Temporary home screen - will be replaced with proper routing
class CommuterHomeScreen extends StatelessWidget {
  const CommuterHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map placeholder
          Container(
            color: AppColors.surfaceVariant,
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.map_outlined,
                    size: 64,
                    color: AppColors.textHint,
                  ),
                  SizedBox(height: AppSpacing.lg),
                  Text(
                    'Map will appear here',
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
          ),
          
          // Top bar with search
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search routes or stops...',
                    prefixIcon: const Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.lg,
                      vertical: AppSpacing.lg,
                    ),
                  ),
                  readOnly: true,
                  onTap: () {
                    // TODO: Open search screen
                  },
                ),
              ),
            ),
          ),
          
          // Bottom sheet with routes
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppSpacing.radiusXl),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Drag handle
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.divider,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  
                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.lg,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Active Jeepneys',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        TextButton(
                          onPressed: () {
                            // TODO: View all routes
                          },
                          child: const Text('View All'),
                        ),
                      ],
                    ),
                  ),
                  
                  // Route cards preview
                  Padding(
                    padding: const EdgeInsets.only(
                      left: AppSpacing.lg,
                      right: AppSpacing.lg,
                      bottom: AppSpacing.xl,
                    ),
                    child: Column(
                      children: [
                        RouteCard(
                          routeName: 'Lipa City - SM City Lipa',
                          shortName: 'SM',
                          startPoint: 'Lipa City Proper',
                          endPoint: 'SM City Lipa',
                          activeJeepneys: 5,
                          onTap: () {
                            // TODO: Navigate to route detail
                          },
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        RouteCard(
                          routeName: 'Lipa City - Tambo',
                          shortName: 'TMB',
                          startPoint: 'Lipa City Proper',
                          endPoint: 'Tambo',
                          activeJeepneys: 3,
                          onTap: () {
                            // TODO: Navigate to route detail
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Map controls
          Positioned(
            right: AppSpacing.lg,
            bottom: 280,
            child: MapControls(
              onMyLocation: () {
                // TODO: Center on user location
              },
              onZoomIn: () {
                // TODO: Zoom in
              },
              onZoomOut: () {
                // TODO: Zoom out
              },
            ),
          ),
        ],
      ),
    );
  }
}
