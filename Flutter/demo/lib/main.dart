import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TicTacToeScreen(),
    );
  }
}

class TicTacToeScreen extends StatefulWidget {
  const TicTacToeScreen({super.key});

  @override
  State<TicTacToeScreen> createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  List<String> _board = List.filled(9, ''); 
  String _currentPlayer = 'X';
  String _winner = '';
  bool _isDraw = false;

  void _handleTap(int index) {
    if (_board[index] != '' || _winner != '' || _isDraw) return;

    setState(() {
      _board[index] = _currentPlayer;
      if (_checkWinner(_currentPlayer)) {
        _winner = _currentPlayer;
      } else if (!_board.contains('')) {
        _isDraw = true;
      } else {
        _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';
      }
    });
  }

  bool _checkWinner(String player) {
    const List<List<int>> winningCombos = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ];

    for (var combo in winningCombos) {
      if (_board[combo[0]] == player &&
          _board[combo[1]] == player &&
          _board[combo[2]] == player) {
        return true;
      }
    }
    return false;
  }

  void _resetGame() {
    setState(() {
      _board = List.filled(9, '');
      _currentPlayer = 'X';
      _winner = '';
      _isDraw = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetGame,
            tooltip: 'Reset Game',
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            _winner != '' 
                ? 'Winner: $_winner' 
                : _isDraw 
                    ? "It's a Draw!" 
                    : 'Player: $_currentPlayer',
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _handleTap(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        _board[index],
                        style: TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                          color: _board[index] == 'X' ? Colors.blue : Colors.red,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: ElevatedButton(
              onPressed: _resetGame,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text('Play Again', style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
