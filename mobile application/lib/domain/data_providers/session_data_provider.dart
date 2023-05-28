import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _Keys {
  static const session = 'session';
}

class SessionDataProvider {
  final _secureStorage = FlutterSecureStorage();

  Future<String?> getSession() => _secureStorage.read(key: _Keys.session);
  Future<void> setSession(String value) => 
    _secureStorage.write(key: _Keys.session, value: value);
}

///чтобы хранить информацию, например идентификатор сессии, используемый
/// для отправки запроса от имени пользователя к серверу,
/// в защищенном виде используется модуль flutter_secure_storage 