import 'package:repository/repository.dart';

/// {@template data_handler}
/// A data handler that provides CRUD operations for a specific data type.
///  {@endtemplate}
abstract class DataHandler<T> {
  Serializer<T> get serializer;

  Future<void> create({
    required List<T> records,
  });

  Future<List<T>> read({
    List<Filter> filters = const [],
  });

  Future<void> update({
    Map<String, dynamic> fieldsToUpdate = const {},
    List<Filter> filters = const [],
  });

  Future<void> delete({
    List<Filter> filters = const [],
  });

  Stream<List<T>> stream({
    List<Filter> filters = const [],
  });
}
