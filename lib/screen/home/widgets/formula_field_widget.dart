import 'package:flutter/material.dart';

class FormulaField extends StatelessWidget {
  final TextEditingController tecFormula;
  const FormulaField({super.key, required this.tecFormula});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2),
      ),
      child: TextFormField(
        controller: tecFormula,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Enter formula",
        ),
        style: const TextStyle(
          fontSize: 32
        ),
        maxLines: 3,
        minLines: 3,
      ),
    );
  }
}
