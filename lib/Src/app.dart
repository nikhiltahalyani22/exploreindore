import 'package:flutter/material.dart';
import 'Splash.dart';
import 'Login.dart';
import 'Home_page.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: spalsh_screen(),
      routes: <String, WidgetBuilder>{
        '/Login': (BuildContext context) => Login(),
        '/home ':(BuildContext context) => Homepage(),
        },
        
    );
  }
}