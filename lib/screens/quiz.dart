// ignore_for_file: prefer_const_constructors, avoid_print, empty_catches, prefer_interpolation_to_compose_strings

import "package:flutter/material.dart";
import "../components/options.dart";

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int questionIndex = 0;

  int right = 0, wrong = 0, points = 0;

  List questions = [
    {
      "question": "What is the National Fruit Of India?",
      "options": ["Mango", "Apple", "Orange", "Strawberry"],
      "answerIndex": 0
    },
    {
      "question": "What is the National Animal Of India?",
      "options": ["Lion", "Zebra", "Tiger", "Horse"],
      "answerIndex": 2
    },
    {
      "question": "What is the National Bird Of India?",
      "options": ["Eagle", "Peacock", "Pegion", "Crow"],
      "answerIndex": 1
    },
  ];

  void Function() Function(dynamic)? checkAnswer(ans) {
    if (ans == questions[questionIndex]["answerIndex"]) {
      right++;
      points += 10;
    } else {
      wrong++;
      points -= 5;
    }
    setState(() {
      questionIndex++;
    });

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Quiz Application"),
        ),
      ),
      body: questionIndex < questions.length
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Q:${questionIndex + 1} " +
                    questions[questionIndex]["question"]),
                Options(
                    options: questions[questionIndex]["options"],
                    callBackFunction: checkAnswer)
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Thank You for Participating in the Quiz",
                  ),
                  Text("Right Answers : " + right.toString()),
                  Text("Wrong Answers : " + wrong.toString()),
                  Text("Points : " + points.toString()),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          questionIndex = 0;
                        });
                      },
                      child: Text("Start Again?"),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
