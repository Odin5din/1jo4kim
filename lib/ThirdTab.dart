import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:team7_work/FirstTab.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThirdTab extends StatefulWidget {
  const ThirdTab({Key? key}) : super(key: key);

  @override
  _ThirdTabState createState() => _ThirdTabState();
}

class _ThirdTabState extends State<ThirdTab> {
  TextEditingController _textEditingController = TextEditingController();
  String _TextFieldValue = '';

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
          Text(_TextFieldValue),
          Spacer(),
          Expanded(
            child: TextField(
              controller: _textEditingController,
            ),
          ),
        ],
      ),
    );
  }
}
