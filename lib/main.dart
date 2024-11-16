import 'package:flutter/material.dart';
import 'package:news_letter/View/Authentication/signup.dart';
import 'package:news_letter/View/Theme/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  //  Initialize widgets binding in flutter
  WidgetsFlutterBinding.ensureInitialized();

  //  Supabase Setup
  await Supabase.initialize(
    url: 'https://ncluoskdwcjnxbpyuads.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5jbHVvc2tkd2NqbnhicHl1YWRzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE2NzkyMjYsImV4cCI6MjA0NzI1NTIyNn0.Z157aH414gN1zr6dBpIpOwTCLn6FJmg8CipT1BFzJIY',
  );
  //  run the application
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      darkTheme: darkMode,
      home: const SignUpPage(),
    );
  }
}
