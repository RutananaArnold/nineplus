import 'package:flutter/material.dart';
import 'package:nineplus/constants/color_pallete.dart';
import 'package:nineplus/widgets/rounded_button.dart';
import 'package:nineplus/widgets/rounded_input_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final size = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // appBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16.0, bottom: 16.0, left: 24, right: 24),
                        child: Row(
                          children: const <Widget>[
                            Expanded(
                              child: Center(
                                child: Text(
                                  "Forgot Password?",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.lock,
                        size: size.height * 0.35,
                      ),
                      const Center(
                        child: Text(
                          "Find your account",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      RoundedInputField(
                        icon: Icons.mail_outline_rounded,
                        controller: emailController,
                        hintText: "Your Email",
                      ),
                      RoundedButton(
                        text: "Send",
                        press: () {
                          if (formkey.currentState!.validate()) {}
                        },
                        color: kPrimaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Widget appBar() {
  //   return CommonAppbarView(
  //     iconData: Icons.arrow_back,
  //     titleText: AppLocalizations(context).of("forgot_your_Password"),
  //     onBackClick: () {
  //       Navigator.pop(context);
  //     },
  //   );
  // }

}
