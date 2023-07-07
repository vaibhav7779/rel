import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test/success_page.dart';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';

enum ContactType { Call, Visit }

enum VehicleType { Yes, No }

var itemsOccupation = ['Salaried', 'Business', 'Unemployed'];
var itemsEducation = ['Graduate', 'Post Graduate', 'Masters', 'Doctorate'];
var itemsAnnualIncome = ['< 100000', '500000', '>500000'];
var itemsVehicle = ['Customer', 'Item 2', 'Item 3'];
var itemsGender = ['Male', 'Female', 'Non-binary'];

class Bi extends StatefulWidget {
  @override
  _BiState createState() => _BiState();
}

String wordCount = "0";

String? moc = "call";

bool isChecked = false;

class _BiState extends State<Bi> {
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
        title: const Text('BI'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // backgroundColor: Color(0xFFf8a532),
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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Customer demographics",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  obscureText: false,
                  decoration: const InputDecoration(
                    labelText: "Full Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Filed cant be empty";
                    }
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Select DOB',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 24,
                ),
                DropdownDatePicker(
                  inputDecoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))), // optional
                  isDropdownHideUnderline: true, // optional
                  isFormValidator: true, // optional
                  startYear: 1900, // optional
                  endYear: 2020, // optional
                  selectedDay: 14, // optional
                  selectedMonth: 10, // optional
                  selectedYear: 1993, // optional
                  onChangedDay: (value) => print('onChangedDay: $value'),
                  onChangedMonth: (value) => print('onChangedMonth: $value'),
                  onChangedYear: (value) => print('onChangedYear: $value'),
                  //boxDecoration: BoxDecoration(
                  // border: Border.all(color: Colors.grey, width: 1.0)), // optional
                  // showDay: false,// optional
                  // dayFlex: 2,// optional
                  // locale: "zh_CN",// optional
                  // hintDay: 'Day', // optional
                  // hintMonth: 'Month', // optional
                  // hintYear: 'Year', // optional
                  // hintTextStyle: TextStyle(color: Colors.grey), // optional
                ),
                const SizedBox(height: 24),
                DropdownButtonFormField(
                  items: itemsOccupation.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  dropdownColor: Color(0xFFe6e7e8),
                  decoration: const InputDecoration(
                    labelText: "Occupation",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value == null ? 'Filed cant be empty' : null,
                  onChanged: (value) {},
                ),
                const SizedBox(height: 24),
                DropdownButtonFormField(
                  items: itemsEducation.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  //dropdownColor: Colors.indigo.shade50,
                  decoration: const InputDecoration(
                    labelText: "Education",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value == null ? 'Filed cant be empty' : null,
                  onChanged: (value) {},
                ),
                const SizedBox(height: 24),
                DropdownButtonFormField(
                  items: itemsAnnualIncome.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  //dropdownColor: Colors.indigo.shade50,
                  decoration: const InputDecoration(
                    labelText: "Annual Income",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value == null ? 'Filed cant be empty' : null,
                  onChanged: (value) {},
                ),
                const SizedBox(height: 24),
                DropdownButtonFormField(
                  items: itemsGender.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  //dropdownColor: Colors.indigo.shade50,
                  decoration: const InputDecoration(
                    labelText: "Gender",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value == null ? 'Filed cant be empty' : null,
                  onChanged: (value) {},
                ),
                const SizedBox(height: 24),
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
