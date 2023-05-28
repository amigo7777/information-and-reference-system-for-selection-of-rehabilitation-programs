import 'package:flutter/material.dart';
import 'package:flutter_mobile_vkr/rehabilitation_course/course_list_widget.dart';

class RehabilitationWidget extends StatelessWidget {
  const RehabilitationWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Реабилитация'),
          backgroundColor: Colors.green[700],
          centerTitle: true,
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: 'Программа',),
              Tab(text: 'Курсы',),
              // Tab(text: 'Полезное',)
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(),
            const CourseListWidget(),
            // ListView(),
          ],
        ),
      ),
    );
  }
}