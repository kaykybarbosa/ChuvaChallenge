import 'package:chuva_dart/app/data/models/event.dart';
import 'package:chuva_dart/app/pages/controller/event_controller.dart';
import 'package:chuva_dart/app/pages/widgets/my_calendar.dart';
import 'package:chuva_dart/app/pages/widgets/my_card.dart';
import 'package:chuva_dart/providers.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  Calendar({required this.currentDay, super.key});

  int currentDay;

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late EventController controller;

  @override
  void initState() {
    super.initState();
    controller = getIt<EventController>();
  }

  setCurrentDay(day) {
    setState(() {
      day = int.parse(day);
      widget.currentDay = day;
    });
  }

  List<int> idsTheParents = [];

  List<Event> showWithDependency(){
    List<Event> nonParentEvent = [];

    for (var event in controller.events.value){
      if (event.start?.day == widget.currentDay){
        if (event.parent == null){
          nonParentEvent.add(event);
        } else {
          idsTheParents.add(event.parent!);
        }
      }
    }

    return nonParentEvent;
  }

  @override
  Widget build(BuildContext context) {
    var events = showWithDependency();

    return Scaffold(
      appBar: myAppBar(),
      backgroundColor: const Color.fromARGB(255, 237, 236, 236),
      body: Column(
        children: [
          Expanded(
            child: AnimatedBuilder(
                animation:
                    Listenable.merge([controller.isLoading, controller.events]),
                builder: (context, child) {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView(
                    children: [
                      MyCalendar(
                        onPressed: setCurrentDay,
                      ),
                      for (var event in controller.events.value)
                        if (event.start?.day == widget.currentDay)
                          if (event.parent == null)
                            MyCard(event: event)
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }

  myAppBar() {
    return AppBar(
      elevation: 3,
      shadowColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.only(bottom: 2.0, top: 2.0),
          ),
        ),
        icon: const Icon(Icons.arrow_back),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Chuva ❤️ Flutter',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            const Text(
              'Programação',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.white),
              padding: const EdgeInsets.all(6.0),
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.blue[700],
                    ),
                    child: const Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.black,
                      size: 30.0,
                    ),
                  ),
                  const SizedBox(width: 50.0),
                  const Text(
                    'Exibindo todas atividades',
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
