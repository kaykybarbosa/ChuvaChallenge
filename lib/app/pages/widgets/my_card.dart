import 'package:chuva_dart/main.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  MyCard({super.key});

  bool? isFavorted = appPreferences.getBool('isFavorited');

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
            padding: const EdgeInsets.only(left: 24.0, bottom: 10.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Apresentação de Pôster de 07:00 até 08:00',
                      style: TextStyle(fontSize: 13.0, color: Colors.black),
                    ),
                    isFavorted.toString().contains('true')
                    ? const Icon(
                      Icons.turned_in_rounded, 
                      color: Colors.blueGrey)
                    : const Text('')
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(right: 5.0),
                  margin: const EdgeInsets.only(right: 5.0),
                  child: const Text(
                    'Astrofísica Relativista: Explorando as Previsões de Einstein',
                    style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600, color: Colors.black),
                    maxLines: 2,
                  ),
                ),
                Text(
                  'Stephen William Hawking',
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}