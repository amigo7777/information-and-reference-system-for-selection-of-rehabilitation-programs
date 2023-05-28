import 'package:flutter/material.dart';
import 'package:flutter_mobile_vkr/main_screen/main_calendar.dart';
import 'package:flutter_mobile_vkr/main_screen/main_food_widget.dart';
import 'package:flutter_mobile_vkr/main_screen/profile/main_profile.dart';
import 'package:flutter_mobile_vkr/main_screen/main_rehabilitation.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 1;

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Главная'),
      //   centerTitle: true,
      //   automaticallyImplyLeading: false,
      // ),
      body: Center(
        child: IndexedStack(
          index: _selectedTab,
          children: const <Widget>[
            MainProfileWidget(),
            RehabilitationWidget(),
            FoodWidget(),
            CalendarWidget(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        type: BottomNavigationBarType.fixed,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp),
            label: 'Профиль',
            // activeIcon: ,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.precision_manufacturing_sharp),
            label: 'Программа',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Питание',
            // backgroundColor: Colors.white,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Календарь',
            // backgroundColor: Colors.white,
          ),
        ],
        onTap: onSelectTab,
        selectedItemColor: Colors.blueAccent[700],
        unselectedItemColor: Colors.grey[600],
        unselectedFontSize: 13,
        selectedFontSize: 15,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedIconTheme: const IconThemeData( size:  30),
      ),
    );
  }
}
