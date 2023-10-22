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
    return events.value.firstWhere((event) => event.id == id);
  }

  People getPeopleById(id){
    People? people;
    for (var event in events.value) {
      event.people?.forEach((p) {
        if (p?.id == id){
          people = p;
          return;
        }
       });
     }

    return people ?? People();
  }

  List<Event> getEventByPeopleId(peopleId){
    List<Event> peopleInEvent = [];

    for (var event in events.value) {
      event.people?.forEach((people) {
        if (people?.id == peopleId){
          peopleInEvent.add(event);
        }
      });
    }

    return peopleInEvent;
  }

  List<Event> getEventParentById(id){
    return events.value.where((event) => event.parent == id).toList();
  }

  List<Event> getEventDependencyById(id){
    return events.value.where((event) => event.id == id).toList();
  }
}