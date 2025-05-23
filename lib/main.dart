import 'package:calculator_app/provider/math_provider.dart';
import 'package:calculator_app/screen/home/home_screen.dart';
import 'package:calculator_app/service/math_expression.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context)=> MathExpression()),
        ChangeNotifierProvider(
          create: (context) => MathProvider(context.read<MathExpression>()),
        ),
      ],
      child: const CalculatorApp(),
    );}
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}