import 'package:flutter/material.dart';
import 'package:team7_work/FirstTab.dart';

class FifthTab extends StatelessWidget {
  const FifthTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(''),
          Text(
            '김지견',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              Text("경력"),
              TextField(),
            ],
          ),
          Row(
            children: [
              Text("경력"),
              TextField(),
            ],
          ),
          TextField(),
          TextField(),
        ],
      ),
    );
  }
}
