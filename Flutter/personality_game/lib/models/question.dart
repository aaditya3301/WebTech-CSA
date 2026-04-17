import 'personality.dart';

class QuizQuestion {
  const QuizQuestion({
    required this.text,
    required this.options,
  });

  final String text;
  final List<QuizOption> options;
}

class QuizOption {
  const QuizOption({
    required this.id,
    required this.text,
    required this.type,
  });

  final String id;
  final String text;
  final PersonalityType type;
}
