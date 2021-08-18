import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume/routes.dart';

void main() {
  runApp(Resume());
}

class Resume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Sam's Resume!",
        theme: ThemeData(
          backgroundColor: Colors.white,
          primaryColor: Colors.red,
          accentColor: Colors.blueAccent,
          textTheme: GoogleFonts.montserratTextTheme()
        ),
        routes: {
          ResumeRoutes.home: (context) => ResumeHomeScreen(),
          ResumeRoutes.projects: (context) => ResumeProjectsScreen()
        });
  }
}

class ResumeHomeScreen extends StatelessWidget {
  ResumeHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Stuff about home',
            )
          ],
        ),
      ),
    );
  }
}

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
            Text(
              'Stuff about projects',
            )
          ],
        ),
      ),
    );
  }
}

AppBar appBar(context) {
  String? _currentRoute = ModalRoute.of(context)?.settings.name;
  return AppBar(
    toolbarHeight: 96.0,
    title: Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: TextButton(
            onPressed: _currentRoute != ResumeRoutes.home
                ? () => Navigator.of(context).pushReplacementNamed(ResumeRoutes.home)
                : null,
            child: Text("Home"),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: TextButton(
            onPressed: _currentRoute != ResumeRoutes.projects
                ? () => Navigator.of(context).pushReplacementNamed(ResumeRoutes.projects)
                : null,
            child: Text("Projects"),
          ),
        ),
      ],
    ),
  );
}
