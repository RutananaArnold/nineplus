import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nineplus/auth/login.dart';
import 'package:nineplus/auth/register.dart';
import 'package:nineplus/widgets/bottom-anime.dart';

import '../widgets/Space.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      value: 1.6,
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    controller.addListener(() {});
    // animate the splash screen for 5 seconds
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: ((context) => Register())),
          (route) => false);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: BottomTopMoveAnimationView(
          child: Center(
            child: Column(
              children: [
                Space(space: 0.2),
                // Image.asset("assets/download.png"),
                Icon(
                  Icons.newspaper,
                  size: size.height * 0.3,
                ),
                Space(
                  space: 0.05,
                ),
                const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                Space(space: 0.08),
                const Text(" Your Reliable Last Mile Friend",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600))
              ],
            ),
          ),
          animationController: controller,
        ),
      ),
    );
  }
}
