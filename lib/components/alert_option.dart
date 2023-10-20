import 'package:flutter/material.dart';
import 'package:quis_app/components/color.dart';

class AlertOption extends StatelessWidget {
  const AlertOption({super.key, Key? k});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: foregroundColor,
      title: Text(
        "Ocorreu um erro!",
        style: TextStyle(
          color: Colors.red.shade600,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: const Text(
        "Você precisa selecionar uma resposta.",
        style: TextStyle(
          color: Colors.white,
          fontSize: 19,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); 
          },
          child: const Text(
            "OK",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
