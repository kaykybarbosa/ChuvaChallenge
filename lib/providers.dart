import 'package:chuva_dart/app/data/http/http_client.dart';
import 'package:chuva_dart/app/data/repositories/event_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupProviders(){
  getIt.registerLazySingleton<IEventRepository>(() => EventRepository(client: HttpClient()));
}