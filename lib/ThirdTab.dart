import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:team7_work/FirstTab.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'FirstTab.dart';
import 'memo_service.dart';

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
                    Row(
                      children: [
                        Text("수정"),
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

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: memoList.isEmpty
                          ? Center(
                              child: Text("입력된 메모가 없습니다."),
                            )
                          : Column(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: memoList.length,
                                  itemBuilder: (context, index) {
                                    Memo memo = memoList[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListTile(
                                        title: Text(
                                          memo.content,
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
          ),
        );
      },
    );
  }
}
