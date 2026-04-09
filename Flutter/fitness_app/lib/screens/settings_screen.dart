import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const String routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFE1ECEB)),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0x1A0B6E6E),
                  child: Icon(Icons.settings_outlined, color: AppColors.primary),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Customize reminders, notifications, and preferences.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const _SettingTile(
            icon: Icons.notifications_active_outlined,
            title: 'Workout Reminders',
            subtitle: 'Daily at 7:00 PM',
          ),
          const _SettingTile(
            icon: Icons.straighten_outlined,
            title: 'Preferred Units',
            subtitle: 'Metric (kg / cm)',
          ),
          const _SettingTile(
            icon: Icons.palette_outlined,
            title: 'Theme Style',
            subtitle: 'Professional Light',
          ),
        ],
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  const _SettingTile({
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
