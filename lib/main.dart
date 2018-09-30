import 'package:flutter/material.dart';
import 'package:socialapp/login_screen.dart';
import 'package:socialapp/user_details.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social App',
      home: LoginScreen(),
      routes: <String, WidgetBuilder>{
        'userDetails': (context) => UserDetails(),
      },
    );
  }
}
