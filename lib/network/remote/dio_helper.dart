import 'package:dio/dio.dart';
import 'package:news_app/constants/constants.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: Constants.baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData(String category) {
    return dio!.get(
      Constants.method,
      queryParameters: {
        'country': 'us',
        'category': category,
        'apiKey': '8ed4a86ffcc24da2b91f2183831bc3fc',
      },
    );
  }

  static Future<Response> getSearchData(String search) {
    return dio!.get(
      Constants.searchMethod,
      queryParameters: {
        'q': search,
        'apiKey': '8ed4a86ffcc24da2b91f2183831bc3fc',
      },
    );
  }
}
