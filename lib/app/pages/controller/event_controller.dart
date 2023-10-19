import 'package:chuva_dart/app/data/models/event.dart';
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
}