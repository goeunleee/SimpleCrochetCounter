import 'package:flutter/material.dart';

import '../widgets/button.dart';

class MoreInfo extends StatelessWidget {
  const MoreInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4eddb),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green.shade100,
        title: const Text('유용한 정보'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const Text("버튼을 누르면 약어의 의미를 알 수 있어요"),
              const SizedBox(
                height: 50,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                    name: "slip/ss",
                    koreanName: "빼뜨기",
                  ),
                  SizedBox(width: 10),
                  Button(name: "ch", koreanName: "사슬뜨기"),
                  SizedBox(width: 10),
                  Button(name: "sc", koreanName: "짧은 뜨기"),
                ],
              ),
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(name: "half-double", koreanName: "긴뜨기"),
                  SizedBox(width: 10),
                  Button(name: "double", koreanName: "한길 긴뜨기"),
                  SizedBox(width: 10),
                  Button(name: "treble(tc)", koreanName: "두길 긴뜨기"),
                ],
              ),
              const SizedBox(height: 40),
              const Text("기호 모음"),
              Image.asset(
                'assets/images/sign.png',
                width: 800,
                height: 400,
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
