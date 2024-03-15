import 'package:repository/repository.dart';

/// {@template filter}
/// A filter to be used in a query.
///
/// [field] is the name of the field to be filtered.
///
/// [value] is the value to be used in the filter.
///
/// [operator] is the operator to be used in the filter.
///
/// [FilterType] is the type of the value to be used in the filter, i.e.
/// [String], [int], [double], [bool], [List].
///
/// For example, to filter for a field named 'name' with a value of 'John', the
/// filter would be:
///
/// ```dart
/// StringFilter(
///  field: 'name',
///  value: 'John',
/// )
/// ```
///
///
/// {@endtemplate}
abstract class Filter<FilterType> {
  String get field;
  FilterType get value;
  FilterOperator get operator;
}

class StringFilter implements Filter<String> {
  StringFilter({
    required this.field,
    required this.value,
    this.operator = FilterOperator.equalTo,
  });

  @override
  final String field;
  @override
  final String value;
  @override
  FilterOperator operator;
}

class BoolFilter implements Filter<bool> {
  BoolFilter({
    required this.field,
    required this.value,
    this.operator = FilterOperator.equalTo,
  });

  @override
  final String field;
  @override
  final bool value;
  @override
  FilterOperator operator;
}

class DoubleFilter implements Filter<double> {
  DoubleFilter({
    required this.field,
    required this.value,
    this.operator = FilterOperator.equalTo,
  });

  @override
  final String field;
  @override
  final double value;
  @override
  FilterOperator operator;
}

class IntFilter implements Filter<int> {
  IntFilter({
    required this.field,
    required this.value,
    this.operator = FilterOperator.equalTo,
  });

  @override
  final String field;
  @override
  final int value;
  @override
  FilterOperator operator;
}

// class ListFilter implements Filter<List> {
//   ListFilter({
//     required this.name,
//     required this.value,
//   });

//   @override
//   final String name;
//   @override
//   final List value;
// }
