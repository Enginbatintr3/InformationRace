import 'package:flutter/material.dart';
import 'package:flutter_application_5/screens/qupa.dart';

void main() => runApp(const InformationTest());

class InformationTest extends StatelessWidget {
  const InformationTest({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Informatıon Race App",
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuestionPage(),
          ),
        ),
      ),
    );
  }
}
