import 'package:flutter/material.dart';
import 'package:flutter_mobile_vkr/images.dart';

class MainCourseWidget extends StatelessWidget {
  const MainCourseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 200,
                  color: Colors.amber[800],
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 120,
                      ),
                       Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Восстановление при заболевании огранов дыхания',
                          style: TextStyle(
                              fontSize: 25, 
                              fontWeight: FontWeight.bold,
                              // color: Colors.white
                            ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 0.4,
                ),
                // const Text('Добавить описание'), //описание включает какие мероприятия содержит программа на сколько она расчитана как подбирается и что направлена и тд
                Container(
                  height: 700,
                  color: Colors.blue[100],
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 40),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.ac_unit,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Содержание программы',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Курс ЛФК включает: ',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[900]),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 19),
                              child: Text(
                                ' дыхательные упражнения \n ротационные упражнения \n упражнения с дозированным сопротивлением \n дренажная гимнастика',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[850]),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Курс физиотерапии включает: ',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[900]),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 19),
                              child: Text(
                                ' ингаляционную терапию муколитиками и мукокинетиками \n противовоспалительную терапию - УВЧ, УФО грудной клетки \n в конце подострого периода возможно применение репаративно-регенеративных методов',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[850]),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              ' Курс составляется с общими противопоказаниями на основе симптомов. Может включать диетотерапию. В процессе программы будут даваться дополнительные тесты для выявления улучшения/ухудшения работоспособности. Средняя длительность курса 3-4 месяца.',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[900]),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25,),
                      
                      ElevatedButton(
                        onPressed: () {}, 
                        child: const Text('Активировать курс'),
                        style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                           foregroundColor: MaterialStateProperty.all(Colors.white),
                          minimumSize: MaterialStateProperty.all(const Size(200, 50)),
                          overlayColor: MaterialStateProperty.all(Colors.deepPurple),
                          backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            )
                          )
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
