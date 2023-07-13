import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class FourthTab extends StatefulWidget {
  const FourthTab({Key? key}) : super(key: key);

  @override
  _FourthTabState createState() => _FourthTabState();
}

class _FourthTabState extends State<FourthTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Memo4Service>(
      builder: (context, memo4Service, child) {
        List<Memo4> memo4List = memo4Service.memo4List;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.7,
              centerTitle: true,
              title: const Text(
                'This is ME',
                style: TextStyle(
                  fontSize: 27,
                  color: Color.fromARGB(255, 45, 45, 45),
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.grey),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/kmj.png',
                        width: 170,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Text(
                      '김민지',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      '[29, ISTJ]',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 1,
                      height: 20,
                    ),
                    const Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "블로그",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10),
                            Text("https://brunch.co.kr/@2245edea227e49b"),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              "강점",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 15),
                            Text("안 되면 될 때 까지"),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              "각오",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10),
                            Text("어플 개발 하고 만다."),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              "협업 스타일",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 15),
                            Text("폐 끼치지 않도록 열심히 함"),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              "팀특징",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 15),
                            Text("말이 없음"),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              "목표",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 15),
                            Text("팀 - 비싼 개발자 / 개인 연 매출 1조 사업가"),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              "느낀점",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 15),
                            Text("가운데 정렬이 이렇게 어려울 줄이야"),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 1,
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: memo4List.isEmpty
                          ? const Center(
                              child: Text("입력된 메모가 없습니다."),
                            )
                          : Column(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: memo4List.length,
                                  itemBuilder: (context, index) {
                                    Memo4 memo4 = memo4List[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 0,
                                      ),
                                      child: ListTile(
                                        tileColor: const Color.fromARGB(
                                            255, 244, 242, 242),
                                        trailing: IconButton(
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.pink,
                                          ),
                                          onPressed: () {
                                            showDeleteDialog(context, index);
                                          },
                                        ),
                                        title: const Text("댓글"),
                                        subtitle: Text(
                                          memo4.content,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
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
              child: const Icon(Icons.edit),
              onPressed: () {
                memo4Service.createMemo4(content: '');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        DetailPage(index: memo4Service.memo4List.length - 1),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  void showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("정말로 삭제하시겠습니까?"),
          actions: [
            TextButton(
              onPressed: () {
                Provider.of<Memo4Service>(context, listen: false)
                    .deleteMemo4(index: index);
                Navigator.pop(context);
              },
              child: const Text(
                "확인",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            // 취소 버튼
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "취소",
                style: TextStyle(color: Colors.pink),
              ),
            ),
          ],
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
    Memo4Service memo4Service = context.read<Memo4Service>();
    Memo4 memo4 = memo4Service.memo4List[index];

    contentController.text = memo4.content;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("정말로 삭제하시겠습니까?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          memo4Service.deleteMemo4(index: index);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "확인",
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "취소",
                          style: TextStyle(
                            color: Colors.pink,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.delete),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: contentController,
          decoration: const InputDecoration(
            hintText: "메모를 입력하세요",
            border: InputBorder.none,
          ),
          autofocus: true,
          maxLines: null,
          expands: true,
          keyboardType: TextInputType.multiline,
          onChanged: (value) {
            memo4Service.updateMemo4(index: index, content: value);
          },
        ),
      ),
    );
  }
}

class Memo4 {
  Memo4({
    required this.content,
  });

  String content;

  Map toJson() {
    return {'content': content};
  }

  factory Memo4.fromJson(json) {
    return Memo4(content: json['content']);
  }
}

class Memo4Service extends ChangeNotifier {
  Memo4Service() {
    loadMemo4List();
  }

  List<Memo4> memo4List = [];

  createMemo4({required String content}) {
    Memo4 memo4 = Memo4(content: content);
    memo4List.add(memo4);
    notifyListeners();
    saveMemo4List(); // Consumer<Memo4Service>의 builder 부분을 호출해서 화면 새로고침
  }

  updateMemo4({required int index, required String content}) {
    Memo4 memo4 = memo4List[index];
    memo4.content = content;
    notifyListeners();
    saveMemo4List();
  }

  deleteMemo4({required int index}) {
    memo4List.removeAt(index);
    notifyListeners();
    saveMemo4List();
  }

  saveMemo4List() {
    List memo4JsonList = memo4List.map((memo4) => memo4.toJson()).toList();
    // [{"content": "1"}, {"content": "2"}]

    String jsonString = jsonEncode(memo4JsonList);
    // '[{"content": "1"}, {"content": "2"}]'

    prefs.setString('memo4List', jsonString);
  }

  loadMemo4List() {
    String? jsonString = prefs.getString('memo4List');
    // '[{"content": "1"}, {"content": "2"}]'

    if (jsonString == null) return; // null 이면 로드하지 않음

    List memo4JsonList = jsonDecode(jsonString);
    // [{"content": "1"}, {"content": "2"}]

    memo4List = memo4JsonList.map((json) => Memo4.fromJson(json)).toList();
  }
}
