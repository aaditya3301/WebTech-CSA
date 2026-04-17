import 'package:flutter/material.dart';

enum PersonalityType { thinker, connector, adventurer, leader }

class PersonalityProfile {
  const PersonalityProfile({
    required this.type,
    required this.title,
    required this.emoji,
    required this.tagline,
    required this.description,
    required this.traits,
    required this.gradientColors,
  });

  final PersonalityType type;
  final String title;
  final String emoji;
  final String tagline;
  final String description;
  final List<String> traits;
  final List<Color> gradientColors;
}
