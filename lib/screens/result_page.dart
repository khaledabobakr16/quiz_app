import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/widgets/summary_data.dart';

import '../data/questions.dart';
import '../widgets/gradient_container.dart';
import '../widgets/image_logo.dart';
import '../widgets/restart_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(this._restartQuiz, this._selectedAnswer, {super.key});
  final void Function() _restartQuiz;
  final List<String> _selectedAnswer;
  List<Map<String, Object>> get _summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < _selectedAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': _selectedAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    int numOfCorrectAnswer = _summaryData
        .where((element) => element['user_answer'] == element['correct_answer'])
        .length;
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
                      "Time :${DateTime.now()}",
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
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'You answered ',
                  style: GoogleFonts.akayaTelivigala(
                      color: const Color.fromRGBO(255, 255, 255, 1)
                          .withOpacity(0.9),
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                  children: [
                    TextSpan(
                      text: "$numOfCorrectAnswer",
                      style: const TextStyle(color: Colors.blueAccent),
                    ),
                    const TextSpan(
                      text: " out of ",
                    ),
                    TextSpan(
                      text: "${questions.length}",
                      style: const TextStyle(color: Colors.green),
                    ),
                    const TextSpan(
                      text: " questions correctly!",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SummaryData(_summaryData),
              const SizedBox(
                height: 30,
              ),
              RestartButton(_restartQuiz),
            ],
          ),
        ),
      ),
    );
  }
}
