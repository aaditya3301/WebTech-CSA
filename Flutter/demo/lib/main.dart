import 'package:flutter/material.dart';
import 'movie_app.dart';

void main() {
  runApp(const LauncherApp());
}

class LauncherApp extends StatelessWidget {
  const LauncherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Helper Launcher',
      theme: ThemeData(useMaterial3: true),
      home: const HelperListScreen(),
    );
  }
}

class HelperListScreen extends StatelessWidget {
  const HelperListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Flutter Apps')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MovieApp()),
                );
              },
              child: const Text('Open Movie Browser 🎬'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewAppScreen()),
                );
              },
              child: const Text('Open New App ✨'),
            ),
          ],
        ),
      ),
    );
  }
}

// --- This is where your NEW APP starts ---
class NewAppScreen extends StatelessWidget {
  const NewAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My New App')),
      body: const Center(
        child: Text(
          'Start building your new app here!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
