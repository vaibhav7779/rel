import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test/success_page.dart';

enum ContactType { Call, Visit }

enum VehicleType { Yes, No }

var itemsPersonContacted = ['Customer', 'Item 2', 'Item 3'];
var itemsDisposition = ['Cannot pay', 'Item 2', 'Item 3'];
var itemsselfDisposition = [
  'Job loss/Drop in income/Business loss',
  'Item 2',
  'Item 3'
];
var itemsVehicle = ['Customer', 'Item 2', 'Item 3'];

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

String wordCount = "0";

String? moc = "call";

bool isChecked = false;

class _StartScreenState extends State<StartScreen> {
  final formKey = GlobalKey<FormState>();
  ContactType? _contactType;
  VehicleType? _vehicleType;
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on Exception catch (e) {
      // TODO
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Record PTP/MOM'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color(0xFFf8a532),
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      return "Enter HPA";
                    }
                  },
                ),
                const SizedBox(height: 24),
                const Text(
                  "Mode of contact",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    //color: Colors.indigoAccent,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<ContactType>(
                        contentPadding: const EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        value: ContactType.Call,
                        groupValue: _contactType,
                        title: const Text('Call'),
                        tileColor: Color(0xFFe6e7e8),
                        dense: true,
                        onChanged: (value) {
                          setState(() {
                            _contactType = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: RadioListTile<ContactType>(
                        contentPadding: const EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        value: ContactType.Visit,
                        groupValue: _contactType,
                        title: const Text('Visit'),
                        tileColor: Color(0xFFe6e7e8),
                        dense: true,
                        onChanged: (value) {
                          setState(() {
                            _contactType = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                DropdownButtonFormField(
                  items: itemsPersonContacted.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  dropdownColor: Color(0xFFe6e7e8),
                  decoration: const InputDecoration(
                    labelText: "Person Contacted",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value == null ? 'Filed cant be empty' : null,
                  onChanged: (value) {},
                ),
                const SizedBox(height: 24),
                DropdownButtonFormField(
                  items: itemsDisposition.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  //dropdownColor: Colors.indigo.shade50,
                  decoration: const InputDecoration(
                    labelText: "Disposition",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value == null ? 'Filed cant be empty' : null,
                  onChanged: (value) {},
                ),
                const SizedBox(height: 24),
                DropdownButtonFormField(
                  items: itemsselfDisposition.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  //dropdownColor: Colors.indigo.shade50,
                  decoration: const InputDecoration(
                    labelText: "Self-disposition",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value == null ? 'Filed cant be empty' : null,
                  onChanged: (value) {},
                ),
                const SizedBox(height: 24),
                Card(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    textAlign: TextAlign.start,
                    maxLines: 3, //or null
                    decoration: const InputDecoration(
                      labelText: "Add Comment*",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        wordCount = value.length.toString();
                      });
                    },
                    validator: (value) =>
                        value == null ? 'Filed cant be empty' : null,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text('150/$wordCount'),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    const Text("Request for supervison visit"),
                  ],
                ),
                const SizedBox(height: 24),
                const Divider(),
                const SizedBox(height: 24),
                const Text(
                  "Have you seen the vehicle?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    // color: Colors.indigoAccent,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<VehicleType>(
                        contentPadding: const EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        value: VehicleType.Yes,
                        groupValue: _vehicleType,
                        title: const Text('Yes'),
                        tileColor: Color(0xFFe6e7e8),
                        dense: true,
                        onChanged: (value) {
                          setState(() {
                            _vehicleType = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: RadioListTile<VehicleType>(
                        contentPadding: const EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        value: VehicleType.No,
                        groupValue: _vehicleType,
                        title: const Text('No'),
                        tileColor: Color(0xFFe6e7e8),
                        dense: true,
                        onChanged: (value) {
                          setState(() {
                            _vehicleType = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                DropdownButtonFormField(
                  items: itemsVehicle.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // dropdownColor: Colors.indigo.shade50,
                  decoration: const InputDecoration(
                    labelText: "Vehicle is with",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value == null ? 'Filed cant be empty' : null,
                  onChanged: (value) {},
                ),
                const SizedBox(height: 24),
                Center(
                  child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: ContinuousRectangleBorder(
                        side: BorderSide(
                            width: 1, color: Theme.of(context).primaryColor),
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
                            const Divider(),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    pickImage();
                                  },
                                  child: const Icon(Icons.camera_alt_outlined),
                                ),
                                const SizedBox(width: 5),
                                const Text("Add"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Submit",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
