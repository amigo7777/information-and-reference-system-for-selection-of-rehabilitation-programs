import 'package:flutter/material.dart';
import 'package:flutter_mobile_vkr/auth/auth_model.dart';
import 'package:flutter_mobile_vkr/auth/auth_widget.dart';
import 'package:flutter_mobile_vkr/main_screen/main_screen_widget.dart';
import 'package:flutter_mobile_vkr/rehabilitation_course/main_course_widget.dart';

/// основной файл запуска
/// первым виджетом при включении приложения является виджет авторизации
/// AuthWidget который находится в папке auth

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter VKR',
      theme: ThemeData(
        // colorScheme: const ColorScheme.dark(), //изменение на темную тему
        
        // bottomNavigationBarTheme: BottomNavigationBarThemeData(
        //   backgroundColor: Color.fromRGBO(3, 37, 65, 1),
        // )
        
        // primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Регистрация'),
      routes: {
        '/auth': (context) => AuthProvider(model: AuthModel(), child: const AuthWidget()),
        '/main_screen': (context) => const MainScreenWidget(),
        // '/main_course': (context) => const MainCourseWidget()
      },
      initialRoute: '/auth',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const AuthWidget();
  }
}
