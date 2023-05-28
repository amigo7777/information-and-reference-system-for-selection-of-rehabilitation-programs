import 'dart:convert';
import 'dart:io';

import 'package:flutter_mobile_vkr/domain/entity/post_program.dart';

/// запрашивает данны с сервера рассположенного на локальном хосте 
/// является основным файлом связывающим мобильное приложение и серверную часть

class ApiClient {
  final _client = HttpClient();
  static const _host = 'http://10.0.2.2:3080';

  Future<String> auth({
    required String username,
    required String password,
  }) async {
    final validAuth =
        await validateUser(username: username, password: password);
    return validAuth;
  }

  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final uri = Uri.parse('$_host$path');
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }

  Future<dynamic> getprogram() async {
    // final url = Uri.parse('$_host/program');
    final url = _makeUri('/program');
    final request = await _client.getUrl(url);
    final response = await request.close();

    final json = (await response.jsonDecode()) as Map<String, dynamic>;

    return json;
  }

  Future<dynamic> validateUser(
      {required String username, required String password}) async {

    final url = _makeUri('/auth');
    
    final parametres = <String, dynamic>{
      'username': username,
      'password': password,
    };
    final request = await _client.postUrl(url);

    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parametres));

    final response = await request.close();

    final json = (await response.jsonDecode()) as Map<String, dynamic>;

    return json;
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then<dynamic>((v) => json.decode(v));
  }
}
