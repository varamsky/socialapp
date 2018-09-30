import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.amber,
          child: Text(
            'USER',
            ),
          onPressed: null,
          ),
      ),
      );
  }
}