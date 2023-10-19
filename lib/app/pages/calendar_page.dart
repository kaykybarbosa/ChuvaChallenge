import 'package:chuva_dart/app/pages/controller/event_controller.dart';
import 'package:chuva_dart/app/pages/widgets/my_app_bar.dart';
import 'package:chuva_dart/app/pages/widgets/my_calendar.dart';
import 'package:chuva_dart/app/pages/widgets/my_card.dart';
import 'package:chuva_dart/providers.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late EventController controller;

  @override
  void initState() {
    super.initState();
    controller = getIt<EventController>();
    print('INIT: ${controller.events.value.length}');
  }

  @override
  Widget build(BuildContext context) {
    final MyAppBar myAppBar = MyAppBar(context: context);

    return Scaffold(
        appBar: myAppBar.get(),
        backgroundColor: const Color.fromARGB(255, 237, 236, 236),
        body: Column(
          children: [
            const MyCalendar(),
            Expanded(
              child: AnimatedBuilder(
                animation: Listenable.merge([
                  controller.isLoading,
                  controller.events
                ]), 
                builder: (context, child) {
                  if (controller.isLoading.value){
                    return const Center(child: CircularProgressIndicator());
                  }

                  return ListView(
                    // separatorBuilder: (context, index) => const SizedBox(
                    //   height: 32,
                    // ), 
                    // itemCount: controller.events.value.length,
                    // itemBuilder: (context, index) {
                    //   MyCard(event: controller.events.value[index],);
                    // }
                    children: [
                      for (var event in controller.events.value)
                        MyCard(event: event)
                    ],
                    );
                } 
                ),
            )
          ],
        ));
  }
}

// Column(
//         children: [
//           const MyCalendar(),
//           Expanded(
//             child: ListView(
//               children: [
                
//               ],
//             )
//           ),
//         ],
//       ),

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