import 'package:flutter/material.dart';
import 'package:nineplus/widgets/rounded_input.dart';

import '../widgets/rounded_button.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
  static final telController = TextEditingController();
  List<TextEditingController> controllers = [
    emailController,
    passwordController,
  ];

  List<String> labels = [
    "Email",
    "Password",
  ];
  List<String> hints = [
    "Enter Email",
    "Enter Password",
  ];
  List<IconData> icons = [Icons.email, Icons.phone, Icons.lock];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final formkey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
          key: formkey,
          child: ListView.builder(
              itemCount: 3,
              itemBuilder: ((context, index) {
                if (index == 0) {
                  return SizedBox(
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
                  );
                } else if (index == 2) {
                  return RoundedButton(
                      text: "Signup", press: () {}, color: Colors.redAccent);
                } else {
                  return RoundedInput(
                      label: labels[index],
                      hint: hints[index],
                      icon: icons[index],
                      ontap: () {},
                      handler: controllers[index]);
                }
                // if (index != 4) {
                //   return RoundedInput(
                //       label: labels[index],
                //       hint: hints[index],
                //       icon: icons[index],
                //       ontap: () {},
                //       handler: controllers[index]);
                // } else {
                //   return RoundedButton(
                //       text: "Signup", press: () {}, color: Colors.redAccent);
                // }
              }))),
    );
  }
}
