import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Componentes APP',
      //home: HomePage()
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        'alert': (context) => AlertPage(),
        'avatar': (context) => AvatarPage(),
      },
    );
  }
}
