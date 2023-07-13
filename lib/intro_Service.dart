import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:convert';

class Intro {
  Intro({
    required this.content,
  });
  String content;
}

// Intro 데이터는 모두 여기서 관리
class IntroService extends ChangeNotifier {
  List<Intro> introList = [
    Intro(content: '장보기 목록: 사과, 양파'), // 더미(dummy) 데이터
    Intro(content: '새 메모'), // 더미(dummy) 데이터
  ];
  createMemo({required String content}) {
    Intro intro = Intro(content: content);
    introList.add(intro);
    notifyListeners();
  }

  updateMemo({required int index, required String content}) {
    Intro intro = introList[index];
    intro.content = content;
    notifyListeners();
  }

  deleteMemo({required int index}) {
    introList.removeAt(index);
    notifyListeners();
  }
}
