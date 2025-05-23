import 'package:calculator_app/provider/math_provider.dart';
import 'package:calculator_app/screen/home/widgets/action_button_widget.dart';
import 'package:calculator_app/screen/home/widgets/formula_field_widget.dart';
import 'package:calculator_app/screen/home/widgets/result_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final tecFormula = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: const Key("appBar"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FormulaField(tecFormula: tecFormula),
            const SizedBox.square(dimension: 8),
            ActionButton(
              key: const Key("ActionButton"),
              onPressed: () => execute(),
            ),
            const SizedBox.square(dimension: 8),
            const Expanded(child: Center(child: ResultText())),
          ],
        ),
      ),
    );
  }

  void execute() {
    final formula = tecFormula.text;
    final mathProvider = context.read<MathProvider>();

    if (formula.isNotEmpty) {
      mathProvider.evaluate(formula);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a formula"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
