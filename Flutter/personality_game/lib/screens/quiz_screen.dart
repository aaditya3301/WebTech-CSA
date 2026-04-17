import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/personality.dart';
import '../models/question.dart';
import '../theme/app_theme.dart';
import '../widgets/gradient_background.dart';
import '../widgets/option_card.dart';
import '../widgets/progress_bar.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    super.key,
    required this.question,
    required this.questionIndex,
    required this.totalQuestions,
    required this.selectedAnswer,
    required this.onBack,
    required this.onSelectOption,
  });

  final QuizQuestion question;
  final int questionIndex;
  final int totalQuestions;
  final PersonalityType? selectedAnswer;
  final VoidCallback onBack;
  final ValueChanged<PersonalityType> onSelectOption;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  bool _isTransitioning = false;

  Future<void> _handleSelect(PersonalityType type) async {
    if (_isTransitioning) {
      return;
    }

    _isTransitioning = true;
    await Future<void>.delayed(const Duration(milliseconds: 250));

    if (!mounted) {
      return;
    }

    widget.onSelectOption(type);
    _isTransitioning = false;
  }

  @override
  Widget build(BuildContext context) {
    final progress = (widget.questionIndex + 1) / widget.totalQuestions;
    final percentage = (progress * 100).round();

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Column(
              children: [
                Row(
                  children: [
                    _BackButton(
                      enabled: widget.questionIndex > 0,
                      onTap: widget.onBack,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Question ${widget.questionIndex + 1} of ${widget.totalQuestions}',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: AppColors.textMuted,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: 40,
                      child: Text(
                        '$percentage%',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.inter(
                          color: AppColors.accentPink,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                ProgressBar(progress: progress),
                const SizedBox(height: 24),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 350),
                          switchInCurve: Curves.easeOutCubic,
                          switchOutCurve: Curves.easeOutCubic,
                          transitionBuilder: (child, animation) {
                            final curved = CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeOutCubic,
                            );
                            return FadeTransition(
                              opacity: curved,
                              child: SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0.15, 0),
                                  end: Offset.zero,
                                ).animate(curved),
                                child: child,
                              ),
                            );
                          },
                          child: _QuestionCard(
                            key: ValueKey<int>(widget.questionIndex),
                            questionNumber: widget.questionIndex + 1,
                            questionText: widget.question.text,
                          ),
                        ),
                        const SizedBox(height: 24),
                        for (var i = 0; i < widget.question.options.length; i++) ...[
                          OptionCard(
                            letter: widget.question.options[i].id,
                            text: widget.question.options[i].text,
                            selected:
                                widget.question.options[i].type == widget.selectedAnswer,
                            onTap: () => _handleSelect(widget.question.options[i].type),
                          ),
                          if (i != widget.question.options.length - 1)
                            const SizedBox(height: 16),
                        ],
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({
    required this.enabled,
    required this.onTap,
  });

  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 180),
        opacity: enabled ? 1 : 0.45,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.cardGlass,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.cardBorder),
          ),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}

class _QuestionCard extends StatelessWidget {
  const _QuestionCard({
    super.key,
    required this.questionNumber,
    required this.questionText,
  });

  final int questionNumber;
  final String questionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.cardGlass,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 28,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              gradient: const LinearGradient(colors: AppColors.accentGradient),
            ),
            alignment: Alignment.center,
            child: Text(
              'Q$questionNumber',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            questionText,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.w700,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}
