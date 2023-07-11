import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:team7_work/FirstTab.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'FirstTab.dart';
import 'memo_service.dart';

class FourthTab extends StatelessWidget {
  const FourthTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'First Tab',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
