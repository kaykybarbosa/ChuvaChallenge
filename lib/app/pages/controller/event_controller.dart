import 'package:chuva_dart/app/data/models/event.dart';
import 'package:chuva_dart/app/data/models/people.dart';
import 'package:chuva_dart/app/data/repositories/event_repository.dart';
import 'package:flutter/material.dart';

class EventController{
  IEventRepository eventRepository;

  ValueNotifier<List<Event>> events = ValueNotifier<List<Event>>([]);

  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  EventController({required this.eventRepository}){
    loadEvents();
  }
  
  loadEvents() async{
    isLoading.value = true;
    events.value = await eventRepository.getEvents();
    isLoading.value = false;
  }

  Event getEventById(id){
    final event = events.value
        .firstWhere((event) => event.id == id);
    
    return event;
  }

  People getPeopleById(id){
    var people;
    events.value.forEach((event) {
      event.people?.forEach((p) {
        if (p?.id == id){
          people = p;
          return;
        }
       });
     });
    
    return people;
  }

  List<Event> getEventByPeopleId(peopleId){
    List<Event> peopleInEvent = [];

    events.value.forEach((event) {
      event.people?.forEach((people) {
        if (people?.id == peopleId){
          peopleInEvent.add(event);
        }
       });
     });

    return peopleInEvent;
  }

  List<Event> getEventParentById(id){
    List<Event> listParent = [];

    for (var event in events.value){
      if (event.parent == id){
        listParent.add(event);
      }
    }

    return listParent;
  }

  List<Event> getEventDependencyById(id){
    List<Event> listDependecy = [];

    for (var event in events.value){
      if (event.id == id){
        listDependecy.add(event);
      }
    }

    return listDependecy;
  }
}