import 'package:chuva_dart/app/data/http/http_client.dart';
import 'package:chuva_dart/app/data/models/event.dart';
import 'package:chuva_dart/app/pages/store/event_store.dart';
import 'package:chuva_dart/app/data/repositories/event_repository.dart';
import 'package:chuva_dart/app/pages/widgets/my_app_bar.dart';
import 'package:chuva_dart/app/pages/widgets/my_botton_date.dart';
import 'package:chuva_dart/app/pages/widgets/my_card.dart';
import 'package:chuva_dart/providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _currentDate = DateTime(2023, 11, 26);
  bool _clicked = false;

  String text = '''
    Mesa redonda de 07:00 até  8:00
    A Física dos Buracos Negros Supermassivos
    Stephen William Hawking
''';

  // final EventStore store =
  //     EventStore(repository: EventRepository(client: HttpClient()));
  // @override
  // void initState() {
  //   super.initState();
  //   store.getEvents();
  // }

  late IEventRepository eventRepository ;
  late Future<List<Event>> events;

  setEvents() async{
    events =  eventRepository.getEvents();
  }

  @override
  void initState() {
    super.initState();
    eventRepository = getIt<IEventRepository>();
    setEvents();
  }

  void _changeDate(DateTime newDate) {
    setState(() {
      _currentDate = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
  final MyAppBar myAppBar = MyAppBar(context: context);

    

    // MyAppBar myAppBar = MyAppBar(context: context);
    return Scaffold(
      // Color.fromARGB(255, 237, 236, 236)
      backgroundColor: Colors.white,
      appBar: myAppBar.get(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
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
              ),
              Expanded(
                child: ListView(
                  children: [

                  ],
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ListView(
//                   children: [
//                     MyCard(),
//                     Container(
//                       margin: const EdgeInsets.symmetric(
//                           vertical: 5.0, horizontal: 10.0),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5.0)),
//                       child: ElevatedButton(
//                         onPressed: (){
//                           context.push('/activity/10');
//                         } , 
//                         style: ElevatedButton.styleFrom(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                             padding: const EdgeInsets.all(0)),
//                         child: Container(
//                           padding: const EdgeInsets.only(left: 5.0),
//                           decoration: BoxDecoration(
//                               color: Colors.lightBlue,
//                               borderRadius: BorderRadius.circular(5.0),
//                               boxShadow: const [
//                                 BoxShadow(
//                                     color: Colors.grey,
//                                     offset: Offset(0, 2),
//                                     blurRadius: 4.0,
//                                     spreadRadius: 0)
//                               ]),
//                           child: Container(
//                             padding: const EdgeInsets.only(
//                                 left: 20.0, top: 10.0, bottom: 10.0, right: 15.0),
//                             decoration: const BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(5.0),
//                                 bottomRight: Radius.circular(5.0),
//                               ),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   'Palestra de 07:00 até 08:00',
//                                   style: TextStyle(
//                                       color: Colors.black, fontSize: 12.0),
//                                 ), // row com icon vem aqui
//                                 const Text(
//                                   'Biossinais em Mundos Oceânicos: Europa e Encélado',
//                                   style: TextStyle(
//                                       fontSize: 15.0,
//                                       fontWeight: FontWeight.w500,
//                                       color: Colors.black),
//                                 ),
//                                 Text(
//                                   'Neil deGrasse Tyson, Stephen William Hawking',
//                                   style: TextStyle(
//                                       fontSize: 15.0,
//                                       color:
//                                           Colors.grey[600]),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 )