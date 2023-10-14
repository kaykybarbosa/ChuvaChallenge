import 'dart:convert';

import 'package:chuva_dart/app/data/http/http_client.dart';
import 'package:chuva_dart/app/data/models/event.dart';

abstract class IEventRepository{
  Future<List<Event>> getEvents();
}

class EventRepository implements IEventRepository{
  final IHttpClient client;

  EventRepository({required this.client});

  @override
  Future<List<Event>> getEvents() async{
    final response = await client.get(
      url: "https://raw.githubusercontent.com/chuva-inc/exercicios-2023/master/dart/assets/activities.json"
    );

    if (response.statusCode == 200){
      final List<Event> events = [];
      
      Map<String, dynamic> json = jsonDecode(response);

      json['data'].map((item) {
        final Event event = Event.fromJson(item);
        events.add(event);
      });
    }

    final List<Event> result = [];
    return  result;
  }

}