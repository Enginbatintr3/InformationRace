import 'package:flutter/material.dart';
import 'package:flutter_application_5/models/contants.dart';
import 'package:flutter_application_5/models/questions.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  void selectedButton(bool buttontype) {
    if (testData.testfinal() == true) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              title: const Text("Testi Tamamladınız!"),
              content:
                  const Text("Testimizi Tamamladığınız İçin Teşekkür Ederiz."),
              actions: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      icons = [];
                    });
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    margin: const EdgeInsets.all(25),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ]),
                    child: const Center(
                      child: Text(
                        "Close",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                )
              ],
            );
          });
      setState(() {
        testData.reloadTest();
        icons = [];
      });
    }
    setState(() {
      testData.getQuBool() == buttontype
          ? icons.add(trueIcon)
          : icons.add(falseIcon);
      testData.afterQuestion();
    });
  }

  TestData testData = TestData();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Container(
            margin: const EdgeInsets.only(
                top: 160, bottom: 160, right: 20, left: 20),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ], color: Colors.white, borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.all(10),
            child: Center(
              child: SingleChildScrollView(
                child: Text(
                  testData.getQuSt(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 3,
          spacing: 3,
          children: icons,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: buttons(
                          true, const Icon(Icons.thumb_up), Colors.green)),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: buttons(
                        false, const Icon(Icons.thumb_down), Colors.red),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  GestureDetector buttons(bool booltype, Icon icon, Color color) {
    return GestureDetector(
      onTap: () {
        selectedButton(booltype);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 30, top: 30, right: 10, left: 10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Icon(
            icon.icon,
            color: color,
            size: 35,
          ),
        ),
      ),
    );
  }
}
