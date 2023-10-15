import 'package:flutter/material.dart';

class MyBottonDate extends StatefulWidget {
  const MyBottonDate({required this.number, super.key});

  final String number;

  @override
  State<MyBottonDate> createState() => _MyBottonDateState();
}

class _MyBottonDateState extends State<MyBottonDate> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: 50.0,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        child: Text(
          widget.number,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
