import 'package:test/CardWidget.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with SingleTickerProviderStateMixin {
  final colorstheme = Color(0xff4b4b87);

  TabController? _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 1, vsync: this, initialIndex: 0)
      ..addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(fontSize: 27, color: colorstheme),
        ),
        centerTitle: true,
        shadowColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: colorstheme,
              size: 30,
            ),
            onPressed: () {},
          ),
        ),
      ),
      body: Column(
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(20),
          //       color: Colors.grey[300]),
          //   child: TabBar(
          //       isScrollable: true,
          //       indicatorPadding: EdgeInsets.all(10),
          //       labelColor: Colors.white,
          //       unselectedLabelColor: colorstheme,
          //       labelStyle: TextStyle(fontSize: 20),
          //       labelPadding:
          //           EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
          //       indicator: BoxDecoration(
          //           color: colorstheme,
          //           borderRadius: BorderRadius.circular(20)),
          //       controller: _tabController,
          //       tabs: [
          //         Text('Day'),
          //         Text('Week'),
          //         Text('Month'),
          //       ]),
          // ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              CardWidget(),
            ]),
          )
        ],
      ),
    );
  }
}
