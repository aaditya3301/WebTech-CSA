import 'package:flutter/material.dart';

import 'data/quiz_data.dart';
import 'models/personality.dart';
import 'screens/quiz_screen.dart';
import 'screens/result_screen.dart';
import 'screens/welcome_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const PersonalityQuizApp());
}

enum QuizStage { welcome, quiz, result }

class PersonalityQuizApp extends StatefulWidget {
  const PersonalityQuizApp({super.key});

  @override
  State<PersonalityQuizApp> createState() => _PersonalityQuizAppState();
}

class _PersonalityQuizAppState extends State<PersonalityQuizApp> {
  QuizStage _stage = QuizStage.welcome;
  int _currentQuestionIndex = 0;
  late List<PersonalityType?> _answers;
  PersonalityType? _result;

  @override
  void initState() {
    super.initState();
    _answers = List<PersonalityType?>.filled(quizQuestions.length, null);
  }

  void _startQuiz() {
    setState(() {
      _stage = QuizStage.quiz;
      _currentQuestionIndex = 0;
      _answers = List<PersonalityType?>.filled(quizQuestions.length, null);
      _result = null;
    });
  }

  void _handleBack() {
    if (_currentQuestionIndex == 0) {
      return;
    }

    setState(() {
      _currentQuestionIndex -= 1;
    });
  }

  void _handleAnswerSelected(PersonalityType selectedType) {
    setState(() {
      _answers[_currentQuestionIndex] = selectedType;

      if (_currentQuestionIndex == quizQuestions.length - 1) {
        _result = _calculateResult();
        _stage = QuizStage.result;
      } else {
        _currentQuestionIndex += 1;
      }
    });
  }

  void _restartQuiz() {
    setState(() {
      _stage = QuizStage.welcome;
      _currentQuestionIndex = 0;
      _answers = List<PersonalityType?>.filled(quizQuestions.length, null);
      _result = null;
    });
  }

  PersonalityType _calculateResult() {
    final counts = <PersonalityType, int>{
      for (final type in PersonalityType.values) type: 0,
    };

    for (final answer in _answers) {
      if (answer != null) {
        counts[answer] = (counts[answer] ?? 0) + 1;
      }
    }

    var winner = PersonalityType.thinker;
    var maxCount = -1;

    for (final type in PersonalityType.values) {
      final count = counts[type] ?? 0;
      if (count > maxCount) {
        maxCount = count;
        winner = type;
      }
    }

    return winner;
  }

  @override
  Widget build(BuildContext context) {
    Widget screen;

    switch (_stage) {
      case QuizStage.welcome:
        screen = WelcomeScreen(onStart: _startQuiz);
      case QuizStage.quiz:
        screen = QuizScreen(
          question: quizQuestions[_currentQuestionIndex],
          questionIndex: _currentQuestionIndex,
          totalQuestions: quizQuestions.length,
          selectedAnswer: _answers[_currentQuestionIndex],
          onBack: _handleBack,
          onSelectOption: _handleAnswerSelected,
        );
      case QuizStage.result:
        final profile = personalityProfiles[_result ?? PersonalityType.thinker]!;
        screen = ResultScreen(
          profile: profile,
          onRestart: _restartQuiz,
        );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personality Quiz',
      theme: AppTheme.darkTheme,
      home: screen,
    );
  }
}
