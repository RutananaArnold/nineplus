import 'package:flutter/material.dart';
import 'package:nineplus/widgets/phone_widget.dart';
import 'package:nineplus/widgets/rounded_input.dart';
import 'package:nineplus/widgets/rounded_password_field.dart';

import '../constants/color_pallete.dart';
import '../widgets/rounded_button.dart';
import 'login.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  static final emailController = TextEditingController();
  late String tel;
  final passwordController = TextEditingController();
  // static final telController = TextEditingController();
  List<TextEditingController> controllers = [
    emailController,
  ];

  List<String> labels = [
    "Email",
  ];
  List<String> hints = [
    "Enter Email",
  ];
  List<IconData> icons = [
    Icons.email,
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final formkey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
          key: formkey,
          child: Column(
            children: List<Widget>.generate(
              6,
              (index) => index == 0
                  ? SizedBox(
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
                    )
                  : index == 2
                      ? PhoneField(
                          label: "Phone",
                          controller: passwordController,
                          onChanged: (phone) {
                            tel = phone.completeNumber;
                          },
                        )
                      : index == 5
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const Text(
                                    "Already have an account ? ",
                                    style: TextStyle(
                                        fontSize: 13, color: kPrimaryColor),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              Login(),
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
                          : index == 3
                              ? RoundedPasswordField(
                                  hintText: "Enter Password",
                                  controller: passwordController)
                              : index != 4
                                  ? RoundedInput(
                                      label: labels[(index - 1)],
                                      hint: hints[(index - 1)],
                                      icon: icons[(index - 1)],
                                      ontap: () {},
                                      handler: controllers[index - 1],
                                    )
                                  : RoundedButton(
                                      text: "Signup",
                                      press: () {},
                                      color: Colors.redAccent),
            ),
          )),
    );
  }
}
