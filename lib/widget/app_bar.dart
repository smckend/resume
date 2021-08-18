import 'package:flutter/material.dart';
import 'package:resume/routes.dart';

PreferredSizeWidget appBar(context) {
  String? _currentRoute = ModalRoute.of(context)?.settings.name;
  return AppBar(
    toolbarHeight: 96.0,
    title: Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: TextButton(
            onPressed: _currentRoute != ResumeRoutes.home
                ? () => Navigator.of(context)
                    .pushReplacementNamed(ResumeRoutes.home)
                : null,
            child: Text("Home"),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: TextButton(
            onPressed: _currentRoute != ResumeRoutes.projects
                ? () => Navigator.of(context)
                    .pushReplacementNamed(ResumeRoutes.projects)
                : null,
            child: Text("Projects"),
          ),
        ),
      ],
    ),
  );
}
