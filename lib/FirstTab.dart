import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team7_work/FirstTab.dart';
import 'package:team7_work/SecondTap.dart';
import 'package:team7_work/ThirdTab.dart';
import 'package:team7_work/FirstTab.dart';
import 'package:team7_work/FourthTab.dart';
import 'package:team7_work/FifthTab.dart';

class FirstTab extends StatelessWidget {
  FirstTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // 배경색을 검은색으로 설정
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color(0xff050521)), // 내용 영역을 흰색으로 설정
          child: ListView(
            children: [
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        'Introduce Our Team!',
                        style: TextStyle(
                            fontFamily: 'Rowdies',
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '4kim / This is me',
                        style: TextStyle(
                            color: Color.fromARGB(255, 165, 164, 164),
                            fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                // 첫 번째 타일
                decoration: BoxDecoration(
                    color: Color(0xff9C74ED),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/fonts/images/4BC877F9-189E-44C9-A012-6CC4EB15E2AB_1_105_c.jpeg'),
                      radius: 50,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondTab(),
                          ),
                        );
                      },
                      child: Text(
                        "JiGyeon",
                        style: TextStyle(
                            fontFamily: 'ArchitectsDaughter',
                            color: Colors.black87,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
              Transform.translate(
                // 두 번째 타일
                offset: Offset(0, 0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 243, 245, 247),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/fonts/images/C4BED5C0-3A74-488C-97D5-C8E2A4B2AD96_1_105_c.jpeg'),
                        radius: 50,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ThirdTab(),
                            ),
                          );
                        },
                        child: Text(
                          'HyunJun',
                          style: TextStyle(
                              fontFamily: 'ArchitectsDaughter',
                              color: Colors.black87,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                // 세 번째 타일
                offset: Offset(0, 0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff7AAAE6),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/fonts/images/E4268D0C-615F-4BA9-B6AB-E6EB0B7D0E18_1_105_c.jpeg'),
                        radius: 50,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FourthTab(),
                            ),
                          );
                        },
                        child: Text(
                          'MinJi ',
                          style: TextStyle(
                              fontFamily: 'ArchitectsDaughter',
                              color: Colors.black87,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                // 네 번째 타일
                offset: Offset(0, 0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 243, 245, 247),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/fonts/images/IMG_2263.jpeg'),
                        radius: 50,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FifthTab()),
                          );
                        },
                        child: Text(
                          'MinJun',
                          style: TextStyle(
                              fontFamily: 'ArchitectsDaughter',
                              color: Color.fromARGB(255, 21, 21, 22),
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
