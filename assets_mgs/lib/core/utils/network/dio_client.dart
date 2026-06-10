
import 'package:dio/dio.dart';

import 'api_provider.dart';

class DioClient{


  final dio = Dio( BaseOptions(
    baseUrl: 'http://192.168.1.14:51213',
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 3),
  ));

}