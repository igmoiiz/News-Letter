// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //instance for firebase authentication
  final auth = FirebaseAuth.instance;

  //  check if the user already logged in or not
  void isLogin() {
    if (auth.currentUser != null) {
      Navigator.popAndPushNamed(context, '/interface');
    } else {
      Navigator.popAndPushNamed(context, '/signIn');
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      isLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
