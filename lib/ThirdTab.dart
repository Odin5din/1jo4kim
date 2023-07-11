import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:team7_work/FirstTab.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'FirstTab.dart';

class ThirdTab extends StatefulWidget {
  const ThirdTab({Key? key}) : super(key: key);

  @override
  _ThirdTabState createState() => _ThirdTabState();
}

class _ThirdTabState extends State<ThirdTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MemoService>(
      builder: (context, memoService, child) {
        List<Memo> memoList = memoService.memoList;

        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Column(
                children: [
                  Image.asset('path/to/your/image'), // 이미지 경로 설정
                  Text(
                    '김지견',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Text("경력"),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 24),
                          child: TextField(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("강점"),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 24),
                          child: TextField(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("강점"),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 24),
                          child: TextField(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("강점"),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 24),
                          child: TextField(),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  memoList.isEmpty
                      ? BottomAppBar(
                          child: Text("입력된 메모가 없습니다."),
                        )
                      : ListView.builder(
                          itemCount: memoList.length,
                          itemBuilder: (context, index) {
                            Memo memo = memoList[index];
                            return ListTile(
                              title: Text(
                                memo.content,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
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
                            );
                          },
                        ),
                ],
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.edit),
            onPressed: () {
              memoService.createMemo(content: '');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      DetailPage(index: memoService.memoList.length - 1),
                ),
              );
            },
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
    MemoService memoService = context.read<MemoService>();
    Memo memo = memoService.memoList[index];

    contentController.text = memo.content;

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
                          memoService.deleteMemo(index: index);
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
            memoService.updateMemo(index: index, content: value);
          },
        ),
      ),
    );
  }
}

class Memo {
  Memo({
    required this.content,
  });

  String content;

  Map toJson() {
    return {'content': content};
  }

  factory Memo.fromJson(json) {
    return Memo(content: json['content']);
  }
}

class MemoService extends ChangeNotifier {
  MemoService() {
    loadMemoList();
  }

  List<Memo> memoList = [];

  createMemo({required String content}) {
    Memo memo = Memo(content: content);
    memoList.add(memo);
    notifyListeners();
    saveMemoList(); // Consumer<MemoService>의 builder 부분을 호출해서 화면 새로고침
  }

  updateMemo({required int index, required String content}) {
    Memo memo = memoList[index];
    memo.content = content;
    notifyListeners();
    saveMemoList();
  }

  deleteMemo({required int index}) {
    memoList.removeAt(index);
    notifyListeners();
    saveMemoList();
  }

  saveMemoList() {
    List memoJsonList = memoList.map((memo) => memo.toJson()).toList();
    // [{"content": "1"}, {"content": "2"}]

    String jsonString = jsonEncode(memoJsonList);
    // '[{"content": "1"}, {"content": "2"}]'

    prefs.setString('memoList', jsonString);
  }

  loadMemoList() {
    String? jsonString = prefs.getString('memoList');
    // '[{"content": "1"}, {"content": "2"}]'

    if (jsonString == null) return; // null 이면 로드하지 않음

    List memoJsonList = jsonDecode(jsonString);
    // [{"content": "1"}, {"content": "2"}]

    memoList = memoJsonList.map((json) => Memo.fromJson(json)).toList();
  }
}
