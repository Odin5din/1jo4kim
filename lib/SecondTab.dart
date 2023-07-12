import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class SecondTab extends StatefulWidget {
  const SecondTab({Key? key}) : super(key: key);

  @override
  _SecondTabState createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Memo2Service>(
      builder: (context, memo2Service, child) {
        List<Memo2> memo2List = memo2Service.memo2List;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // 이미지 경로 설정
                    Text(
                      '김지견',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: memo2List.isEmpty
                          ? Center(
                              child: Text("입력된 메모가 없습니다."),
                            )
                          : Column(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: memo2List.length,
                                  itemBuilder: (context, index) {
                                    Memo2 memo2 = memo2List[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListTile(
                                        title: Text(
                                          memo2.content,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => DetailPage(
                                                index: index,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.edit),
              onPressed: () {
                memo2Service.createMemo2(content: '');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        DetailPage(index: memo2Service.memo2List.length - 1),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class DetailPage extends StatelessWidget {
  DetailPage({super.key, required this.index});

  final int index;

  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Memo2Service memo2Service = context.read<Memo2Service>();
    Memo2 memo2 = memo2Service.memo2List[index];

    contentController.text = memo2.content;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("정말로 삭제하시겠습니까?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("취소"),
                      ),
                      TextButton(
                        onPressed: () {
                          memo2Service.deleteMemo2(index: index);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text(
                          "확인",
                          style: TextStyle(color: Colors.pink),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.delete),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: contentController,
          decoration: InputDecoration(
            hintText: "메모를 입력하세요",
            border: InputBorder.none,
          ),
          autofocus: true,
          maxLines: null,
          expands: true,
          keyboardType: TextInputType.multiline,
          onChanged: (value) {
            memo2Service.updateMemo2(index: index, content: value);
          },
        ),
      ),
    );
  }
}

class Memo2 {
  Memo2({
    required this.content,
  });

  String content;

  Map toJson() {
    return {'content': content};
  }

  factory Memo2.fromJson(json) {
    return Memo2(content: json['content']);
  }
}

class Memo2Service extends ChangeNotifier {
  Memo2Service() {
    loadMemo2List();
  }

  List<Memo2> memo2List = [];

  createMemo2({required String content}) {
    Memo2 memo2 = Memo2(content: content);
    memo2List.add(memo2);
    notifyListeners();
    saveMemo2List(); // Consumer<MemoService>의 builder 부분을 호출해서 화면 새로고침
  }

  updateMemo2({required int index, required String content}) {
    Memo2 memo2 = memo2List[index];
    memo2.content = content;
    notifyListeners();
    saveMemo2List();
  }

  deleteMemo2({required int index}) {
    memo2List.removeAt(index);
    notifyListeners();
    saveMemo2List();
  }

  saveMemo2List() {
    List memo2JsonList = memo2List.map((memo2) => memo2.toJson()).toList();
    // [{"content": "1"}, {"content": "2"}]

    String jsonString = jsonEncode(memo2JsonList);
    // '[{"content": "1"}, {"content": "2"}]'

    prefs.setString('memo2List', jsonString);
  }

  loadMemo2List() {
    String? jsonString = prefs.getString('memo2List');
    // '[{"content": "1"}, {"content": "2"}]'

    if (jsonString == null) return; // null 이면 로드하지 않음

    List memo2JsonList = jsonDecode(jsonString);
    // [{"content": "1"}, {"content": "2"}]

    memo2List = memo2JsonList.map((json) => Memo2.fromJson(json)).toList();
  }
}
