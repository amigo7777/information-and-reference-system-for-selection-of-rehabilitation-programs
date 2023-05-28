import 'package:flutter/material.dart';

class RegistrationWidget extends StatefulWidget {
  @override
  State<RegistrationWidget> createState() => _RegistrationWidgetState();
}

/// регистрация еще не реализована на сервере 
/// и в данный момент представляет исключительно виджет
/// пользовательского интерфейса

class _RegistrationWidgetState extends State<RegistrationWidget> {
  // const SecondRoute({super.key});
  bool _isobscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        // title: const Text('Регистрация'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF034a5c),
                  Color(0xFF237c60),
                  Color(0xFF559f46),
                  Color(0xFFb6d606),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft
                ),
              ),
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 120,),
                    const Text("Регистрация", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 25,),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.black54)),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          labelText: 'Введите имя пользователя',
                          // isCollapsed: true,
                        ),
                    ),

                    const SizedBox(height: 20,),

                    TextFormField(
                      obscureText: _isobscure,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black54)),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        labelText: 'Введите пароль',
                        prefixIcon: const Icon(Icons.vpn_key),
                        suffixIcon: IconButton(
                          icon: Icon(_isobscure ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                          _isobscure = !_isobscure;
                        });
                      }),
                        // isCollapsed: true,
                      ),
                    ),

                    const SizedBox(height: 20,),

                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black54)),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        labelText: 'phone',
                        prefixIcon: const Icon(Icons.phone),
                        prefixText: '+ 7',
                        // isCollapsed: true,
                      ),
                    ),

                    const SizedBox(height: 20,),

                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black54)),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        labelText: 'email',
                        prefixIcon: const Icon(Icons.mail),
                        // prefixText: '+ 7',
                        // isCollapsed: true,
                      ),
                    ),

                    const SizedBox(height: 30,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Назад'),
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.blue[900],
                            primary: Colors.blue[600],
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                        ),

                        const SizedBox(width: 20,),

                        ElevatedButton(
                          onPressed: () {}, 
                          child: const Text("Создать аккаунт"),
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.blue[900],
                            primary: Colors.blue[600],
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                            textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                        ),
                      ],
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