import 'package:dio/dio.dart';

abstract class IHttpClient{
  Future get({required String url});
}

class HttpClient implements IHttpClient{
  final dio = Dio();

  @override
  Future get({required String url}) async{
    return await dio.get(url);
  }
}