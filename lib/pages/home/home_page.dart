import 'package:homework5/pages/home/widgets/attendance.dart';
import 'package:homework5/pages/home/widgets/notification.dart';
import 'package:homework5/pages/home/widgets/time_table.dart';
import 'package:flutter/material.dart';

var kBottomBarBackgroundColor = Color.fromARGB(255, 54, 64, 207);
var kBottomBarForegroundActiveColor = Colors.white;
var kBottomBarForegroundInactiveColor = Colors.white60;
var kSplashColor = Color.fromARGB(255, 67, 93, 222);

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _handleClickButton(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget buildPageBody() {
      switch (_selectedIndex) {
        case 0:
          return const TimeTable();
        case 1:
          return const Attendance();
        case 2:
          return const AppNotification();
        default:
          return const TimeTable();
      }
    }

    return Scaffold(
  appBar: AppBar(
    title: Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue[900]!), // สีเส้นขอบ
        borderRadius: BorderRadius.circular(10), // รูปร่างของกรอบ
      ),
      child: Text(
        'BEERS',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue[900], // สีข้อความ
        ),
      ),
    ),
    centerTitle: true,
  ),
  body: buildPageBody(),
  backgroundColor: Color.fromARGB(255, 177, 201, 236),
);

  }
}
