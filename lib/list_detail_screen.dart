import 'package:flutter/material.dart';
import 'package:student_organizer/exam.dart';

import 'exam.dart';

class ListDetailsScreen extends StatelessWidget {
  //final ExamApplication item;

  //ListDetailsScreen(this.item);
  static const routeName = '/list_detail';
  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as ExamApplication;
    return Scaffold(
      appBar: AppBar(title: Text(item.courseName)),
      body: Column(children: [
        Text(item.courseName),
        Text(item.dateTime.toString()),
      ]),
    );
  }
}
