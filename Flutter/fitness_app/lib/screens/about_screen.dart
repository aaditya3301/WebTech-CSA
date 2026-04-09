import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const String routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About App')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 36,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.info_outline, color: AppColors.primary, size: 34),
                ),
                const SizedBox(height: 12),
                Text(
                  'Fitness Tracker & BMI Analyzer',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Designed to help you make fitness progress with clarity and consistency.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: const Color(0xE8FFFFFF)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const _AboutFeature(
            icon: Icons.monitor_weight_outlined,
            title: 'BMI Insights',
            subtitle: 'Instant BMI and category with clear validation.',
          ),
          const _AboutFeature(
            icon: Icons.directions_run_outlined,
            title: 'Activity Tracking',
            subtitle: 'Add, monitor, and complete daily activities easily.',
          ),
          const _AboutFeature(
            icon: Icons.lightbulb_outline,
            title: 'Fitness Tips',
            subtitle: 'Browse practical tips with engaging detail views.',
          ),
        ],
      ),
    );
  }
}

class _AboutFeature extends StatelessWidget {
  const _AboutFeature({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0x1A0B6E6E),
          child: Icon(icon, color: AppColors.primary),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
