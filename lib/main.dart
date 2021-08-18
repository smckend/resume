import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume/routes.dart';
import 'package:resume/screen/home_screen.dart';
import 'package:resume/screen/project_screen.dart';

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
            textTheme: GoogleFonts.montserratTextTheme()),
        routes: {
          ResumeRoutes.home: (context) => ResumeHomeScreen(),
          ResumeRoutes.projects: (context) => ResumeProjectsScreen()
        });
  }
}
