
import 'package:dio/dio.dart';

import 'api_provider.dart';

class DioClient{


  final dio = Dio( BaseOptions(
    baseUrl: ApiProvider.baseUrl,
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 3),
  ));

}