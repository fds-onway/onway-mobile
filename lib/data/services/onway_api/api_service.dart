import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:onway/util/exceptions/app_exception.dart';
import 'package:result_dart/functions.dart';
import 'package:result_dart/result_dart.dart';

final _url = "api.crassus.app.br";

class ApiService {
  final client = HttpClient();

  static final ApiService _instance = ApiService._internal();
  final _baseHeader = {
    'Content-Type': 'application/json',
  };

  factory ApiService() {
    return _instance;
  }

  ApiService._internal();

  AsyncResult<http.Response> get({required String path}) async {
    try {
      final request = await http.get(
        Uri.https(_url, path),
        headers: _baseHeader,
      );
      return successOf(request);
    } on SocketException catch (e) {
      return failureOf(Exception('No Internet connection: $e'));
    } catch (e) {
      return failureOf(Exception('Unexpected error: $e'));
    }
  }

  AsyncResult<http.Response> post({
    required String path,
    Map<String, String>? body,
  }) async {
    try {
      final request = await http.post(
        Uri.https(_url, path),
        body: jsonEncode(body),
        headers: _baseHeader,
      );
      return successOf(request);
    } on SocketException catch (e) {
      return failureOf(Exception('No Internet connection: $e'));
    } catch (e) {
      return failureOf(Exception('Unexpected error: $e'));
    }
  }
}

class NoInternetConnectionException extends AppException {
  NoInternetConnectionException([super.message = 'No internet connection']);
}
