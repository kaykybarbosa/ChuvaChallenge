import 'package:chuva_dart/app/data/models/event.dart';
import 'package:chuva_dart/app/data/routes/routes_constants.dart';
import 'package:chuva_dart/app/pages/controller/event_controller.dart';
import 'package:chuva_dart/app/pages/event_page.dart';
import 'package:chuva_dart/app/pages/profile_page.dart';
import 'package:chuva_dart/providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Activity extends StatefulWidget {
  Activity({super.key,required this.event});

  Event event;

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  var currentScreen;
  late List<Event> events;
  Event event = Event();

  void goToProfileScreen(imageProfile){
    setState(() {
      currentScreen = ProfilePage(image: imageProfile);
    });
  }

  @override
  void initState() {
    super.initState();
    currentScreen = EventPage(event: widget.event, goTo: goToProfileScreen);
    events = getIt<EventController>().events.value;
    event = events.firstWhere((element) => element.id == 8924);

    print('===========================');
    print(event);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.black,
        leading: IconButton(
            onPressed: (){
              if  (currentScreen.toString().contains('EventPage')){
                GoRouter.of(context).pushNamed(AppRoutesConstants.calendarRouteName);
              } else {
                GoRouter.of(context).pushNamed(AppRoutesConstants.activityRouteName);
              }
            },
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text('Chuva ❤️ ${event.title?.ptBr ?? 'FALOU'}'),
      ),
      body: currentScreen,
    );
  }
}