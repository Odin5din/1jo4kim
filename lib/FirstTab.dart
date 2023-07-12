import 'package:flutter/material.dart';
import 'SecondTab.dart';
import 'ThirdTab.dart';
import 'FourthTab.dart';
import 'FifthTab.dart';

class FirstTab extends StatelessWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // 배경색을 검은색으로 설정
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration:
              const BoxDecoration(color: Color(0xff050521)), // 내용 영역을 흰색으로 설정
          child: ListView(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        'Introduce Our Team!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'This is me',
                        style: TextStyle(
                          fontFamily: 'RubikDirt',
                          color: Color.fromARGB(255, 165, 164, 164),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff9C74ED),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/pepe_480.png'),
                      radius: 50,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SecondTab(),
                          ),
                        );
                      },
                      child: const Text(
                        'JiGyeon',
                        style: TextStyle(
                          fontFamily: 'ArchitectsDaughter',
                          color: Colors.black87,
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Transform.translate(
                // 두 번째 타일
                offset: const Offset(0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 243, 245, 247),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/dog_240.jpg'),
                        radius: 50,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ThirdTab(),
                            ),
                          );
                        },
                        child: const Text(
                          'HyunJun',
                          style: TextStyle(
                            fontFamily: 'ArchitectsDaughter',
                            color: Colors.black87,
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                // 세 번째 타일
                offset: const Offset(0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff7AAAE6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/piglet_720.jpg'),
                        radius: 50,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FourthTab(),
                            ),
                          );
                        },
                        child: const Text(
                          'MinJi',
                          style: TextStyle(
                            fontFamily: 'ArchitectsDaughter',
                            color: Colors.black87,
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                // 네 번째 타일
                offset: const Offset(0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 243, 245, 247),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/mycode_360.gif'),
                        radius: 50,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FifthTab(),
                            ),
                          );
                        },
                        child: const Text(
                          'MinJun',
                          style: TextStyle(
                            fontFamily: 'ArchitectsDaughter',
                            color: Color.fromARGB(255, 21, 21, 22),
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
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
