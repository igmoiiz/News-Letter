// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:news_letter/Controllers/Services/auth_services.dart';
import 'package:news_letter/Controllers/input_controllers.dart';
import 'package:news_letter/View/Components/auth_button.dart';
import 'package:news_letter/View/Components/my_form_field.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // instance for input controllers
  final inputControllers = InputControllers();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      extendBody: true,
      // resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Card(
                color: Theme.of(context).colorScheme.secondary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.015),
                    Icon(
                      Icons.message_outlined,
                      color: Theme.of(context).colorScheme.primary,
                      size: height * 0.045,
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      'Sign Up'.toUpperCase(),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    MyFormField(
                      obscureText: false,
                      controller: inputControllers.nameController,
                      iconData: Icons.person_2_outlined,
                      labelText: 'John Doe',
                    ),
                    SizedBox(height: height * 0.01),
                    MyFormField(
                      obscureText: false,
                      controller: inputControllers.emailController,
                      iconData: Icons.alternate_email_sharp,
                      labelText: 'john123@xyz.com',
                    ),
                    SizedBox(height: height * 0.01),
                    MyFormField(
                      obscureText: true,
                      controller: inputControllers.passwordController,
                      iconData: Icons.password_sharp,
                      labelText: '***********',
                    ),
                    SizedBox(height: height * 0.01),
                    MyFormField(
                      obscureText: true,
                      controller: inputControllers.confirmPasswordController,
                      iconData: Icons.password_sharp,
                      labelText: 'Confirm Password',
                    ),
                    SizedBox(height: height * 0.02),
                    Consumer<AuthServices>(
                      builder: (context, value, child) {
                        return AuthButton(
                          loading: inputControllers.loading,
                          onTap: () {
                            value.signUpWithEmailAndPassword(
                                inputControllers.emailController.text,
                                inputControllers.passwordController.text,
                                context);
                          },
                          text: 'Sign up',
                        );
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/signIn');
                      },
                      child: Text(
                        'Sign In'.toUpperCase(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
