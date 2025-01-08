import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };

    return await dio!.get(
      url,
      queryParameters: query,
    );
  }
}

String token =
    'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NzlkMzU1ZDBlMThjMTA3NWE4YmZjZTU4Y2E4ZDUxNCIsIm5iZiI6MTczNTkxNjI4OS42MzYsInN1YiI6IjY3NzdmYjAxNDk2ZGQ5NTJjODcyNWFlOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HB-OgQU0tscsNWgiEaBXOY2tijd7x_v11QGff4qwiFc';
