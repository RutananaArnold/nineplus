import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class PhoneField extends StatelessWidget {
  final void Function(PhoneNumber) onChanged;
  final TextEditingController controller;
  final String label;
  const PhoneField(
      {Key? key,
      required this.onChanged,
      required this.controller,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
            // phonefield
            Container(
              padding: EdgeInsets.only(
                  top: size.height * 0.01,
                  left: size.height * 0.01,
                  right: size.height * 0.01,
                  bottom: size.height * 0.01),
              margin: const EdgeInsets.symmetric(vertical: 5),
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(29),
              ),
              child: IntlPhoneField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Mobile Number',
                    hintStyle:
                        const TextStyle(color: Colors.black, fontSize: 12),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black54),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  initialCountryCode: 'UG',
                  onChanged: onChanged),
            )
          ],
        ),
      ),
    );
  }
}
