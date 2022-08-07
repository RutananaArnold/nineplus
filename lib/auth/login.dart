import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nineplus/auth/register.dart';
import 'package:nineplus/constants/color_pallete.dart';
import 'package:nineplus/models/logged_in.dart';
import 'package:nineplus/screens/forgotpassword.dart';
import 'package:nineplus/screens/index.dart';
import 'package:nineplus/widgets/rounded_button.dart';
import 'package:nineplus/widgets/rounded_input_field.dart';
import 'package:nineplus/widgets/rounded_password_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../constants/config.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            const Text(
              "Log in",
              textHeightBehavior: TextHeightBehavior(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            // SvgPicture.asset(
            //   "images/login.svg",
            //   height: size.height * 0.35,
            // ),
            Icon(
              Icons.verified_user_rounded,
              size: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              icon: Icons.mail_outline_rounded,
              controller: emailController,
              hintText: "Your Email",
            ),
            RoundedPasswordField(
              controller: passwordController,
              hintText: 'Your password',
            ),
            forgotYourPasswordUI(),
            RoundedButton(
              text: "LOGIN",
              press: () {
                formkey.currentState!.validate();
                loggingIn(emailController.text, passwordController.text);
              },
              color: kPrimaryColor,
            ),
            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Don't have an account ? ",
                  style: TextStyle(fontSize: 13, color: kPrimaryColor),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => Register(),
                      ),
                    );
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 12,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  "OR",
                  style: TextStyle(fontSize: 15, color: kPrimaryColor),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute<void>(
                    //     builder: (BuildContext context) =>
                    //         Login(),
                    //   ),
                    // );
                  },
                  child: const Text(
                    "Go Anonymously",
                    style: TextStyle(
                      fontSize: 12,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }

  Widget forgotYourPasswordUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 16, bottom: 8, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const ForgotPasswordScreen()),
                  (route) => true);
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Forgot yourPassword?",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // registration logic
  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
      };

  loggingIn(String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };
    print(data);
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    var jsonResponse;

    var response = await http.post(
      Uri.parse(apiUrl + "/login"),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
    if (response.statusCode == 200) {
      jsonResponse = LoggedInUser.fromJson(jsonDecode(response.body));
      print(jsonResponse.data.id);
      if (jsonResponse != null) {
        // Save an integer value to 'userId' key.
        await prefs.setInt('userId', jsonResponse.data.id);
        final snackBar = SnackBar(
          content: Text(jsonResponse.status),
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
