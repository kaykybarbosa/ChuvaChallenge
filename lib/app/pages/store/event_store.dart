import 'package:chuva_dart/app/data/models/event.dart';
import 'package:chuva_dart/app/data/repositories/event_repository.dart';
import 'package:flutter/widgets.dart';

class EventStore{
  final IEventRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<List<Event>> state  = 
    ValueNotifier<List<Event>>([]);

  final ValueNotifier<String> erro = ValueNotifier<String>('');

  EventStore({required this.repository});

  Future getEvents() async{
    isLoading.value = true;

    try {
      final result = await repository.getEvents();
      state.value = result;
    } catch (e) {
      erro.value = e.toString();
    }
    isLoading.value = false;
  }
}