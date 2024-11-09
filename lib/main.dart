import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuis Matematika',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kuis Matematika'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'KUIS\nMATEMATIKA',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 40),
            DifficultyButton(
              text: 'MUDAH',
              color: Colors.blue,
              onPressed: () {
                // Arahkan ke halaman kuis dengan tingkat mudah
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen(difficulty: 'Mudah')),
                );
              },
            ),
            DifficultyButton(
              text: 'SEDANG',
              color: Colors.green,
              onPressed: () {
                // Arahkan ke halaman kuis dengan tingkat sedang
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen(difficulty: 'Sedang')),
                );
              },
            ),
            DifficultyButton(
              text: 'SULIT',
              color: Colors.red,
              onPressed: () {
                // Arahkan ke halaman kuis dengan tingkat sulit
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen(difficulty: 'Sulit')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DifficultyButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  DifficultyButton({required this.text, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      width: 200,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}

class QuizScreen extends StatelessWidget {
  final String difficulty;

  QuizScreen({required this.difficulty});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kuis $difficulty'),
      ),
      body: Center(
        child: Text(
          'Ini adalah halaman kuis tingkat $difficulty',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
