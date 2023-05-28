import 'package:flutter/material.dart';
import 'package:flutter_mobile_vkr/images.dart';

class FoodWidget extends StatelessWidget {
  const FoodWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Рацион питания'),
          backgroundColor: Colors.green[700],
          centerTitle: true,
          automaticallyImplyLeading: false,
          bottom: const TabBar(
              tabs: <Widget>[
                Tab(text: 'Диета',),
                Tab(text: 'Дневник питания',),
                Tab(text: 'Лекарства',)
              ],
            ),
        ),
        body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 15,),
                        const Text('Рекомендуется', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                        Text("стол № 9", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        // const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                             decoration: BoxDecoration(
                              color: Colors.green[800],
                              border: Border.all(color: Colors.grey.withOpacity(0.3)),
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            // color: Colors.green[800],
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                Container(
                                  // decoration: BoxDecoration(
                                  //   border: Border.all(color: Colors.grey.withOpacity(0.3)),
                                  //   borderRadius: const BorderRadius.all(Radius.circular(30)),
                                  // ),
                                  width: 240,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(45.0),
                                    child: Image(image: AppImages.food)),
                                ),
                                const SizedBox(height: 12,),
                                Text('Описание рациона', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                                const SizedBox(height: 8,),
                                Text('  Специальный рацион питания, который рекомендуется при сахарном диабете и других заболеваниях, связанных с нарушением обмена углеводов и липидов в организме.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white), textAlign: TextAlign.center,),
                                const SizedBox(height: 8,),
                                Text('  Целью диеты является нормализация уровня глюкозы в крови и стабилизация обмена веществ. Рацион питания состоит из продуктов, богатых белками, сложными углеводами, а также ограниченным количеством жиров и легко усваиваемых углеводов.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white), textAlign: TextAlign.center,)
                              ],),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('Сбалансированное питание', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Container(
                                color: Colors.blueGrey[900],
                                height: 200,
                                width: 160,
                              ),
                              SizedBox(width: 50,),
                              Container(
                                color: Colors.blueGrey[900],
                                height: 200,
                                width: 160,
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ListView(),
              ListView(),
            ],
          ),
      ),
    );
  }
}