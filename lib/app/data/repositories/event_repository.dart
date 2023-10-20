import 'dart:convert';
import 'dart:io';

import 'package:chuva_dart/app/data/http/http_client.dart';
import 'package:chuva_dart/app/data/models/event.dart';
import 'package:chuva_dart/configs.dart';

abstract class IEventRepository {
  Future<List<Event>> getEvents();
}

class EventRepository implements IEventRepository {
  final IHttpClient client;

  EventRepository({required this.client});

  @override
  Future<List<Event>> getEvents() async {
    var responseMaster;

    var response = await client.get(url: BASE_API);

    if (response.statusCode == 200) {
      var firstJson = jsonDecode(response.data);

      responseMaster = firstJson['data'];

      while (firstJson['links']['next'] != null) {
        response = await client.get(url: firstJson['links']['next']);

        if (response.statusCode == 200) {
          var json = jsonDecode(response.data);

          responseMaster = responseMaster + json['data'];

          firstJson = json;
        }
      }
    }

    return responseMaster.map<Event>((event) => Event.fromJson(event)).toList();
  }
}