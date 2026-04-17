import 'package:flutter/material.dart';

import '../models/personality.dart';
import '../models/question.dart';

List<QuizOption> _options({
  required String a,
  required String b,
  required String c,
  required String d,
}) {
  return [
    QuizOption(id: 'A', text: a, type: PersonalityType.thinker),
    QuizOption(id: 'B', text: b, type: PersonalityType.connector),
    QuizOption(id: 'C', text: c, type: PersonalityType.adventurer),
    QuizOption(id: 'D', text: d, type: PersonalityType.leader),
  ];
}

final quizQuestions = <QuizQuestion>[
  QuizQuestion(
    text: 'How do you prefer to spend your free time?',
    options: _options(
      a: 'Reading, thinking, or doing something alone',
      b: 'Hanging out with friends or family',
      c: 'Trying something new or adventurous',
      d: 'Planning goals or organizing tasks',
    ),
  ),
  QuizQuestion(
    text: 'When faced with a problem, you:',
    options: _options(
      a: 'Think deeply before acting',
      b: 'Ask others for advice',
      c: 'Jump in and try things out',
      d: 'Make a structured plan',
    ),
  ),
  QuizQuestion(
    text: 'In a group project, you are usually:',
    options: _options(
      a: 'The quiet thinker',
      b: 'The communicator',
      c: 'The energetic contributor',
      d: 'The leader / organizer',
    ),
  ),
  QuizQuestion(
    text: 'What motivates you most?',
    options: _options(
      a: 'Knowledge and understanding',
      b: 'Relationships and connection',
      c: 'Excitement and experiences',
      d: 'Achievement and success',
    ),
  ),
  QuizQuestion(
    text: 'How do you make decisions?',
    options: _options(
      a: 'Carefully and logically',
      b: 'Based on feelings and people',
      c: 'Quickly and instinctively',
      d: 'Strategically and practically',
    ),
  ),
  QuizQuestion(
    text: 'Your ideal weekend is:',
    options: _options(
      a: 'Calm and peaceful',
      b: 'Social and fun',
      c: 'Adventurous and spontaneous',
      d: 'Productive and planned',
    ),
  ),
  QuizQuestion(
    text: 'How do you handle stress?',
    options: _options(
      a: 'Withdraw and reflect',
      b: 'Talk it out with someone',
      c: 'Distract yourself with activities',
      d: 'Tackle it step-by-step',
    ),
  ),
  QuizQuestion(
    text: 'Which describes you best?',
    options: _options(
      a: 'Thoughtful',
      b: 'Friendly',
      c: 'Energetic',
      d: 'Organized',
    ),
  ),
  QuizQuestion(
    text: 'What role do you play among friends?',
    options: _options(
      a: 'The listener',
      b: 'The supporter',
      c: 'The entertainer',
      d: 'The planner',
    ),
  ),
  QuizQuestion(
    text: 'Your biggest strength is:',
    options: _options(
      a: 'Intelligence',
      b: 'Empathy',
      c: 'Courage',
      d: 'Discipline',
    ),
  ),
];

final personalityProfiles = <PersonalityType, PersonalityProfile>{
  PersonalityType.thinker: const PersonalityProfile(
    type: PersonalityType.thinker,
    title: 'The Thinker',
    emoji: '🧠',
    tagline: 'You find clarity in quiet moments.',
    description:
        'You prefer to understand the world before acting in it — observing, analyzing, and thinking through every angle. Your ideas are considered, grounded, and surprisingly original.',
    traits: ['Deep thinker', 'Independent', 'Logical', 'Curious'],
    gradientColors: [Color(0xFF4F46E5), Color(0xFF8B5CF6)],
  ),
  PersonalityType.connector: const PersonalityProfile(
    type: PersonalityType.connector,
    title: 'The Connector',
    emoji: '💖',
    tagline: 'People are your compass.',
    description:
        'You notice emotions others miss, build trust easily, and make the people around you feel seen. Relationships are where you draw your energy and offer your greatest strength.',
    traits: ['Empathetic', 'Supportive', 'Communicative', 'Warm'],
    gradientColors: [Color(0xFFEC4899), Color(0xFFF472B6)],
  ),
  PersonalityType.adventurer: const PersonalityProfile(
    type: PersonalityType.adventurer,
    title: 'The Adventurer',
    emoji: '🔥',
    tagline: 'You live in motion.',
    description:
        'New experiences, new places, new ideas — you say yes first and figure it out as you go. Your courage is contagious and you remind everyone around you what it feels like to be alive.',
    traits: ['Spontaneous', 'Energetic', 'Fearless', 'Playful'],
    gradientColors: [Color(0xFFF97316), Color(0xFFFBBF24)],
  ),
  PersonalityType.leader: const PersonalityProfile(
    type: PersonalityType.leader,
    title: 'The Leader',
    emoji: '👑',
    tagline: 'You turn vision into plans.',
    description:
        'You see the end state before others see the starting line. Structured, strategic, and relentless in execution — you do not just set goals, you deliver on them.',
    traits: ['Organized', 'Strategic', 'Disciplined', 'Decisive'],
    gradientColors: [Color(0xFF7C3AED), Color(0xFFD946EF)],
  ),
};
