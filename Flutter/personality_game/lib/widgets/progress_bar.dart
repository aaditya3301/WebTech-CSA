import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.progress,
  });

  final double progress;

  @override
  Widget build(BuildContext context) {
    final safeProgress = progress.clamp(0, 1).toDouble();

    return LayoutBuilder(
      builder: (context, constraints) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: Stack(
            children: [
              Container(height: 6, color: AppColors.cardBorder),
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutCubic,
                width: constraints.maxWidth * safeProgress,
                height: 6,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: AppColors.accentGradient),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
