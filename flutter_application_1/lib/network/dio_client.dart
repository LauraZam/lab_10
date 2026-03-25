import 'package:dio/dio.dart';
import 'rest_client.dart';

class DioClient {
  late RestClient client;

  DioClient() {
    final dio = Dio();

    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

    client = RestClient(dio);
  }
}