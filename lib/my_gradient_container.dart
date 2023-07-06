import 'package:flutter/material.dart';

var startAlignment = Alignment.topCenter;
var endAlignment = Alignment.bottomCenter;

class MyGradientContainer extends StatelessWidget {
  MyGradientContainer(this.colours, {super.key});
  final List<Color> colours;
  int _radioValue = 0;
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: const BoxDecoration(),
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 8,
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Select HPA*",
                  border: OutlineInputBorder(),
                ),
              ),
              Column(
                children: <Widget>[
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Mode of Contact*",
                      )),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                              value: 1,
                              groupValue: _radioValue,
                              onChanged: (value) {
                                _radioValue = 1;
                              }),
                          const SizedBox(width: 10),
                          const Text('Call'),
                        ],
                      ),
                      const SizedBox(width: 49),
                      Row(
                        children: [
                          Radio(
                              value: 2,
                              groupValue: _radioValue,
                              onChanged: (value) {
                                _radioValue = 2;
                              }),
                          const SizedBox(width: 10),
                          const Text('Visit'),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  isExpanded: true,
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (value) {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
