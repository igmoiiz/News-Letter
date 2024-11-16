// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  TextEditingController controller;
  String labelText;
  IconData iconData;
  bool obscureText;
  MyFormField({
    super.key,
    required this.obscureText,
    required this.iconData,
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
      child: TextFormField(
        obscureText: obscureText,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'These Fields Can\'t be empty!';
          } else {
            return null;
          }
        },
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
          prefixIcon: Icon(
            iconData,
            color: Theme.of(context).colorScheme.primary,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context)
                  .colorScheme
                  .primary, // Set the default border color
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context)
                  .colorScheme
                  .primary, // Set the border color when not focused
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context)
                  .colorScheme
                  .primary, // Set the border color when focused
            ),
          ),
        ),
      ),
    );
  }
}
