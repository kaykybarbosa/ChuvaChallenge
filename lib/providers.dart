import 'package:chuva_dart/app/data/http/http_client.dart';
import 'package:chuva_dart/app/data/repositories/event_repository.dart';
import 'package:chuva_dart/app/pages/controller/event_controller.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupProviders(){
  getIt.registerLazySingleton<IEventRepository>(() => EventRepository(client: HttpClient()));
  getIt.registerLazySingleton<EventController>(() => EventController(
    eventRepository: getIt<IEventRepository>()));
}