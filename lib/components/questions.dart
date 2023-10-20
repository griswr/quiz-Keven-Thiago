// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:quis_app/components/questions.dart';
import 'package:quis_app/screens/resultados.dart';
import '../components/alert_option.dart';

class QuisQuestionModel {
  final String question;
  final String correctAnswer;
  final List<String> options;
  final String imagePath; 

  QuisQuestionModel({
    required this.question,
    required this.correctAnswer,
    required this.options,
    required this.imagePath,
  });
}

List<QuisQuestionModel> quisQuestions = [
  QuisQuestionModel(
    question: "Qual é esse desenho?",
    correctAnswer: "Os simpsons",
    options: [
      "Os Simpsons",
      "Minions",
      "O Lorax",
      "Garfield",
    ],
    imagePath: "assets/images/simpsons.png",
  ),
  QuisQuestionModel(
    question: "Qual é esse desenho?",
    correctAnswer: "South Park",
    options: [
      "American Dad",
      "Family Guy",
      "South Park",
      "Mr.Pickle",
    ],
    imagePath: "assets/images/south.png",
  ),
  QuisQuestionModel(
    question: "Qual é esse desenho?",
    correctAnswer: "Monstros S.A.",
    options: [
      "Tinker Bell",
      "Universidade Monstros",
      "Lilo & Stitch",
      "Monstros S.A.",
    ],
    imagePath: "assets/images/sa.png",
  ),
  QuisQuestionModel(
    question: "Qual é esse desenho?",
    correctAnswer: "Meninas Super Poderosas",
    options: [
      "Três Espiãs Demais!",
      "Power Rangers",
      "Meninas Super Poderosas",
      "South Park",
    ],
    imagePath: "assets/images/meninas.png",
  ),
  QuisQuestionModel(
    question: "Qual é esse desenho?",
    correctAnswer: "Divertida Mente",
    options: [
      "Divertida Mente",
      "Soul",
      "Zootopia",
      "Os Sete Anões",
    ],
    imagePath: "assets/images/divertida.png",
  ),
  QuisQuestionModel(
    question: "Qual é esse desenho?",
    correctAnswer: "Detona Ralph",
    options: [
      "Bolt",
      "Wifi Ralph",
      "Detona Ralph",
      "Os Sete Anões",
    ],
    imagePath: "assets/images/detona.png",
  ),
];

class PlayQuizPage extends StatefulWidget {
  const PlayQuizPage({Key? key}) : super(key: key);

  @override
  State<PlayQuizPage> createState() => _PlayQuizPageState();
}

class _PlayQuizPageState extends State<PlayQuizPage> {
  String correctAnswer = "";
  String selectedAnswer = "";
  int currentIndex = 0;
  int correctAnswers = 0;
  int wrongAnswers = 0;
  bool isAnswerLocked = false;
  final PageController pageController = PageController();
  int nextQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255),
            ],
          ),
        ),
        child: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: quisQuestions.length,
              itemBuilder: (context, index) {
                QuisQuestionModel model = quisQuestions[index];

                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      
                      Image.asset(
                        model.imagePath,
                        width:
                            200, 
                        height: 200,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "${nextQuestionIndex + 1}/${quisQuestions.length}",
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      
                      Center(
                        child: Text(
                          model.question,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 24, 
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      
                    ],
                  ),
                );
              },
            ),
            
          ],
        ),
      ),
    );
  }
}
