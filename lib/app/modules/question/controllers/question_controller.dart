import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_care_app/app/data/models/question.dart';

import '../views/score_screen.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  // Lets animated our progress bar

  AnimationController? _animationController;
  Animation? _animation;
  // so that we can access our animation outside
  Animation? get animation => this._animation;

  PageController? _pageController;
  PageController? get pageController => this._pageController;

  List<int>? kumpulanJawaban;

  List<Question> _questions = sample_data
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      )
      .toList();
  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int? _correctAns;
  int? get correctAns => this._correctAns;

  int? _selectedAns;
  int? get selectedAns => this._selectedAns;

  // for more about obs please check documentation
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  RxInt totalPoint = 0.obs;
  int get numOfCorrectAns => this._numOfCorrectAns;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    // Our animation duration is 60 s
    // so our plan is to fill the progress bar within 60s
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController!)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    // Once 60s is completed go to the next qn
    _animationController!.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
    _animationController!.dispose();
    _pageController!.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    // because once user press any option then it will run
    _isAnswered = true;

    _correctAns = selectedIndex;
    // _selectedAns = selectedIndex;

    // if (_correctAns == _selectedAns) _numOfCorrectAns++;

    kumpulanJawaban = [selectedIndex];

    if (selectedIndex == 0) {
      totalPoint.value += 4;
    } else if (selectedIndex == 1) {
      totalPoint.value += 3;
    } else if (selectedIndex == 2) {
      totalPoint.value += 2;
    } else if (selectedIndex == 3) {
      totalPoint.value += 1;
    }

    // It will stop the counter
    _animationController!.stop();
    update();
    print("${totalPoint.value}}");
    // Once user select an ans after 3s it will go to the next qn
    Future.delayed(Duration(milliseconds: 500), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController!
          .nextPage(duration: Duration(milliseconds: 250), curve: Curves.ease);

      // Reset the counter
      _animationController!.reset();

      // Then start it again
      // Once timer is finish go to the next qn
      _animationController!.forward().whenComplete(nextQuestion);
    } else {
      // Get package provide us simple way to naviigate another page
      Get.to(ScoreScreen());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
