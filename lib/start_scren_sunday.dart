import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  String? value;

  var items = ['Item 1', 'Item 2', 'Item 3'];
  final formKey = GlobalKey<FormState>(); //key for form

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Record PTP/MOM'),
          leading: const BackButton(color: Colors.white),
          actions: <Widget>[
            PopupMenuButton<int>(
              onSelected: (item) => {},
              itemBuilder: (context) => const [
                PopupMenuItem<int>(value: 0, child: Text('Logout')),
                PopupMenuItem<int>(value: 1, child: Text('Settings')),
              ],
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10),
                  TextFormField(
                    obscureText: false,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Select HPA*",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "test 1";
                      } else {
                        return "test 2";
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Mode od contact",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Radio(
                          value: "call", groupValue: "call", onChanged: (v) {}),
                      const Text("Call"),
                      const SizedBox(width: 49),
                      Radio(
                          value: "visit", groupValue: "asd", onChanged: (v) {}),
                      const Text("Visit"),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    decoration: const BoxDecoration(),
                    child: DropdownButtonFormField(
                      hint: const Text("Choose person contacted"),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blueAccent, width: 2),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blueAccent, width: 2),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blueAccent, width: 2),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        fillColor: Colors.blueAccent,
                      ),
                      isExpanded: true,
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (value) {},
                      dropdownColor: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    decoration: const BoxDecoration(),
                    child: DropdownButtonFormField(
                      hint: const Text("Choose Disposition"),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(0),
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
                  ),
                  const SizedBox(height: 24),
                  Container(
                    decoration: const BoxDecoration(),
                    child: DropdownButtonFormField(
                      hint: const Text("Choose Sub-disopsition"),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(0),
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
                  ),
                  const SizedBox(height: 24),
                  Card(
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      textAlign: TextAlign.start,
                      maxLines: 1, //or null
                      decoration: const InputDecoration(
                        labelText: "Add Comment*",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Text('15/xxx'),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Have you seen the vehicle?*",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Radio(value: "yes", groupValue: "yes", onChanged: (v) {}),
                      const Text("Yes"),
                      const SizedBox(width: 49),
                      Radio(value: "no", groupValue: "asd", onChanged: (v) {}),
                      const Text("No"),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    decoration: const BoxDecoration(),
                    child: DropdownButtonFormField(
                      hint: const Text("Choose Vehicle is with"),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(0),
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
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: SizedBox(
                      height: 107,
                      width: double.infinity,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: const ContinuousRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.blueAccent),
                        ),
                        elevation: 20,
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              const SizedBox(
                                height: 9,
                              ),
                              const Text("Vehicle image"),
                              const SizedBox(height: 15),
                              const Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.camera_enhance),
                                  SizedBox(width: 5),
                                  Text("Add")
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Submit"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
