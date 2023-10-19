import 'dart:convert';

import 'package:chuva_dart/app/data/http/http_client.dart';
import 'package:chuva_dart/app/data/models/event.dart';
import 'package:chuva_dart/configs.dart';

abstract class IEventRepository{
  Future<List<Event>> getEvents();
}

class EventRepository implements IEventRepository{
  final IHttpClient client;

  List<Event> events = [];

  EventRepository({required this.client});

  @override
  Future<List<Event>> getEvents() async{
    final response = await client.get(
      url: BASE_API
    );

    if (response.statusCode == 200){
      final json = jsonDecode(response.data);
      final eventsJson = json['data'];  

      for(var event in eventsJson){
        events.add(Event.fromJson(event as Map<String, dynamic>));
      }
    }

    return events;
  }
}