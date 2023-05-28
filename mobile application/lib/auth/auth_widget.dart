import 'package:flutter/material.dart';
import 'package:flutter_mobile_vkr/auth/auth_model.dart';
import 'package:flutter_mobile_vkr/auth/restration_widget.dart';
import 'package:flutter_mobile_vkr/images.dart';
import 'package:flutter_mobile_vkr/main_screen/main_screen_widget.dart';

///Виджет экрана авторизации, при переходе ссылается на файл auth_model.dart
///который реализовывет валидацию введенных данных с данными с сервера,
///данные сервера запрашиваются из папки entity файл api_client.dart


class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  bool _isobscure = true;
  // final _nameController =
  //     TextEditingController(); //создание контроллера для считывания текста с ввода
  // final _passwordController = TextEditingController();

  // void _auth() {
  //   final nickname = _nameController.text;
  //   final password = _passwordController.text;
  //   if (nickname == 'admin' && password == 'admin') {
  //     print('open app');
  //   } else {
  //     print('show error');
  //   }
  // }

  // String nickname = '';
  // String password = '';

  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.read(context)?.model;
    return Scaffold(
      body: Container(
        // градиент заднего фона
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF034a5c),
            Color(0xFF237c60),
            Color(0xFF559f46),
            Color(0xFFb6d606),
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
        // основной экран дизайна
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Transform(
                      // виджет трансформ используется для наклона виджета (в данном случае не используется)
                      alignment: Alignment.topLeft,
                      transform: Matrix4.rotationZ(
                          0.0), // чтобы наклонить изображение измените значение 0.0
                      child: const SizedBox(
                        child: Image(
                            image: AppImages.logo), // изображение логотипа
                        height: 200,
                        width: 200,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Авторизация',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const _ErrorMessageWidget(),
                    // форма ввода имени/псевдонима пользователя
                    TextField(
                      controller: model?.nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.black54)),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        labelText: 'Username',
                        // isCollapsed: true,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    // форма ввода пароля пользователя
                    TextField(
                      controller: model?.passwordController,
                      obscureText: _isobscure, // закрашивание пароля
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black54),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        labelText: 'Password',
                        // isCollapsed: true,
                        // добавление иконки для просмотра закрашенного пароля
                        suffixIcon: IconButton(
                            icon: Icon(_isobscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isobscure = !_isobscure;
                              });
                            }),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // кнопка перехода на основной экран после авторизации
                    const _AuthButtonWidget(),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // переход на экран регистрации
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationWidget()),
                        );
                      },
                      child: const Text("Регистрация"),
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.blue[900],
                        primary: Colors.blue[600],
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.watch(context)?.model;
    final onPressed =
        model?.canStartAuth == true ? () => model?.auth(context) : null;
    return ElevatedButton(
      onPressed:
        onPressed,

        ///// если нет сервера расскоментить 
        ///для простого перехода через регистрацию
        
        // Navigator.push(     
        //   context,
        //   MaterialPageRoute(builder: (context) => MainScreenWidget()),
        // );


      child: const Text("Войти"),
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.blue[900],
        primary: Colors.blue[600],
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = AuthProvider.watch(context)?.model.errorMessage;
    if (errorMessage == null) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        errorMessage,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.red,
        ),
      ),
    );
  }
}
