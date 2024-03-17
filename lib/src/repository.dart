import 'package:flutter/foundation.dart';
import 'package:repository/repository.dart';

/// {@template repository}
/// A generic repository implementation that provides CRUD operations for data
/// handling.
///
/// Currently, this implementation only supports remote data handling.
/// {@endtemplate}
class Repository extends RepositoryInterface {
  /// {@macro repository}
  Repository();

  @override
  Future<void> create<T>({
    required List<T> records,
  }) async {
    final remoteDataHandler = getRemoteDataHandler<T>();

    if (remoteDataHandler != null) {
      return await remoteDataHandler.create(records: records);
    }

    debugPrint('Failed to create records of type $T');
  }

  @override
  Future<void> update<T>({
    Map<String, dynamic> fieldsToUpdate = const {},
    List<Filter> filters = const [],
  }) async {
    final RemoteDataHandler<T>? remoteDataHandler = getRemoteDataHandler<T>();

    if (remoteDataHandler != null) {
      return await remoteDataHandler.update(
        fieldsToUpdate: fieldsToUpdate,
        filters: filters,
      );
    }

    debugPrint('Failed to update records of type $T');
  }

  @override
  Future<void> delete<T>({
    List<Filter> filters = const [],
  }) async {
    final RemoteDataHandler<T>? remoteDataHandler = getRemoteDataHandler<T>();

    if (remoteDataHandler != null) {
      return await remoteDataHandler.delete(filters: filters);
    }
    debugPrint('Failed to delete records of type $T');
  }

  @override
  Future<List<T>> read<T>({
    List<Filter> filters = const [],
  }) async {
    final RemoteDataHandler<T>? remoteDataHandler = getRemoteDataHandler<T>();

    if (remoteDataHandler != null) {
      return await remoteDataHandler.read(filters: filters);
    }
    debugPrint('Failed to read records of type $T');

    return [];
  }

  @override
  Stream<List<T>> stream<T>({
    List<Filter> filters = const [],
  }) {
    final RemoteDataHandler<T>? remoteDataHandler = getRemoteDataHandler<T>();

    if (remoteDataHandler != null) {
      return remoteDataHandler.stream(filters: filters);
    }
    debugPrint('Failed to stream records of type $T');

    return const Stream.empty();
  }
}
