import 'package:flutter/material.dart';

class InputControllers {
  //  controllers for text form fields
  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();
  late final TextEditingController confirmPasswordController =
      TextEditingController();
  late final TextEditingController nameController = TextEditingController();

  //  loading variable
  bool loading = false;
}
