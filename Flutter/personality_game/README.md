# 🎭 Personality Quiz — Flutter App

> A beautifully designed personality quiz that reveals which of **4 archetypes** you are: **Thinker 🧠**, **Connector 💖**, **Adventurer 🔥**, or **Leader 👑**.

Built from a 10-question quiz. Smooth gradient UI, animated transitions, and a themed result screen unique to each personality type.

---

## ✨ Features

- 10 thoughtful personality questions with 4 options each
- Animated question transitions (slide + fade)
- Live progress bar that fills as you advance
- Tap-to-select option cards with haptic-style feedback
- Back button to revise previous answers
- Result screen themed to the winning personality (unique color + gradient + emoji + traits)
- Tie-breaking: earliest dominant type wins in order A → B → C → D
- "Take again" restart flow
- Fully responsive (phone + tablet)
- No backend — pure Flutter, stateless, offline-ready

---

## 🧱 Tech Stack

| Layer | Choice |
|---|---|
| Framework | Flutter 3.10+ / Dart 3 |
| State mgmt | Plain `StatefulWidget` (no Provider/Riverpod needed — it's small) |
| Typography | `google_fonts` (Poppins for headers, Inter for body) |
| Icons | Material Icons + emoji |
| Animations | Built-in `AnimatedSwitcher`, `TweenAnimationBuilder`, `AnimatedContainer` |
| Storage | None — quiz state lives in memory only |

**Only dependency** beyond Flutter itself: `google_fonts: ^6.2.1`

---

## 📁 Project Structure

```
personality_quiz/
├── pubspec.yaml
├── README.md
└── lib/
    ├── main.dart                    # App entry + MaterialApp theme
    ├── models/
    │   ├── question.dart            # Question + Option classes
    │   └── personality.dart         # Personality archetype class
    ├── data/
    │   └── quiz_data.dart           # All 10 questions + 4 personality profiles
    ├── screens/
    │   ├── welcome_screen.dart      # Landing screen with "Start" CTA
    │   ├── quiz_screen.dart         # Question flow with animations
    │   └── result_screen.dart       # Themed reveal screen
    └── widgets/
        ├── option_card.dart         # Tappable A/B/C/D card
        ├── progress_bar.dart        # Animated fill bar
        └── gradient_background.dart # Reusable gradient scaffold bg
```

---

## 📝 Quiz Content

All 10 questions. **Answer mapping:** A = Thinker, B = Connector, C = Adventurer, D = Leader.

<details>
<summary><b>Click to expand all 10 questions</b></summary>

### 1. How do you prefer to spend your free time?
- A. Reading, thinking, or doing something alone
- B. Hanging out with friends or family
- C. Trying something new or adventurous
- D. Planning goals or organizing tasks

### 2. When faced with a problem, you:
- A. Think deeply before acting
- B. Ask others for advice
- C. Jump in and try things out
- D. Make a structured plan

### 3. In a group project, you are usually:
- A. The quiet thinker
- B. The communicator
- C. The energetic contributor
- D. The leader / organizer

### 4. What motivates you most?
- A. Knowledge and understanding
- B. Relationships and connection
- C. Excitement and experiences
- D. Achievement and success

### 5. How do you make decisions?
- A. Carefully and logically
- B. Based on feelings and people
- C. Quickly and instinctively
- D. Strategically and practically

### 6. Your ideal weekend is:
- A. Calm and peaceful
- B. Social and fun
- C. Adventurous and spontaneous
- D. Productive and planned

### 7. How do you handle stress?
- A. Withdraw and reflect
- B. Talk it out with someone
- C. Distract yourself with activities
- D. Tackle it step-by-step

### 8. Which describes you best?
- A. Thoughtful
- B. Friendly
- C. Energetic
- D. Organized

### 9. What role do you play among friends?
- A. The listener
- B. The supporter
- C. The entertainer
- D. The planner

### 10. Your biggest strength is:
- A. Intelligence
- B. Empathy
- C. Courage
- D. Discipline

</details>

---

## 🧮 Scoring Logic

Tally the count of each type across all 10 answers. The type with the highest count is the result. If there's a tie, pick the earliest in order: **Thinker → Connector → Adventurer → Leader**.

```dart
String calculateResult(List<String> answers) {
  final counts = <String, int>{
    'Thinker': 0, 'Connector': 0, 'Adventurer': 0, 'Leader': 0,
  };
  for (final type in answers) {
    counts[type] = (counts[type] ?? 0) + 1;
  }

  // Tie-breaker order matches map insertion order above.
  String winner = 'Thinker';
  int max = -1;
  counts.forEach((type, count) {
    if (count > max) { max = count; winner = type; }
  });
  return winner;
}
```

---

## 🎭 The Four Personalities

| Type | Emoji | Tagline | Color Theme |
|---|---|---|---|
| **Thinker** | 🧠 | Reflective • Analytical • Insightful | Indigo → Violet |
| **Connector** | 💖 | Warm • Empathetic • Social | Pink → Rose |
| **Adventurer** | 🔥 | Bold • Spontaneous • Energetic | Orange → Amber |
| **Leader** | 👑 | Driven • Strategic • Decisive | Deep Purple → Magenta |

### Descriptions (use on result screen)

**🧠 The Thinker** — *"You find clarity in quiet moments."*
You prefer to understand the world before acting in it — observing, analyzing, and thinking through every angle. Your ideas are considered, grounded, and surprisingly original.
**Traits:** Deep thinker · Independent · Logical · Curious

**💖 The Connector** — *"People are your compass."*
You notice emotions others miss, build trust easily, and make the people around you feel seen. Relationships are where you draw your energy and offer your greatest strength.
**Traits:** Empathetic · Supportive · Communicative · Warm

**🔥 The Adventurer** — *"You live in motion."*
New experiences, new places, new ideas — you say yes first and figure it out as you go. Your courage is contagious and you remind everyone around you what it feels like to be alive.
**Traits:** Spontaneous · Energetic · Fearless · Playful

**👑 The Leader** — *"You turn vision into plans."*
You see the end state before others see the starting line. Structured, strategic, and relentless in execution — you don't just set goals, you deliver on them.
**Traits:** Organized · Strategic · Disciplined · Decisive

---

## 🎨 UI / UX Design Guide

The look is **modern, gradient-heavy, and glassy** — think premium onboarding app, not textbook quiz.

### Global palette

```dart
// Background (every screen)
const bgGradientStart = Color(0xFF0F0C29);  // near-black indigo
const bgGradientMid   = Color(0xFF302B63);  // deep purple
const bgGradientEnd   = Color(0xFF24243E);  // midnight

// Accents
const accentPurple = Color(0xFF8B5CF6);
const accentPink   = Color(0xFFEC4899);
const textPrimary  = Color(0xFFF8FAFC);
const textMuted    = Color(0xB3FFFFFF);     // 70% white
const cardGlass    = Color(0x1AFFFFFF);     // 10% white (frosted cards)
const cardBorder   = Color(0x33FFFFFF);     // 20% white
```

### Personality-specific gradients (result screen)

```dart
Thinker:    [Color(0xFF4F46E5), Color(0xFF8B5CF6)]  // indigo → violet
Connector:  [Color(0xFFEC4899), Color(0xFFF472B6)]  // pink → rose
Adventurer: [Color(0xFFF97316), Color(0xFFFBBF24)]  // orange → amber
Leader:     [Color(0xFF7C3AED), Color(0xFFD946EF)]  // purple → magenta
```

### Typography

```dart
import 'package:google_fonts/google_fonts.dart';

// Headers: Poppins (bold, geometric)
GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.w800)

// Body / options: Inter (highly readable)
GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500)
```

| Element | Size | Weight |
|---|---|---|
| Screen title | 32 | 800 |
| Question text | 22–24 | 700 |
| Option text | 16 | 500 |
| Result title | 40 | 800 |
| Tagline / meta | 14 | 500 |

### Screens — detailed design

#### 1. Welcome screen
- Full-screen gradient background (top-to-bottom: `0F0C29 → 302B63 → 24243E`)
- Centered column:
  - Big emoji `🎭` (80px) with a subtle scale pulse animation (1.0 ↔ 1.05, 2s loop)
  - Title: **"Discover Your Type"** — Poppins 36, white, 800 weight
  - Subtitle: *"A 10-question journey into who you really are."* — Inter 16, 70% white
  - 40px spacer
  - **Start button**: full-width (minus 32px margin), 60px tall, pill-shaped (`BorderRadius.circular(30)`), gradient fill (`accentPurple → accentPink`), white text "Begin Quiz →", with soft purple glow shadow (`blurRadius: 20, color: accentPurple.withOpacity(0.4)`)
  - Small footnote at bottom: *"No right or wrong answers. Be spontaneous — go with your first instinct."* — Inter 12, 50% white, centered

#### 2. Quiz screen
- Same gradient background
- **Top bar (SafeArea padding)**:
  - Left: circular back button (frosted glass style)
  - Center: "Question N of 10" — Inter 14, muted
  - Right: percentage e.g. "30%" — Inter 14, accent pink
- **Progress bar** directly below — 6px tall, rounded, bg = `cardBorder`, fill = gradient `accentPurple → accentPink`, animates width with `AnimatedContainer` (400ms `Curves.easeOutCubic`)
- **Question card** (centered, `margin: 24, padding: 28`):
  - Glassmorphism: `cardGlass` bg, 1px `cardBorder` border, `BorderRadius.circular(24)`
  - Small pill tag above question showing "Q{N}" (20px tall, accent gradient bg)
  - Question text — Poppins 22, 700 weight, line-height 1.35
- **Option cards** (4 stacked, 16px gap between):
  - Each: 72px tall, `BorderRadius.circular(20)`, `cardGlass` bg, 1.5px `cardBorder` border
  - Left: circular letter badge (44px, gradient fill, white bold letter "A"/"B"/"C"/"D")
  - Right: option text — Inter 15, 500 weight, white
  - **On tap**: border brightens to `accentPink`, bg lightens to `0x26FFFFFF`, subtle 1.02x scale (100ms), then auto-advance to next question after 250ms
- **Animated transitions between questions**: `AnimatedSwitcher` with `SlideTransition` (new question slides in from right, old slides out to left) combined with `FadeTransition`. Duration 350ms, curve `Curves.easeOutCubic`.

#### 3. Result screen
- **Background switches** to the winning personality's gradient (top→bottom)
- Content fades + scales in on mount (`TweenAnimationBuilder`, 600ms, curve `easeOutBack`)
- Layout:
  - Emoji (120px, drop shadow) — scales from 0 to 1 with a bounce
  - Meta label: *"You are…"* — Inter 14, 70% white, letter-spacing 2
  - Big title: **"The Thinker"** — Poppins 44, 800, white
  - Tagline pill: small rounded chip with `0x33FFFFFF` bg, contains tagline text in Inter 13
  - 24px spacer
  - Description card: glass card (`0x1A000000` bg for contrast on bright gradients), Inter 15 white, 1.6 line-height, 20px padding
  - **Traits row**: 4 chips in a wrap layout, each trait as a pill (`0x33FFFFFF` bg, 12px horizontal padding, 6px vertical, Inter 13 white 600)
  - 32px spacer
  - **"Take Quiz Again"** button: outlined white button, full-width minus 32px margin, 56px tall, pill shape, Inter 16 600
  - Small **"Share Result"** text button below (optional, can launch share sheet later)

### Animation checklist

- ✅ Welcome emoji pulse (infinite)
- ✅ Start button gradient shimmer on idle (optional polish)
- ✅ Progress bar fill animation (400ms cubic)
- ✅ Question swap slide+fade (350ms cubic)
- ✅ Option tap scale (1.0 → 1.02 → 1.0, 100ms)
- ✅ Result emoji bounce-in (600ms, easeOutBack)
- ✅ Result content staggered fade-in (emoji → title → description → button, 100ms apart)

### Spacing system

Use multiples of 4: `4, 8, 12, 16, 20, 24, 28, 32`. Never random values. Page horizontal padding = **24**. Card inner padding = **24 or 28**.

---

## ⚙️ Setup & Run

### 1. Create the Flutter project
```bash
flutter create personality_quiz
cd personality_quiz
```

### 2. Replace `pubspec.yaml` dependencies section with:
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.6
  google_fonts: ^6.2.1
```

### 3. Install packages
```bash
flutter pub get
```

### 4. Create the folder structure shown above, then paste in each file (use this README's code + design spec).

### 5. Run
```bash
flutter run                # connected device or emulator
flutter run -d chrome      # web
flutter run -d macos       # desktop
```

### 6. Build release APK
```bash
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

---

## 🧪 Testing checklist

Before you ship, verify:
- [ ] All 10 questions render, 4 options each
- [ ] Back button returns to previous question and preserves previous answers
- [ ] Progress bar fills to exactly 100% on the last question
- [ ] Tallying is correct — try answering all A's → Thinker, all B's → Connector, etc.
- [ ] Tie case: 5 A's + 5 B's → should return **Thinker** (earliest in order)
- [ ] Result gradient matches winning type
- [ ] "Take Quiz Again" resets all state and returns to welcome
- [ ] No overflow on smaller phones (test on 360px width)

---

## 🚀 Extension ideas (if you want to flex)

- **Persist history** with `shared_preferences` — show "your last 3 results"
- **Share as image** — wrap result card in `RepaintBoundary`, capture with `toImage()`, share via `share_plus`
- **Sound feedback** — subtle tap tick with `flutter_soloud` or `just_audio`
- **Hindi / English toggle** in welcome screen — keep quiz content bilingual
- **Detailed score breakdown** on result — show percentage split across all 4 types with mini bar chart
- **Firebase analytics** — track which questions people skip / back out on
- **Dark/light theme toggle** — currently dark-only; add a light variant

---

## 📜 Credits

- Quiz content adapted from the *"Let's Check I"* personality deck.
- Design language: glassmorphism + gradient-heavy modern mobile UI.
- Fonts: [Poppins](https://fonts.google.com/specimen/Poppins), [Inter](https://fonts.google.com/specimen/Inter).

---

**Built with 💜 in Flutter.**