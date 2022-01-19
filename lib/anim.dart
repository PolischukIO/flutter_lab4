import 'package:flutter/material.dart';
import 'dart:math';

class AnimClass extends StatefulWidget {
  AnimClass({Key? key}) : super(key: key);

  @override
  _AnimClassState createState() => _AnimClassState();
}

class _AnimClassState extends State<AnimClass> {
  double begin = 40;
  double end = 120;
  List aligments = [
    MainAxisAlignment.center,
    MainAxisAlignment.end,
    MainAxisAlignment.start
  ];
  List cols = [
    Colors.green,
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.pink[100]
  ];
  int num = 0;
  var rand = new Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: aligments[rand.nextInt(3)],
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: aligments[rand.nextInt(3)],
              children: [
                TweenAnimationBuilder(
                  duration: Duration(milliseconds: rand.nextInt(1700) + 500),
                  tween: Tween<double>(begin: begin, end: end),
                  onEnd: () {
                    setState(() {
                      num = rand.nextInt(5);
                      if (end >= begin) {
                        while (end >= begin) {
                          begin = rand.nextInt(200) + 50;
                          end = rand.nextInt(200) + 50;
                        }
                      } else {
                        while (end < begin) {
                          begin = rand.nextInt(200) + 50;
                          end = rand.nextInt(200) + 50;
                        }
                      }
                    });
                  },
                  builder:
                      (BuildContext context, dynamic value, Widget? child) {
                    return Icon(
                      Icons.access_alarms_outlined,
                      color: cols[num],
                      size: value,
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
