import 'package:flutter/foundation.dart';
import 'package:repository/repository.dart';

abstract class RepositoryInterface {
  @protected
  final Map<Type, LocalDataHandler> localDataHandlers = {};

  @protected
  final Map<Type, RemoteDataHandler> remoteDataHandlers = {};

  Future<void> create<T>({
    required List<T> records,
  });

  Future<void> update<T>({
    Map<String, dynamic> fieldsToUpdate = const {},
    List<Filter> filters = const [],
  });

  Future<void> delete<T>({
    List<Filter> filters = const [],
  });

  Future<List<T>> read<T>({
    List<Filter> filters = const [],
  });

  Stream<List<T>> stream<T>({
    List<Filter> filters,
  });

  /// Register a [LocalDataHandler] and/or [RemoteDataHandler] for a given type
  /// [T].
  ///
  /// Operations on [T] can only be performed if a [LocalDataHandler] or
  /// [RemoteDataHandler] is registered for [T].
  void register<T>({
    LocalDataHandler<T>? localDataHandler,
    RemoteDataHandler<T>? remoteDataHandler,
    Future<void> Function()? onRegister,
  }) {
    assert(
      localDataHandler != null || remoteDataHandler != null,
      'At least one of localDataHandler or remoteDataHandler must be provided',
    );

    if (localDataHandler != null) localDataHandlers[T] = localDataHandler;
    if (remoteDataHandler != null) remoteDataHandlers[T] = remoteDataHandler;

    if (onRegister != null) onRegister.call();
  }

  LocalDataHandler<T>? getLocalDataHandler<T>() {
    return localDataHandlers.containsKey(T)
        ? localDataHandlers[T] as LocalDataHandler<T>
        : null;
  }

  RemoteDataHandler<T>? getRemoteDataHandler<T>() {
    return remoteDataHandlers.containsKey(T)
        ? remoteDataHandlers[T] as RemoteDataHandler<T>
        : null;
  }
}
