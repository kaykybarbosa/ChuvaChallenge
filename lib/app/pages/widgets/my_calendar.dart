import 'package:flutter/material.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({super.key, required this.onPressed});

  final Function onPressed;

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  final List<String> numbers = ['26', '27', '28', '29', '30'];

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
          for (var number in numbers)
            myBottonDate(number: number, onPressed: widget.onPressed)
        ],
      ),
    );
  }

Widget myBottonDate({number, onPressed}){
  return SizedBox(
      height: 50.0,
      width: 50.0,
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(0),
        ),
        child: TextButton(
          onPressed: () {
            onPressed(number);
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue[700],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          child: Text(
            number,
            style: TextStyle(color: Colors.grey[400]),
          ),
        ),
      ),
    );
}
}
