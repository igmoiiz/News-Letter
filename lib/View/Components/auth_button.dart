// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  VoidCallback onTap;
  String text;
  bool loading;
  AuthButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height * 0.06,
        width: width * 0.4,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: loading
            ? CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
              )
            : Center(
                child: Text(
                  text.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
      ),
    );
  }
}
