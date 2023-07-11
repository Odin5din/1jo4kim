import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:team7_work/FirstTab.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'FirstTab.dart';
import 'memo_service.dart';

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
