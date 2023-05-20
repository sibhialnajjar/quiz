import 'package:flutter/material.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Appbrain appBrain = Appbrain();

void main() {
  runApp(quiz());
}

// التوريث للكلاس Inheritance
// وهو السماح للكلاس الجديد بأخذ كل الخصائص الموجودة في الكلاس القديم
// نكتب اولا Class ثم اسم الكلاس الجديد Newclasss ثم extends ثم اسم الكلاس القديم Oldclass
class quiz extends StatelessWidget {
  //تعدد الاشكال Polymorphism :  وتفيدنا هذه الميزة بالتعديل على وظائف الكلاس الجديد /الموروث/ز
  //وتكون عبر كلمة @override كما في الاسفل
  //وبعد كتابة هذه الكلمة نكتب اسم ال void ونقوم بالتعديل عليها
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 7, 22, 69),
          title: Row(
            children: [
              SizedBox(
                width: 210.0,
              ),
              Text(
                ' مسابقة دينية',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 25.0,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: QuizPage(),
        //bottomNavigationBar: BottomNavigationBar(
        //  items: const <BottomNavigationBarItem>[
        //    BottomNavigationBarItem(
        //      icon: Icon(Icons.home),
        //      label: 'Home',
        //    ),
        //    BottomNavigationBarItem(
        //      icon: Icon(Icons.business),
        //      label: 'Business',
        //    ),
        //    BottomNavigationBarItem(
        //      icon: Icon(Icons.school),
        //      label: 'School',
        //    ),
        //  ],
        //),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> answerResult = [];
  int rightAnswers = 0;
  List<String> trueAnswer = [
    'إبراهيم وإسماعيل عليهما السلام',
    'الامام مالك',
    '15',
    ' الشفاء أم عبد الرحمن بن عوف',
    'الجمعة',
  ];
  void checkAnswer(String whatUsPiked) {
    setState(() {
      for (var i = 0; i < trueAnswer.length; i++) {
        if (whatUsPiked == trueAnswer[i]) {
          rightAnswers++;
          answerResult.add(
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Icon(
                Icons.thumb_up,
                color: Colors.green,
              ),
            ),
          );
        }
      }
      if (appBrain.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.error,
          title: "انتهاء الاختبار",
          desc: "لقد أجبت على $rightAnswers أسئلة صحيحية من أصل 5",
          buttons: [
            DialogButton(
              child: Text(
                "إبدأ من جديد",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        appBrain.reset();
        answerResult = [];
        rightAnswers = 0;
      } else {
        appBrain.nextQuestion();
      }
    });
  }

  List<String> questionImage = [
    'images/kabe.jpg',
    'images/2.jpg',
    'images/kabe.jpg',
    'images/kabe.jpg',
    'images/kabe.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answerResult,
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset('images/2.jpg'),
              Text(
                appBrain.getQuestionText(),
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: 'Cairo',
                  //fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  //  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                  Color.fromARGB(255, 7, 22, 69),
                ),
              ),
              child: Text(
                appBrain.getQuestionAnswerA(),
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Cairo',
                  fontSize: 17.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  checkAnswer(appBrain.getQuestionAnswerA());
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                  Color.fromARGB(255, 7, 22, 69),
                ),
              ),
              child: Text(
                appBrain.getQuestionAnswerB(),
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Cairo',
                  fontSize: 17.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  checkAnswer(appBrain.getQuestionAnswerB());
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                  Color.fromARGB(255, 7, 22, 69),
                ),
              ),
              child: Text(
                appBrain.getQuestionAnswerC(),
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Cairo',
                  fontSize: 17.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  checkAnswer(appBrain.getQuestionAnswerC());
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
