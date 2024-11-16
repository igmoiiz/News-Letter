import 'dart:developer';

import 'package:news_letter/Controllers/input_controllers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class AuthServices {
  //  instance for supabase
  final supabase = Supabase.instance.client;

  //  instance for input controllers
  final inputControllers = InputControllers();
  //  method to encrypt the password
  String encryptPassword(String password) {
    final key = encrypt.Key.fromUtf8('12345678901234567890123456789012');
    final iv = encrypt.IV.fromLength(16);

    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(password, iv: iv);

    return '${encrypted.base64}:${iv.base64}';
  }

  //  method to sign the user up into the database
  Future<void> signUp() async {
    try {
      final email = inputControllers.emailController.text;
      final password = inputControllers.passwordController.text;
      final name = inputControllers.nameController.text;

      //  Encrypt the password
      final encryptedPassword = encryptPassword(password);

      //  store user in supabase
      final response = await supabase.from('users').insert({
        'email': email,
        'name': name,
        'password': encryptedPassword,
      }).then((value) {
        inputControllers.emailController.clear();
        inputControllers.passwordController.clear();
        inputControllers.nameController.clear();
      });

      if (response != null && response.error == null) {
        log('User signed up successfully');
      } else if (response != null) {
        log('Error signing up: ${response.error!.message}');
      } else {
        log('Error signing up: An unknown error occurred');
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  //  method to decrypt the password
  String decryptPassword() {
    return '';
  }

  //  method to sign the user into the application
  Future<void> signIn() async {}
}
