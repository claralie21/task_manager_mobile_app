import 'package:flutter/material.dart';
import 'package:task_manager_mobile_app/utils/todo_list.dart';
import 'package:task_manager_mobile_app/pages/settings_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Hi! Welcome to your Todo App',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }
}