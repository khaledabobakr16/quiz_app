import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/answer_button.dart';
import '../widgets/gradient_container.dart';
import '../data/questions.dart';
import '../widgets/image_logo.dart';
import '../widgets/restart_button.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage(this.onSelectedAnswer, this._restartQuiz, {super.key});
  final void Function(String) onSelectedAnswer;
  final void Function() _restartQuiz;
  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  var currentQuestionsIndex = 0;
  void nextQuestion(String answer) {
    widget.onSelectedAnswer(answer);
    setState(() {
      currentQuestionsIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestions = questions[currentQuestionsIndex];
    return GradientContainer(
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Time : ${DateTime.now()}",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 13),
              const ImageLogoOpacity(0.4),
              const SizedBox(height: 10),
              Text(
                textAlign: TextAlign.center,
                currentQuestions.text,
                style: GoogleFonts.lato(
                    color:
                        const Color.fromRGBO(255, 255, 255, 1).withOpacity(0.9),
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              const SizedBox(
                height: 30,
              ),
              ...currentQuestions.shuffledAnswers.map((element) {
                return Container(
                    margin: const EdgeInsets.all(10),
                    child: AnswerButton(
                      answerText: element,
                      onPressed: () => nextQuestion(element),
                    ));
              }),
              RestartButton(widget._restartQuiz),
            ],
          ),
        ),
      ),
    );
  }
}
