import 'package:chuva_dart/app/data/models/event.dart';
import 'package:chuva_dart/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class MyCard extends StatefulWidget {
  MyCard({required this.event, super.key});

  Event event;

  @override
  State<MyCard> createState() => _MyCardState();

  static int colorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }

    try {
      final hexNum = int.parse(hexColor, radix: 16);
      return hexNum;
    } catch (e) {
      return 0xFF1976D2;
    }
  }
}

class _MyCardState extends State<MyCard> {
  bool? isFavorted = appPreferences.getBool('isFavorited');

  String formatHour(DateTime? dateTime){
    String date = DateFormat('HH:mm').format(dateTime!);
    return date;
  }

  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
      child: ElevatedButton(
        onPressed: () => context.push('/activity/${widget.event.id}'),
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
        child: Container(
          padding: const EdgeInsets.only(left: 5.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Color(
                MyCard.colorFromHex(widget.event.category?.color ?? '')
              ),
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
                     Text(
                      '${widget.event.typeModel?.title?.ptBr ?? ''} de ${formatHour(widget.event.start?.toLocal())} até ${formatHour(widget.event.end?.toLocal())}',
                      style: const TextStyle(fontSize: 13.0, color: Colors.black),
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
                  margin: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      widget.event.title?.ptBr ?? '', 
                      style: const TextStyle(
                        fontSize: 16.0, 
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                ),
                Row(
                  children: [
                    for (var p in widget.event.people ?? widget.event.people!.toList())
                      Text('${p?.name}, ',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey[600])
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}