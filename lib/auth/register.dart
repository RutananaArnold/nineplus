import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nineplus/widgets/phone_widget.dart';
import 'package:nineplus/widgets/rounded_input.dart';
import 'package:nineplus/widgets/rounded_password_field.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/color_pallete.dart';
import '../constants/config.dart';
import '../models/user_id.dart';
import '../screens/index.dart';
import '../widgets/rounded_button.dart';
import 'login.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  late String tel;
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final formkey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
          key: formkey,
          child: Column(children: [
            SizedBox(
              height: size.height * 0.06,
              child: const Center(
                child: Text(
                  "Sign up",
                  textHeightBehavior: TextHeightBehavior(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            RoundedInput(
              label: "Email",
              hint: "Enter Email",
              icon: Icons.email,
              handler: emailController,
            ),
            PhoneField(
              label: "Phone",
              controller: phoneController,
              onChanged: (phone) {
                tel = phone.completeNumber;
              },
            ),
            RoundedPasswordField(
                hintText: "Enter Password", controller: passwordController),
            RoundedButton(
                text: "Signup",
                press: () {
                  formkey.currentState!.validate();
                  registration(emailController.text, tel.toString(),
                      passwordController.text);
                },
                color: Colors.redAccent),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    "Already have an account ? ",
                    style: TextStyle(fontSize: 13, color: kPrimaryColor),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => Login(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ])),
    );
  }

  // registration logic
  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
      };

  registration(String email, String phone, String password) async {
    Map data = {
      "email": email,
      "phone": phone,
      "password": password,
    };
    print(data);
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    var jsonResponse;

    var response = await http.post(
      Uri.parse(apiUrl + "/register"),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
    if (response.statusCode == 200) {
      jsonResponse = IdUser.fromJson(jsonDecode(response.body));
      print(jsonResponse.userId);
      if (jsonResponse != null) {
        // Save an integer value to 'userId' key.
        await prefs.setInt('userId', jsonResponse.userId);
        const snackBar = SnackBar(
          content: Text('Fully Registered enjoy!'),
        );

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Index(),
            ),
            (route) => false);
      }
    } else {
      jsonResponse = json.decode(response.body);
    }
  }
}
