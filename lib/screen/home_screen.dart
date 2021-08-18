import 'package:flutter/material.dart';
import 'package:resume/widget/app_bar.dart';

class ResumeHomeScreen extends StatelessWidget {
  ResumeHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return MediaQuery.of(context).size.width < 600
              ? _BuildVerticalLayout()
              : _BuildHorizontalLayout();
        },
      ),
    );
  }
}

class _BuildVerticalLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Building vertical view");
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: [
        _personalSection(),
        _experienceSection(),
      ],
    );
  }
}

class _BuildHorizontalLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Building horizontal view");
    return ListView(
      children: [
        Row(
          children: [
            Expanded(child: _personalSection()),
            Expanded(child: _experienceSection()),
          ],
        ),
        _footerSection()
      ],
    );
  }
}

Widget _personalSection() => Column(
      children: [
        CircleAvatar(
          minRadius: 10,
          maxRadius: 80,
          child: FlutterLogo(),
        ),
        Container(
            height: 100.0,
            child: RichText(
              text: TextSpan(
                text: """
            Name: Samuel McKendrick
            Pronouns: He,Him,His
            Preferred name: Sam
            """,
              ),
            ))
      ],
    );

Widget _experienceSection() => Container(
      height: 768.0,
      child: Center(
        child: Text("Experience"),
      ),
    );

Widget _footerSection() => Container();
