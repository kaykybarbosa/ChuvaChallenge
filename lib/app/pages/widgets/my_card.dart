import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
        child: Container(
          padding: const EdgeInsets.only(left: 5.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.lightBlue,
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 2),
                    blurRadius: 4.0,
                    spreadRadius: 0)
              ]),
          child: Container(
            padding: const EdgeInsets.only(left: 25.0, top: 10.0, bottom: 10.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mesa redonda de 07:00 até 08:00',
                  style: TextStyle(fontSize: 13.0),
                ),
                Text(
                  'A Física dos Buracos Negros Supermassivos',
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
                  maxLines: 2,
                ),
                Text(
                  'Stephen William Hawking',
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Color.fromARGB(255, 156, 156, 156)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}