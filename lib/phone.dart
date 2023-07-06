import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/verify.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({Key? key}) : super(key: key);

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countryController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/twofactor.svg',
                  width: 150,
                  height: 150,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Phone Verification",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "We need to register your phone without getting started!",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 40,
                        child: TextField(
                          controller: countryController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Text(
                        "|",
                        style: TextStyle(fontSize: 33, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextFormField(
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Phone",
                                counterText: "",
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter phone number";
                                }
                                bool emailValid =
                                    RegExp(r"^\+?\d[\d -]{8,12}\d")
                                        .hasMatch(value);
                                if (!emailValid) {
                                  return "Enter valid phone number";
                                }
                              }))
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyVerify(),
                            ),
                          );
                        }
                      },
                      child: const Text("Send the code",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
