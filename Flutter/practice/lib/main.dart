import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ================= MAIN APP =================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

// ================= HOME SCREEN (STATEFUL) =================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String title = "HOME";
  String message = "Hello World";

  void changeContent() {
    setState(() {
      title = "NEW SUBMIT";
      message = "Button Clicked!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TEXT
            Text(
              message,
              style: const TextStyle(fontSize: 22),
            ),

            const SizedBox(height: 20),

            // BUTTON
            ElevatedButton(
              onPressed: changeContent,
              child: const Text("SUBMIT"),
            ),
          ],
        ),
      ),
    );
  }
}