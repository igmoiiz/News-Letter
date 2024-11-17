// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_letter/Controllers/Utils/fluttertoast.dart';
import 'package:news_letter/Controllers/input_controllers.dart';

class AuthServices extends ChangeNotifier {
  //  instance for input controllers
  final inputControllers = InputControllers();

  //  instance for firebase authentication
  final FirebaseAuth auth = FirebaseAuth.instance;

  // ! method to sign the user into the application
  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      //  set the loading variable to true
      inputControllers.loading = true;
      notifyListeners();
      //  authenticate the user
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.popAndPushNamed(context, '/interface');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            content: Text(
              'Signed In Successfully!',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ));
        });
      }).onError((error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            error.toString(),
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ));
      });
    } on FirebaseAuthException catch (error) {
      log(error.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            error.toString(),
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
      );
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    } finally {
      //  clear the input fields after sign in
      inputControllers.emailController.clear();
      inputControllers.passwordController.clear();
      inputControllers.loading = false;
      notifyListeners();
    }
  }

  // ! method to sign the user up for the application
  Future<void> signUpWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      //  set the loading variable to true
      inputControllers.loading = true;
      notifyListeners();
      //  authenticate the user
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Future.delayed(
          const Duration(seconds: 3),
          () {
            Navigator.popAndPushNamed(context, '/interface');
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              content: Text(
                'Signed Up Successfully!',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ));
          },
        );
      }).onError((error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            error.toString(),
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ));
      });
    } on FirebaseAuthException catch (error) {
      log(error.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            error.toString(),
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
      );
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    } finally {
      //  clear the input fields after sign in
      inputControllers.emailController.clear();
      inputControllers.passwordController.clear();
      inputControllers.confirmPasswordController.clear();
      inputControllers.nameController.clear();
      inputControllers.loading = false;
      notifyListeners();
    }
  }

  // ! method to sign the user out of the application
  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (error) {
      log(error.toString());
      Utils().toastMessage(error.toString());
      throw Exception(error.toString());
    }
  }
}
