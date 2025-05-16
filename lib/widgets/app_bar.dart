import 'package:flutter/material.dart';

AppBar buildCustomAppBar() {
  return AppBar(
    title: const Text('CATALIFT', style: TextStyle(color: Colors.white)),
    backgroundColor: Colors.indigo[900],
    actions: const [
      IconButton(
          icon: Icon(Icons.person, color: Colors.white), onPressed: null),
      IconButton(
          icon: Icon(Icons.notifications, color: Colors.white),
          onPressed: null),
      IconButton(
          icon: Icon(Icons.chat_bubble, color: Colors.white), onPressed: null),
    ],
    centerTitle: false,
  );
}
