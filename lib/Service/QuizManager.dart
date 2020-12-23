import 'Question.dart';
import 'Option.dart';

class QuizManager {
  QuizManager() {
    _questions.add(Question('Türkiye' 'nin başkenti neresidir?', [
      Option('Ankara', 10),
      Option('İstanbul', 5),
      Option('Zurich', 0),
      Option('Fransa', -5),
    ]));

    _questions.add(Question('Fransa' 'nın başkenti neresidir?', [
      Option('Paris', 10),
      Option('Milano', 5),
      Option('Lens', 0),
      Option('Türkiye', -5),
    ]));

    _questions.add(Question('İngiltere' 'nin başkenti neresidir?', [
      Option('Londra', 10),
      Option('Lens', 5),
      Option('İstanbul', 0),
      Option('Africa', -5),
    ]));

    _questions.add(Question('Almanya' 'nin başkenti neresidir?', [
      Option('Berlin', 10),
      Option('Hamburg', 5),
      Option('Napoli', 0),
    ]));

    _questions.add(Question('Flutter hangi şirket tarafından geliştirilmiştir?', [
      Option('Google', 10),
      Option('Facebook', 5),
      Option('IBM', 0),
      Option('U.S.A', -5)
    ]));

    _questions.add(Question('Flutter' 'ın sağladığı en büyük kolaylık nedir?', [
      Option('Tek kodla hem IOS hem de android için uygulama geliştirmeyi sağlar', 10),
      Option('Güzel tasarımlar sunar', 5),
      Option('Ücretsizdir', 0),
      Option('Bir native dildir', -5),
    ]));

    _questions.add(Question('Aşağıdakilerden hangisi cross platformlar arasında en performanslısıdır?', [
      Option('Flutter', 10),
      Option('React-Native', 5),
      Option('Ionic', 0),
    ]));

    for (var question in _questions) {
      question.options.shuffle();
    }
  }
  List<Question> _questions = [];
  int _score = 0;
  int currentQuestionId = 0;
  int _flutterQuizScore = 0;
  int flutterQuizCurrentId = 4;
  void nextQuestion(score) {
    if(currentQuestionId < _questions.length) {
      _score += score;
      currentQuestionId++;
    }
    print(currentQuestionId);
  }
  void nextQuestionforSecondQuiz(score) {
    if(flutterQuizCurrentId < _questions.length) {
      _flutterQuizScore += score;
      flutterQuizCurrentId++;
    }
  }

  int getTotalScore() => _score;
  int getCurrentId() => currentQuestionId + 1;

  int getSecondScore() => _flutterQuizScore;
  int getSecondQuizId() => flutterQuizCurrentId - 3;

  bool isFinished() {
    return (flutterQuizCurrentId >= _questions.length || currentQuestionId == 4);
  }

  Question getFirstPartQuestions() {
    print('getCurrentQuestion $currentQuestionId');
    if((currentQuestionId < _questions.length)&&(currentQuestionId < 4)) {
      return _questions[currentQuestionId];
    } else {
      return Question('', []);
    }
  }
  Question getSecondPartQuestions() {
    print('getCurrentQuestion $currentQuestionId');
    if(flutterQuizCurrentId < _questions.length) {
      return _questions[flutterQuizCurrentId];
    } else {
      return Question('', []);
    }
  }
}