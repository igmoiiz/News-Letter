import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_letter/Controllers/Services/auth_services.dart';
import 'package:news_letter/View/Authentication/forgot_password.dart';
import 'package:news_letter/View/Authentication/login.dart';
import 'package:news_letter/View/Authentication/signup.dart';
import 'package:news_letter/View/Interface/interface.dart';
import 'package:news_letter/View/Splash%20Screen/splash.dart';
import 'package:news_letter/View/Theme/theme.dart';
import 'package:news_letter/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  //  Initialize widgets binding in flutter
  WidgetsFlutterBinding.ensureInitialized();

  //  Firebase setup
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //  Supabase Setup
  await Supabase.initialize(
    url: 'https://ncluoskdwcjnxbpyuads.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5jbHVvc2tkd2NqbnhicHl1YWRzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE2NzkyMjYsImV4cCI6MjA0NzI1NTIyNn0.Z157aH414gN1zr6dBpIpOwTCLn6FJmg8CipT1BFzJIY',
    authOptions: const FlutterAuthClientOptions(
      authFlowType: AuthFlowType.pkce,
    ),
  );
  //  run the application
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthServices()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/signIn': (context) => const SignInPage(),
        '/signUp': (context) => const SignUpPage(),
        '/interface': (context) => const InterfacePage(),
        '/forgotPassword': (context) => const ForgotPasswordPage(),
      },
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
