import 'package:equatable/equatable.dart';

sealed class EvaluateFormulaState extends Equatable{}

final class SuccessEvaluate extends EvaluateFormulaState{
  final String value;

  SuccessEvaluate(this.value);
  
  @override
  List<Object?> get props => [value];
}

final class ErrorEvaluate extends EvaluateFormulaState{
  final String message;

  ErrorEvaluate(this.message);
  
  @override
  List<Object?> get props => [message];
}