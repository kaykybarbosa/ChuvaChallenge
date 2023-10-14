import 'package:chuva_dart/app/data/http/http_client.dart';
import 'package:chuva_dart/app/pages/store/event_store.dart';
import 'package:chuva_dart/app/data/repositories/event_repository.dart';
import 'package:chuva_dart/app/pages/widgets/my_app_bar.dart';
import 'package:chuva_dart/app/pages/widgets/my_botton_date.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _currentDate = DateTime(2023, 11, 26);
  bool _clicked = false;

  String text = '''
    Mesa redonda de 07:00 até 08:00
    A Física dos Buracos Negros Supermassivos
    Stephen William Hawking
''';

  final EventStore store =
      EventStore(repository: EventRepository(client: HttpClient()));

  // @override
  // void initState() {
  //   super.initState();
  //   store.getEvents();
  // }

  void _changeDate(DateTime newDate) {
    setState(() {
      _currentDate = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    MyAppBar myAppBar = MyAppBar(context: context);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 236, 236),
      appBar: myAppBar.get(),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.lightBlue,
                margin: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  children: [
                    Container(
                      color: Colors.white,
                      width: 50.0,
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
                // margin: const EdgeInsets.only(left: 10.0, top: 15.0, bottom: 5.0, right: 10.0),
              ),
              Container(
                padding: const EdgeInsets.only(left: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.lightBlue),
                margin: const EdgeInsets.only(
                    left: 10.0, top: 15.0, bottom: 5.0, right: 10.0),
                child: Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
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
                        Text('Mesa redonda de 07:00 até 08:00'),
                        Text(
                          'A Física dos Buracos Negros Supermassivos',
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                          maxLines: 2,
                        ),
                        Text(
                          'Stephen William Hawkings',
                          style: TextStyle(fontSize: 15.0, color: Color.fromARGB(255, 156, 156, 156)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Container(
              //   width: 350,
              //   decoration: const BoxDecoration(color: Colors.amber),
              //   child: const Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text('Mesa redonda de 07:00 até 08:00'),
              //       Text(
              //         'A Física dos Buracos Negros Supermassivos',
              //         style: TextStyle(fontSize: 18.0),
              //       ),
              //       Text(
              //         'Stephen William Hawkings',
              //         style: TextStyle(fontSize: 15.0),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
