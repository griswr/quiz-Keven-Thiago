import 'package:flutter/material.dart';
import 'package:quis_app/components/questions.dart';
import 'package:quis_app/screens/resultados.dart';
import '../components/alert_option.dart';

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
  List<QuisQuestionModel> shuffledQuestions = [];
  int nextQuestionIndex = 0;

  _PlayQuizPageState() {
    shuffledQuestions = List.from(quisQuestions);
    shuffledQuestions.shuffle();
  }

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
              itemCount: shuffledQuestions.length,
              itemBuilder: (context, index) {
                QuisQuestionModel model = shuffledQuestions[index];

                return Column(
                  children: [
                    Positioned(
                      top:
                          80, 
                      right:
                          10, 
                      child: Container(
                        margin: EdgeInsets.only(
                            top:
                                25), 
                        child: Text(
                          "${nextQuestionIndex + 1}/${shuffledQuestions.length}",
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      model.imagePath,
                      width: 300,
                      height: 300,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        child: Text(
                          model.question,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        children: List.generate(
                          model.options.length,
                          (index) => InkWell(
                            onTap: () {
                              setState(() {
                                isAnswerLocked = true;
                                selectedAnswer = model.options[index];
                                correctAnswer = model.correctAnswer;
                              });
                            },
                            child: Container(
                              width: 280, // Largura fixa de 200 pixels
                              height: 50,
                              margin: const EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
                                color: selectedAnswer == model.options[index]
                                    ? Color.fromARGB(255, 68, 68, 68)
                                    : const Color.fromARGB(255, 0, 0, 0),
                              ),
                              padding: const EdgeInsets.all(14),
                              alignment: Alignment.center,
                              child: Text(
                                model.options[index],
                                style: TextStyle(
                                  color: selectedAnswer == model.options[index]
                                      ? Color.fromARGB(255, 255, 255, 255)
                                      : Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Positioned(
              bottom: 10,
              left: 130,
              right: 130,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(90),
                ),
                child: Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  if (isAnswerLocked) {
                    isAnswerLocked = false;
                    if (selectedAnswer == correctAnswer) {
                      correctAnswers++;
                    } else {
                      wrongAnswers++;
                    }
                    nextQuestionIndex++;
                    if (nextQuestionIndex < shuffledQuestions.length) {
                      pageController.jumpToPage(nextQuestionIndex);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPage(
                            correctAnswer: correctAnswers,
                            wrongAnswer: wrongAnswers,
                          ),
                        ),
                      );
                    }
                    debugPrint("Resposta Correta: $correctAnswers");
                    debugPrint("Resposta Errada: $wrongAnswers");
                  } else {
                    showDialog(
                      context: context,
                      builder: ((context) {
                        return const AlertOption();
                      }),
                    );
                    debugPrint("Selecione uma opção");
                  }
                },
                child: Container(
                  height: 50,
                  color: Color.fromARGB(0, 255, 82, 82),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
