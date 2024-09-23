import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String name;
  final String koreanName;
  const Button({super.key, required this.name, required this.koreanName});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  late String displayedText;
  bool isTab = false;
  @override
  void initState() {
    super.initState();
    displayedText = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        //버튼 탭
        setState(() {
          displayedText = widget.koreanName;
          isTab = true;
        });
      },
      onTapUp: (_) {
        //손 뗌
        setState(() {
          displayedText = widget.name;
          isTab = false;
        });
      },
      onTapCancel: () {
        //탭 취소
        setState(() {
          displayedText = widget.name;
          isTab = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green.shade200,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Text(
            displayedText,
            style: TextStyle(
              fontSize: 14,
              decoration: isTab ? TextDecoration.underline : null,
            ),
          ),
        ),
      ),
    );
  }
}
