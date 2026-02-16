import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const FlappyBirdGame());
}

class FlappyBirdGame extends StatelessWidget {
  const FlappyBirdGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flappy Bird',
      home: const GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  static double birdYAxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = birdYAxis;
  bool gameHasStarted = false;

  static double barrierXOne = 1;
  double barrierXTwo = barrierXOne + 1.5;

  static List<double> barrierX = [barrierXOne, 2.5];
  static double barrierWidth = 0.5;
  List<List<double>> barrierHeight = [
    [0.6, 0.4],
    [0.4, 0.6],
  ];

  int score = 0;
  int bestScore = 0;

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdYAxis;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(const Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        birdYAxis = initialHeight - height;
      });

      setState(() {
        if (barrierX[0] < -1.1) {
          barrierX[0] += 2.2;
          score++;
        } else {
          barrierX[0] -= 0.05;
        }
      });

      setState(() {
        if (barrierX[1] < -1.1) {
          barrierX[1] += 2.2;
          score++;
        } else {
          barrierX[1] -= 0.05;
        }
      });

      if (birdYAxis > 1) {
        timer.cancel();
        gameHasStarted = false;
        _showScore();
      }

      if (birdIsDead()) {
        timer.cancel();
        gameHasStarted = false;
        _showScore();
      }
    });
  }

  void resetGame() {
    Navigator.pop(context);
    setState(() {
      birdYAxis = 0;
      gameHasStarted = false;
      time = 0;
      initialHeight = birdYAxis;
      barrierX = [1, 2.5];
      if (score > bestScore) {
        bestScore = score;
      }
      score = 0;
    });
  }

  void _showScore() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.brown,
          title: const Center(
            child: Text(
              "GAME OVER",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Score: $score",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text(
                "Best: $bestScore",
                style: const TextStyle(color: Colors.white70, fontSize: 18),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text(
                "PLAY AGAIN",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () {
                resetGame();
              },
            )
          ],
        );
      },
    );
  }

  bool birdIsDead() {
    for (int i = 0; i < barrierX.length; i++) {
      if (barrierX[i] <= 0.05 &&
          barrierX[i] + barrierWidth >= -0.05 &&
          (birdYAxis <= -1 + barrierHeight[i][0] ||
              birdYAxis + 0.1 >= 1 - barrierHeight[i][1])) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gameHasStarted) {
          jump();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  AnimatedContainer(
                    alignment: Alignment(0, birdYAxis),
                    duration: const Duration(milliseconds: 0),
                    color: Colors.blue,
                    child: MyBird(),
                  ),
                  Container(
                    alignment: const Alignment(0, -0.3),
                    child: gameHasStarted
                        ? const Text("")
                        : const Text(
                            "T A P  T O  P L A Y",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                  ),
                  MyBarrier(
                    barrierX: barrierX[0],
                    barrierWidth: barrierWidth,
                    barrierHeight: barrierHeight[0][0],
                    isThisBottomBarrier: false,
                  ),
                  MyBarrier(
                    barrierX: barrierX[0],
                    barrierWidth: barrierWidth,
                    barrierHeight: barrierHeight[0][1],
                    isThisBottomBarrier: true,
                  ),
                  MyBarrier(
                    barrierX: barrierX[1],
                    barrierWidth: barrierWidth,
                    barrierHeight: barrierHeight[1][0],
                    isThisBottomBarrier: false,
                  ),
                  MyBarrier(
                    barrierX: barrierX[1],
                    barrierWidth: barrierWidth,
                    barrierHeight: barrierHeight[1][1],
                    isThisBottomBarrier: true,
                  ),
                ],
              ),
            ),
            Container(
              height: 15,
              color: Colors.green,
            ),
            Expanded(
              child: Container(
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "SCORE",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "$score",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 35),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "BEST",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "$bestScore",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 35),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyBird extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      child: Image.asset('assets/bird.png', errorBuilder: (context, error, stack) {
        return Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.yellow,
          ),
          child: const Center(
            child: Text(
              '🐦',
              style: TextStyle(fontSize: 40),
            ),
          ),
        );
      }),
    );
  }
}

class MyBarrier extends StatelessWidget {
  final double barrierWidth;
  final double barrierHeight;
  final double barrierX;
  final bool isThisBottomBarrier;

  MyBarrier({
    required this.barrierHeight,
    required this.barrierWidth,
    required this.barrierX,
    required this.isThisBottomBarrier,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(
          barrierX, isThisBottomBarrier ? 1 : -1),
      child: Container(
        width: MediaQuery.of(context).size.width * barrierWidth / 2,
        height: MediaQuery.of(context).size.height * 3 / 4 * barrierHeight / 2,
        decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(width: 10, color: Colors.green[800]!),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
