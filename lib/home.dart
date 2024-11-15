import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  State<Home> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(
            height: 40,
          ),
          Text('Learn Flutter the Fun Way',
              style: GoogleFonts.lato(color: Colors.white, fontSize: 28)),
          const SizedBox(
            height: 60,
          ),
          ElevatedButton.icon(
            onPressed: widget.startQuiz,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              textStyle: const TextStyle(fontSize: 28),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text("Start Quiz"),
          )
        ],
      ),
    );
  }
}
