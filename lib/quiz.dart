import 'package:flutter/material.dart';
import 'start_screen.dart';
import 'questions_screen.dart';
import 'data/questions.dart';
import 'results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];
  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);

    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(chooseAnswer);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(selectedAnswers);
        selectedAnswers = [];
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
