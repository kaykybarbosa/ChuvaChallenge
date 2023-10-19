import 'package:chuva_dart/app/pages/widgets/my_botton_date.dart';
import 'package:flutter/material.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({super.key});

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[700],
      margin: const EdgeInsets.only(top: 1.0, bottom: 10.0),
      child: Row(
        children: [
          Container(
            color: Colors.white,
            width: 49.0,
            height: 54.0,
            child: const Text(
              ' Nov 2023',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
            ),
          ),
          const MyBottonDate(number: '26'),
          const MyBottonDate(number: '27'),
          const MyBottonDate(number: '28'),
          const MyBottonDate(number: '29'),
          const MyBottonDate(number: '30'),
        ],
      ),
    );
  }
}
