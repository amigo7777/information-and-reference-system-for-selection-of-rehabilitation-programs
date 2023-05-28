import 'package:flutter/material.dart';
import 'package:flutter_mobile_vkr/example/example.dart';
import 'package:flutter_mobile_vkr/domain/api_client.dart';
import 'package:flutter_mobile_vkr/main_screen/calendar/table_calendar.dart';

import '../images.dart';
import 'calendar/test_table_calendar.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ApiClient().getPosts();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Расписание'),
        backgroundColor: Colors.green[700],
        centerTitle: true,
        // titleTextStyle: ,
        automaticallyImplyLeading: false,
      ),
      body: TableEventsExample(),
      // body: Example(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('new event');
        },
        tooltip: 'New Event',
        child: const Icon(Icons.border_color_outlined),
      ),
    );
  }
}
