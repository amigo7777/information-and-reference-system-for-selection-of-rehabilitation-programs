import 'package:flutter/material.dart';
import 'package:flutter_mobile_vkr/images.dart';
import 'package:flutter_mobile_vkr/main_screen/profile/card_profile.dart';

class MainProfileWidget extends StatelessWidget {
  const MainProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     DateTime today = DateTime.now();
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: const Text('Профиль'),
        backgroundColor: Colors.green[700],
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                print('Переход в настройки');
              },
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   height: 180,
                //   width: 130,
                //   color: Colors.amber,
                // ),
                const SizedBox(
                  width: 60,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Имя пользователя',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Диагноз: ХОБЛ',
                      style: TextStyle(fontSize: 16),
                    ),
                    // Text("Рост: 175 см", style: TextStyle(fontSize: 16)),
                    Text('Возраст: 32 года', style: TextStyle(fontSize: 16)),
                    Text('Дата начала лечения: 2023-05-03',
                        style: TextStyle(fontSize: 16)),
                    Text('Срок лечения: 9 месяцев',
                        style: TextStyle(fontSize: 16))
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.withOpacity(0.3)),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [
                  CardProfileWidget(
                    titlecard: 'Дневник',
                    descriptioncard: 'Данные о состоянии здоровья',
                    imagecard: AppImages.disease,
                    onPressed: () {
                      print('Дневник');
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CardProfileWidget(
                    titlecard: 'Заметки',
                    descriptioncard: 'Запись событий для уведомления',
                    imagecard: AppImages.notebook,
                    onPressed: () {
                      print('Реабилитационная программа');
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CardProfileWidget(
                    titlecard: 'Аналитика',
                    descriptioncard: 'Оценка эффективности программы',
                    imagecard: AppImages.data,
                    onPressed: () {
                      print('Аналитика');
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // CardProfileWidget(
                  //   titlecard: 'Уведомления',
                  //   descriptioncard: 'оповещения об изменениях в программе',
                  //   imagecard: AppImages.notification,
                  //   onPressed: () {
                  //     print('Уведомления');
                  //   },
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
