import 'package:flutter/material.dart';

class FitnessTip {
  const FitnessTip({
    required this.id,
    required this.title,
    required this.shortText,
    required this.detailText,
    required this.icon,
    required this.color,
  });

  final String id;
  final String title;
  final String shortText;
  final String detailText;
  final IconData icon;
  final Color color;
}

const List<FitnessTip> fitnessTips = [
  FitnessTip(
    id: 'tip-1',
    title: 'Hydrate Well',
    shortText: 'Drink water regularly before and after workouts.',
    detailText:
        'Aim for steady hydration throughout the day. Before exercise, drink water and continue small sips during activity to support performance and recovery.',
    icon: Icons.water_drop_outlined,
    color: Color(0xFF2C8ED6),
  ),
  FitnessTip(
    id: 'tip-2',
    title: 'Warm Up First',
    shortText: 'Spend 5-10 minutes warming muscles before training.',
    detailText:
        'A proper warm-up increases blood flow and prepares joints for movement. Include dynamic stretches and low-intensity movement before harder sets.',
    icon: Icons.self_improvement_outlined,
    color: Color(0xFFEF6B5A),
  ),
  FitnessTip(
    id: 'tip-3',
    title: 'Sleep Better',
    shortText: 'Recovery and muscle growth improve with quality sleep.',
    detailText:
        'Try for 7-9 hours of sleep nightly. Consistent sleep schedule helps improve energy levels, mood, and overall training adaptation.',
    icon: Icons.nightlight_round,
    color: Color(0xFF6A67CE),
  ),
  FitnessTip(
    id: 'tip-4',
    title: 'Balanced Meals',
    shortText: 'Combine carbs, protein, and healthy fats daily.',
    detailText:
        'Include a balanced plate in each meal: lean protein for repair, complex carbs for energy, and healthy fats for hormone support and satiety.',
    icon: Icons.restaurant_menu_outlined,
    color: Color(0xFF1EA56B),
  ),
];
