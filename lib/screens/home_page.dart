import 'package:flutter/material.dart';
import 'package:quis_app/screens/telaquiz.dart';

class StartQuizPage extends StatelessWidget {
  const StartQuizPage({super.key, Key? k});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.topRight,
            colors: [
              const Color.fromARGB(255, 255, 255, 255), // Change the gradient colors
              const Color.fromARGB(255, 255, 255, 255),
            ],
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
  
              Image.asset(
                'assets/images/kuromi.png', 
                width: 200,
                height: 450,
                fit: BoxFit.contain,
              ),
              ElevatedButton(
              onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PlayQuizPage(),
                ),
              );
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 0, 0, 0), 
              minimumSize: const Size(230, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(90), 
              ),
              ),
              child: const Text(
              "Iniciar quiz",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), 
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
              ),
                      ],
                    ),
                  ),
                ),
              );
              }
              }
