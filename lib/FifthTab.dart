import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class FifthTab extends StatefulWidget {
  const FifthTab({Key? key}) : super(key: key);

  @override
  _FifthTabState createState() => _FifthTabState();
}

class _FifthTabState extends State<FifthTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Memo5Service>(
      builder: (context, memo5Service, child) {
        List<Memo5> memo5List = memo5Service.memo5List;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.7,
              centerTitle: true,
              title: Text(
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
                icon: Icon(Icons.arrow_back, color: Colors.grey),
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
                        'assets/images/khj_720.jpg',
                        width: 170,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      '김민준',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '[24, INTP]',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 1,
                      height: 20,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "블로그 주소",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10),
                            Text("https://velog.io/@thundevistan"),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "강점",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 15),
                            Text("포기를 모르는 구글링"),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "앞으로의 각오",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10),
                            Text("5개월 간 외출금지"),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "느낀점",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 15),
                            Text("중요한 건 꺾이지 않는 소통"),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: memo5List.isEmpty
                          ? const Center(
                              child: Text("입력된 메모가 없습니다."),
                            )
                          : Column(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: memo5List.length,
                                  itemBuilder: (context, index) {
                                    Memo5 memo5 = memo5List[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: ListTile(
                                        tileColor:
                                            Color.fromARGB(255, 244, 242, 242),
                                        trailing: IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.pink,
                                          ),
                                          onPressed: () {
                                            showDeleteDialog(context, index);
                                          },
                                        ),
                                        title: Text("댓글"),
                                        subtitle: Text(
                                          memo5.content,
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
                memo5Service.createMemo5(content: '');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        DetailPage(index: memo5Service.memo5List.length - 1),
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
          title: Text("정말로 삭제하시겠습니까?"),
          actions: [
            TextButton(
              onPressed: () {
                Provider.of<Memo5Service>(context, listen: false)
                    .deleteMemo5(index: index);
                Navigator.pop(context);
              },
              child: Text(
                "확인",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            // 취소 버튼
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
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
    Memo5Service memo5Service = context.read<Memo5Service>();
    Memo5 memo5 = memo5Service.memo5List[index];

    contentController.text = memo5.content;

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
                          Navigator.pop(context);
                        },
                        child: const Text("취소"),
                      ),
                      TextButton(
                        onPressed: () {
                          memo5Service.deleteMemo5(index: index);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "확인",
                          style: TextStyle(color: Colors.pink),
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
            memo5Service.updateMemo5(index: index, content: value);
          },
        ),
      ),
    );
  }
}

class Memo5 {
  Memo5({
    required this.content,
  });

  String content;

  Map toJson() {
    return {'content': content};
  }

  factory Memo5.fromJson(json) {
    return Memo5(content: json['content']);
  }
}

class Memo5Service extends ChangeNotifier {
  Memo5Service() {
    loadMemo5List();
  }

  List<Memo5> memo5List = [];

  createMemo5({required String content}) {
    Memo5 memo5 = Memo5(content: content);
    memo5List.add(memo5);
    notifyListeners();
    saveMemo5List(); // Consumer<Memo5Service>의 builder 부분을 호출해서 화면 새로고침
  }

  updateMemo5({required int index, required String content}) {
    Memo5 memo5 = memo5List[index];
    memo5.content = content;
    notifyListeners();
    saveMemo5List();
  }

  deleteMemo5({required int index}) {
    memo5List.removeAt(index);
    notifyListeners();
    saveMemo5List();
  }

  saveMemo5List() {
    List memo5JsonList = memo5List.map((memo5) => memo5.toJson()).toList();
    // [{"content": "1"}, {"content": "2"}]

    String jsonString = jsonEncode(memo5JsonList);
    // '[{"content": "1"}, {"content": "2"}]'

    prefs.setString('memo5List', jsonString);
  }

  loadMemo5List() {
    String? jsonString = prefs.getString('memo5List');
    // '[{"content": "1"}, {"content": "2"}]'

    if (jsonString == null) return; // null 이면 로드하지 않음

    List memo5JsonList = jsonDecode(jsonString);
    // [{"content": "1"}, {"content": "2"}]

    memo5List = memo5JsonList.map((json) => Memo5.fromJson(json)).toList();
  }
}
