import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';

class ThirdTab extends StatefulWidget {
  const ThirdTab({Key? key}) : super(key: key);

  @override
  _ThirdTabState createState() => _ThirdTabState();
}

class _ThirdTabState extends State<ThirdTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Memo3Service>(
      builder: (context, memo3Service, child) {
        List<Memo3> memo3List = memo3Service.memo3List;

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
                      '김현준',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '[27, ISFP]',
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
                            Text("https://velog.io/@boomshh"),
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
                      child: memo3List.isEmpty
                          ? const Center(
                              child: Text("입력된 메모가 없습니다."),
                            )
                          : Column(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: memo3List.length,
                                  itemBuilder: (context, index) {
                                    Memo3 memo3 = memo3List[index];
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
                                          memo3.content,
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
                memo3Service.createMemo3(content: '');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        DetailPage(index: memo3Service.memo3List.length - 1),
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
                Provider.of<Memo3Service>(context, listen: false)
                    .deleteMemo3(index: index);
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
    Memo3Service memo3Service = context.read<Memo3Service>();
    Memo3 memo3 = memo3Service.memo3List[index];

    contentController.text = memo3.content;

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
                          memo3Service.deleteMemo3(index: index);
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
            memo3Service.updateMemo3(index: index, content: value);
          },
        ),
      ),
    );
  }
}

class Memo3 {
  Memo3({
    required this.content,
  });

  String content;

  Map toJson() {
    return {'content': content};
  }

  factory Memo3.fromJson(json) {
    return Memo3(content: json['content']);
  }
}

class Memo3Service extends ChangeNotifier {
  Memo3Service() {
    loadMemo3List();
  }

  List<Memo3> memo3List = [];

  createMemo3({required String content}) {
    Memo3 memo3 = Memo3(content: content);
    memo3List.add(memo3);
    notifyListeners();
    saveMemo3List(); // Consumer<MemoService>의 builder 부분을 호출해서 화면 새로고침
  }

  updateMemo3({required int index, required String content}) {
    Memo3 memo3 = memo3List[index];
    memo3.content = content;
    notifyListeners();
    saveMemo3List();
  }

  deleteMemo3({required int index}) {
    memo3List.removeAt(index);
    notifyListeners();
    saveMemo3List();
  }

  saveMemo3List() {
    List memo3JsonList = memo3List.map((memo3) => memo3.toJson()).toList();
    // [{"content": "1"}, {"content": "2"}]

    String jsonString = jsonEncode(memo3JsonList);
    // '[{"content": "1"}, {"content": "2"}]'

    prefs.setString('memo3List', jsonString);
  }

  loadMemo3List() {
    String? jsonString = prefs.getString('memo3List');
    // '[{"content": "1"}, {"content": "2"}]'

    if (jsonString == null) return; // null 이면 로드하지 않음

    List memo3JsonList = jsonDecode(jsonString);
    // [{"content": "1"}, {"content": "2"}]

    memo3List = memo3JsonList.map((json) => Memo3.fromJson(json)).toList();
  }
}
