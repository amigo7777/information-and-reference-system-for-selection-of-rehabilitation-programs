import 'package:flutter/material.dart';
import 'package:flutter_mobile_vkr/domain/api_client.dart';
import 'package:flutter_mobile_vkr/domain/data_providers/session_data_provider.dart';
import 'package:pedantic/pedantic.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _sessionDataProvider = SessionDataProvider();

  final nameController = TextEditingController();
  //создание контроллера для считывания текста с ввода
  final passwordController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;
  bool get canStartAuth => !_isAuthProgress;

  Future<void> auth(BuildContext context) async {
    final nameuser = nameController.text;
    final password = passwordController.text;
    if (nameuser.isEmpty || password.isEmpty) {
      _errorMessage = 'Заполните логин и пароль';
      notifyListeners();
      return;
    }
    _errorMessage = null;
    _isAuthProgress = true;
    notifyListeners();
    String? session;
    
    //удалить навигатор отсюда, разобраться почему не проходит авторизация
    unawaited(Navigator.of(context).pushNamed('/main_screen'));

    try {
      session = await _apiClient.validateUser( // поменять validateUser на auth
        username: nameuser,
        password: password,
      );
    } catch (e) {
      _errorMessage = 'Неправильный логин, пароль!';
    }
    _isAuthProgress = false;
    if (_errorMessage != null) {
      notifyListeners();
      return;
    }

    if (session == null) {
      _errorMessage = 'Неизвестная ошибка';
      notifyListeners();
      return;
    }

    await _sessionDataProvider.setSession(session);

    unawaited(Navigator.of(context).pushNamed('/main_screen'));
    
  }
}

class AuthProvider extends InheritedNotifier {
  final AuthModel model;
  const AuthProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static AuthProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthProvider>();
  }

  static AuthProvider? read(BuildContext context) {
    final widget =
        context.getElementForInheritedWidgetOfExactType<AuthProvider>()?.widget;
    return widget is AuthProvider ? widget : null;
  }
}
