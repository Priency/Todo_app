import 'package:flutter/material.dart';
import 'package:todo_app/Authform.dart';

class Authscreen extends StatefulWidget{
  @override
  State<Authscreen> createState() => _AuthscreenState();
}

class _AuthscreenState extends State<Authscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body:Authform(),

    );
  }
}