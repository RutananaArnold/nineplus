import 'package:flutter/material.dart';
import 'package:nineplus/widgets/rounded_input_field.dart';

class RoundedInput extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final VoidCallback? ontap;
  final TextEditingController handler;
  const RoundedInput(
      {Key? key,
      required this.label,
      required this.hint,
      required this.icon,
      this.ontap,
      required this.handler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                label,
                style: const TextStyle(
                    color: Color.fromARGB(255, 0, 31, 56),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            RoundedInputField(
              hintText: hint,
              x: false,
              icon: icon,
              // tap: ontap,
              controller: handler,
              // postfixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
