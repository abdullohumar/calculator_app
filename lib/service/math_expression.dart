import 'package:math_expressions/math_expressions.dart';

class MathExpression {
  final ExpressionParser panser = ShuntingYardParser();
  final ContextModel cm = ContextModel();

  String evaluate(String formula) {
    try {
      final expression = panser.parse(formula);
      final result = expression.evaluate(EvaluationType.REAL, cm);
      return result.toString(); 
    } catch (e) {
      throw "Error evaluate that formula";
    }
  }
}