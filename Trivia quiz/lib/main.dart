import 'package:flutter/material.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black12,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuestionPage(),
          ),
        ),
      ),
    );
  }
}

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {

  List<Widget> choices = [];
  List<Question> questionBank = [
    Question(
        questionText: 'The Titanic is the largest ship ever built.', answer: false),
    Question(
        questionText: 'There are more chickens in the world than humans.',
        answer: true),
    Question(questionText: 'Butterflies live for only one day.', answer: false),
    Question(questionText: 'The Earth is flat.', answer: false),
    Question(
        questionText: 'Fatih Sultan Mehmet never ate potatoes.', answer: true),
    Question(
        questionText:
        'French people say "80" to refer to smoking marijuana.',
        answer: true),
    Question(
        questionText: 'Fenerbahçe is the largest sports club in the world.',
        answer: true),
    Question(
        questionText:
        'Cashew nuts are actually the stems of a fruit.', answer: true),
  ];

  int questionIndex = 0;
  int score = 0;

  void checkAnswer(bool answer) {
    bool correctAnswer = questionBank[questionIndex].answer;

    setState(() {
      if (answer == correctAnswer) {
        choices.add(Icon(Icons.check, color: Colors.green));
        score++; // Increase score when the correct answer is given
      } else {
        choices.add(Icon(Icons.close, color: Colors.red));
      }

      if (questionIndex < questionBank.length - 1) {
        questionIndex++;
      } else {
        // Show the score after answering all questions
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Your Score'),
              content: Text('Total Score: $score'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank[questionIndex].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 3,
          spacing: 3,
          children: choices,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Icon(
                        Icons.thumb_down,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        checkAnswer(false); // Check for incorrect answer
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: Icon(
                        Icons.thumb_up,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        checkAnswer(true); // Check for correct answer
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Question {
  String questionText;
  bool answer;

  Question({required this.questionText, required this.answer});
}
