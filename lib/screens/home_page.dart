import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/gradient_container.dart';
import '../widgets/image_logo.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.switchScreen, {super.key});
  final void Function() switchScreen;
  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.2,
          ),
          Text("Quiz App",
              style: GoogleFonts.akayaTelivigala(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              )),
          const SizedBox(
            height: 20,
          ),
          Text(
            "1000+ quizzes to challenge you and",
            style: TextStyle(
              color: Colors.white.withOpacity(0.65),
              fontSize: 15,
            ),
          ),
          Center(
            child: Text(
              "your friends on all topics!",
              style: TextStyle(
                color: Colors.white.withOpacity(0.65),
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const ImageLogoOpacity(0.9),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: switchScreen,
            label: const Text(
              "Start Quiz",
            ),
            icon: const Icon(Icons.arrow_right_alt_outlined),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
              elevation: 0.8,
            ),
          )
        ],
      ),
    );
  }
}
