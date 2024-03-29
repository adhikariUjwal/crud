import 'package:crud/View/home.dart';
import 'package:crud/auth/login.dart';
import 'package:crud/auth/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'CRUD Application',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
