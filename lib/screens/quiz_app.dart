import 'package:flutter/material.dart';

import '../data/questions.dart';
import 'home_page.dart';
import 'questions_page.dart';
import 'result_page.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<String> selectedAnswer = [];
  Widget? activeScreen;

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsPage(chooseAnswer, restartQuiz);
    });
  }

  bool lastQuestion() {
    if (selectedAnswer.length == questions.length) {
      return true;
    }
    {
      return false;
    }
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (lastQuestion() == true) {
      setState(() {
        activeScreen = ResultPage(restartQuiz, selectedAnswer);
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = HomePage(switchScreen);
    });
  }

  @override
  void initState() {
    super.initState();
    activeScreen = HomePage(switchScreen);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: activeScreen,
        ),
      ),
    );
  }
}
