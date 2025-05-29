import 'dart:convert';
import 'dart:developer';

import 'package:ai_school/config.dart';
import 'package:ai_school/core/providers/cache_provider.dart';
import 'package:ai_school/features/auth/providers/session_provider.dart';
import 'package:ai_school/providers/router_provider.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final clientProvider = Provider(
  (ref) => Dio(BaseOptions(baseUrl: Config.baseUrl))..config(ref),
);

extension DioExtension on Dio {
  void config(Ref ref) {
    interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));

    interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final session = ref.read(sessionProvider);
          final token = session?.token;
          if (token != null) {
            options.headers['Authorization'] = token;
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          log(response.statusCode?.toString() ?? '');
          log(jsonEncode(response.data));
          return handler.next(response);
        },
        onError: (e, handler) async {
          log(e.response?.statusCode?.toString() ?? '');
          log(e.response?.data.toString() ?? '');

          if(e.response?.statusCode == 401){
            await ref.read(cacheProvider).setSession(null);
            ref.read(routerProvider).refresh();
          }
          handler.reject(
            e.copyWith(
              message:
                  e.response != null
                      ? (e.response!.data is Map<String, dynamic>
                          ? e.response!.data!
                          : (e.response!.data as String).contains('html>')
                          ? e.toString()
                          : jsonDecode(e.response!.data)['message'] ?? jsonDecode(e.response!.data)['error'])
                      : e,
            ),
          );
        },
      ),
    );
  }
}
