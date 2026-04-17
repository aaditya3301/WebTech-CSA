import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_theme.dart';

class OptionCard extends StatefulWidget {
  const OptionCard({
    super.key,
    required this.letter,
    required this.text,
    required this.onTap,
    this.selected = false,
  });

  final String letter;
  final String text;
  final VoidCallback onTap;
  final bool selected;

  @override
  State<OptionCard> createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  bool _pressed = false;
  bool _isRunningTapAnimation = false;

  Future<void> _handleTap() async {
    if (_isRunningTapAnimation) {
      return;
    }

    _isRunningTapAnimation = true;
    setState(() {
      _pressed = true;
    });

    HapticFeedback.selectionClick();
    await Future<void>.delayed(const Duration(milliseconds: 100));

    if (!mounted) {
      return;
    }

    setState(() {
      _pressed = false;
    });

    await Future<void>.delayed(const Duration(milliseconds: 150));
    _isRunningTapAnimation = false;
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = widget.selected ? AppColors.accentPink : AppColors.cardBorder;
    final backgroundColor = widget.selected ? const Color(0x26FFFFFF) : AppColors.cardGlass;

    return AnimatedScale(
      duration: const Duration(milliseconds: 100),
      scale: _pressed ? 1.02 : 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: _handleTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOutCubic,
          height: 72,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: borderColor, width: widget.selected ? 2 : 1.5),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: AppColors.accentGradient),
                ),
                alignment: Alignment.center,
                child: Text(
                  widget.letter,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  widget.text,
                  style: GoogleFonts.inter(
                    color: AppColors.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
