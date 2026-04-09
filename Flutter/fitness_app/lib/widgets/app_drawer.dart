import 'package:flutter/material.dart';

import '../screens/about_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/settings_screen.dart';
import '../theme/app_theme.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void _navigate(BuildContext context, String routeName) {
    Navigator.pop(context);
    Navigator.pushNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(14),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.fitness_center, color: AppColors.primary),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Fitness User',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'fit.user@example.com',
                    style: TextStyle(color: Color(0xD7FFFFFF), fontSize: 13),
                  ),
                ],
              ),
            ),
            _DrawerItem(
              icon: Icons.person_outline,
              title: const Text('Profile'),
              onTap: () => _navigate(context, ProfileScreen.routeName),
            ),
            _DrawerItem(
              icon: Icons.settings_outlined,
              title: const Text('Settings'),
              onTap: () => _navigate(context, SettingsScreen.routeName),
            ),
            _DrawerItem(
              icon: Icons.info_outline,
              title: const Text('About App'),
              onTap: () => _navigate(context, AboutScreen.routeName),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                'Train smart. Stay consistent.',
                style: TextStyle(color: Color(0xFF7E9B9B), fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final Widget title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        leading: Icon(icon, color: AppColors.primary),
        title: title,
        onTap: onTap,
      ),
    );
  }
}
