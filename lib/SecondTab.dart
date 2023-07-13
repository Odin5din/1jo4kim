import 'dart:convert';

import 'package:flutter/material.dart';
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
                      child: Image.network(
                        'https://cdn2.thecatapi.com/images/6bt.jpg',
                        width: 170,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      '김지견',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '[34, INFP]',
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
                            Text("블로그 주소"),
                            SizedBox(width: 10),
                            Text("https://odin5din.tistory.com/"),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text("강점"),
                            SizedBox(width: 15),
                            Text("끈기있는 엉덩이"),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text("앞으로의 각오"),
                            SizedBox(width: 10),
                            Text("끈기있는 엉덩이"),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text("느낀점"),
                            SizedBox(width: 15),
                            Text("끈기있는 엉덩이"),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: memo2List.isEmpty
                          ? const Center(
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
                                          memo2.content,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
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
              child: const Icon(Icons.edit),
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

  void showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("정말로 삭제하시겠습니까?"),
          actions: [
            TextButton(
              onPressed: () {
                Provider.of<Memo2Service>(context, listen: false)
                    .deleteMemo2(index: index);
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
                          memo2Service.deleteMemo2(index: index);
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
