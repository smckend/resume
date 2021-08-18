import 'package:flutter/material.dart';
import 'package:resume/widget/app_bar.dart';

class ResumeProjectsScreen extends StatelessWidget {
  ResumeProjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Stuff about projects'),
          ],
        ),
      ),
    );
  }
}
