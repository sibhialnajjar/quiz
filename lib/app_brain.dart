//في هذا الكلاس تعلمنا طريقة ال Abstraction
//هي كيفية تنظيم الكود بحيث فصل كل وظيفة على حدا لكي لا يتداخل الكود ببعضه البعض

import 'question.dart';

class Appbrain {
  int _questionNumber = 0;
  List<Questions> _questionGroup = [
    Questions(
      T: 'من هو أول من بنى الكعبة؟',
      A: 'إبراهيم وإسماعيل عليهما السلام',
      B: 'نوح عليه السلام',
      C: 'إبراهيم عليه السلام',
    ),
    Questions(
      T: 'من هو أول الأئمة الأربعة ؟',
      A: 'احمد بن حنبل',
      B: 'الامام مالك',
      C: 'الشافعي',
    ),
    Questions(
      T: 'كم عدد سجدات التلاوة ؟',
      A: '15',
      B: '16',
      C: '14',
    ),
    Questions(
      T: 'ما اسم قابلة الرسول صلى الله عليه وسلم ؟',
      A: 'حليمة السعدية',
      B: ' الشفاء أم عبد الله بن عوف',
      C: ' الشفاء أم عبد الرحمن بن عوف',
    ),
    Questions(
      T: 'في أي من أيام الأسبوع خلق الله آدم ( عليه السلام )  ؟',
      A: 'الإثنين',
      B: 'الجمعة',
      C: 'الخميس',
    ),
  ];
// Encapsulation: لأجل حماية المتغيرات من التغيير الغير مقصود او المقصود تم انشاء هذه الوظائف
  void nextQuestion() {
    if (_questionNumber < _questionGroup.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionGroup[_questionNumber].questionText;
  }

  String getQuestionAnswerA() {
    return _questionGroup[_questionNumber].questionAnswerA;
  }

  String getQuestionAnswerB() {
    return _questionGroup[_questionNumber].questionAnswerB;
  }

  String getQuestionAnswerC() {
    return _questionGroup[_questionNumber].questionAnswerC;
  }

  bool isFinished() {
    if (_questionNumber >= _questionGroup.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
