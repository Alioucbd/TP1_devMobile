import 'package:flutter/material.dart';

import 'Quizz.dart';
import 'Resultat.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({super.key, required this.title});

  final String title;

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class Question {
  String questionText;
  bool isCorrect;
  Question({required this.questionText, required this.isCorrect});

  setQuestionText(String questionText ){
    this.questionText = questionText;
  }

  setIsCorrect(bool isCorrect ){
    this.isCorrect = isCorrect;
  }

}


class _QuizzPageState extends State<QuizzPage> {
  int index = 0;
  bool buttonFalse = false, buttonTrue =false;
  var reponse =  Map<int, bool>();

  next(Map request) {

    if(buttonFalse){
      reponse [index] = false;
      buttonFalse = false;
    }
    if(buttonTrue){
      reponse [index] = true;
      buttonTrue = false;
    }

    index = index + 1;

    if(request.length == index){
      Navigator.push(context,
          MaterialPageRoute<void>(
              builder:(BuildContext context) {
                return Resultat(title: "Resultat", request: request, reponse: reponse);
              }));
    }else{
      setState(() {});
    }

  }

  @override
  Widget build(BuildContext context) {
    //Quizz q = Quizz();
    Question question = Question(questionText: "Le nombre de rayures sur le drapeau américain est égale a 15.", isCorrect: false);
    var request = new Map();


    request[0] = question;
    request[1] = Question(questionText: "l’animal national de l’Australie est le kangourou rouge.", isCorrect: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(
          child: Text(
            widget.title,
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 5, 30, 10),
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('assets/img_quizz.jpg',
                width: 200,
                height: 300,
              ),
              SizedBox(height:40.0),
              Expanded(
                child: Container(
                  width: 100,
                  height: 100,
                  //color: Colors.blue,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(
                    child: Text(
                      request[index].questionText,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height:40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Colors.blueGrey,
                      ),
                      onPressed: () => buttonTrue = true,
                      child: const Text('VRAI'),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Colors.blueGrey,
                      ),
                      onPressed: () => buttonFalse = true,
                      child: const Text('FAUX'),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Colors.blueGrey,
                      ),
                      onPressed: () => next(request),
                      child: const Text('->'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height:40.0),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
