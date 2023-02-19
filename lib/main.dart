import 'package:breathing_test_assesment/app_colors.dart';
import 'package:breathing_test_assesment/pace_selector.dart';
import 'package:breathing_test_assesment/practice_selector.dart';
import 'package:breathing_test_assesment/time_selector.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Breathing Test Assessment',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: "Martel",
      ),
      home: const MyHomePage(title: 'Breathing Test Assessment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: const [
          TimeSelector(),
          SizedBox(
            height: 15,
          ),
          PracticeSelector(),
          SizedBox(
            height: 15,
          ),
          PaceSelector(),
        ],
      ),
    );
  }
}
