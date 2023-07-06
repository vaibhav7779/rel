import 'package:flutter/material.dart';
import 'package:test/phone.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Claims App"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/avatar.png',
                  height: 200,
                  width: 200,
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter email";
                    }
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                        .hasMatch(value);
                    if (!emailValid) {
                      return "Enter valid email";
                    }
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: passController,
                  obscureText: passToggle,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffix: InkWell(
                      onTap: () {
                        setState(
                          () {
                            passToggle = !passToggle;
                          },
                        );
                      },
                      child: Icon(
                          passToggle ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter password";
                    }
                  },
                ),
                const SizedBox(height: 60),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = !isLoading;
                        });
                        Future.delayed(const Duration(seconds: 1), () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyPhone(),
                            ),
                          );
                        });
                      }
                    },
                    child: !isLoading
                        ? const Text(
                            "Log In",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        : const CircularProgressIndicator(
                            color: Color(0xFFfef101),
                          ),
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Unable to login?',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot password',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
