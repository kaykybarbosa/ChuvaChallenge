import 'package:chuva_dart/app/data/models/event.dart';
import 'package:chuva_dart/app/pages/event_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Activity extends StatefulWidget {
  const Activity({super.key,required this.event});

  final Event event;

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        leading: IconButton(
          onPressed: (){
            context.push('/calendar/${widget.event.start?.day}');
          },  
          icon: const Icon(Icons.arrow_back),
        ),
        shadowColor: Colors.black,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text('Chuva ❤️ Flutter'),
      ),
      body: EventPage(event: widget.event),
    );
  }
}