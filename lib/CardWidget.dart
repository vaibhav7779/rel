import 'package:flutter/material.dart';
import 'package:test/Bi.dart';

class CardWidget extends StatelessWidget {
  List data = [
    {"color": Color(0xffff6968)},
    {"color": Color(0xff7a54ff)},
    {"color": Color(0xffff8f61)},
    {"color": Color(0xff2ac3ff)},
    {"color": Color(0xff5a65ff)},
    {"color": Color(0xff96da45)},
    {"color": Color(0xffff6968)},
    {"color": Color(0xff7a54ff)},
    {"color": Color(0xffff8f61)},
    {"color": Color(0xff2ac3ff)},
    {"color": Color(0xff5a65ff)},
    {"color": Color(0xff96da45)},
  ];

  List dataTitle = [
    {"title": "Leads"},
    {"title": "Applications"},
    {"title": "Quick Quote"},
    {"title": "Send BI"},
    {"title": "Schedule Medical"},
    {"title": "Send Reminder"},
  ];

  List dataCount = [
    {"count": "92"},
    {"count": "38"},
    {"count": "12"},
    {"count": "8"},
    {"count": "12"},
    {"count": "5"},
  ];
  final colorwhite = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: GridView.builder(
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // crossAxisSpacing: 10
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: GestureDetector(
              onTap: () {
                if (dataTitle[index]["title"] == 'Send BI') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Bi(),
                    ),
                  );
                }
              },
              child: Card(
                color: data[index]["color"],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '',
                            style: TextStyle(color: colorwhite, fontSize: 16),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(35),
                                    bottomLeft: Radius.circular(35),
                                    bottomRight: Radius.circular(35)),
                                color: Color.fromRGBO(255, 255, 255, 0.38)),
                            child: Icon(
                              Icons.arrow_forward_rounded,
                              color: colorwhite,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left: 10, bottom: 10),
                          child: Text(
                            dataTitle[index]["title"],
                            style: TextStyle(fontSize: 27, color: colorwhite),
                          )),
                      Container(
                          alignment: Alignment.bottomRight,
                          padding: EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              Text(
                                dataCount[index]["count"],
                                style: TextStyle(
                                    fontSize: 30,
                                    color: colorwhite,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
