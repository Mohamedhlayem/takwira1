import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double a = 0;
    double width(double width) {
      a = width / 430;
      return screenWidth * a;
    }

    double radius = screenWidth < 500 ? width(15) : 17.44186046511628;
    double sizedBoxWidth = screenWidth < 500 ? width(50) : 69.76744186046512;
    double activeAdd = screenWidth < 500 ? width(40) : 46.51162790697674;

    return Scaffold(
      backgroundColor: const Color(0xff343835),
      floatingActionButton: SizedBox(
        width: sizedBoxWidth,
        height: sizedBoxWidth,
        child: SpeedDial(
          backgroundColor: Colors.transparent,
          overlayColor: Colors.black,
          overlayOpacity: 0.4,
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          children: [
            SpeedDialChild(
              labelWidget: Container(
                padding: const EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  color: const Color(0xffF1EED0).withOpacity(0.6),
                  borderRadius: BorderRadius.circular(width(20)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width(14)),
                  child: Text(
                    'new Message',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: width(15),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              onTap: () {},
            ),
            SpeedDialChild(
              labelWidget: Container(
                padding: const EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  color: const Color(0xffF1EED0).withOpacity(0.6),
                  borderRadius: BorderRadius.circular(width(20)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width(14)),
                  child: Text(
                    'Create a Group',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: width(15),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              onTap: () {},
            ),
          ],
          activeChild: Image.asset(
            'assets/images/addMessage.png',
            width: activeAdd,
            height: activeAdd,
          ),
          child: Image.asset(
            'assets/images/addMessage.png',
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xff343835),
        iconTheme: const IconThemeData(color: Color(0xFFF1EED0)),
        title: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Messages',
            style: TextStyle(
              color: Color(0xFFF1EED0),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {},
            child: Ink(
              child: Image.asset(
                'assets/images/chatBot.png',
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
