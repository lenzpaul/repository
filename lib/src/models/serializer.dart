/// {@template repository_serializer}
/// Used to serialize and deserialize data when interacting with a repository.
/// {@endtemplate}
class Serializer<T> {
  /// {@macro repository_serializer}
  Serializer({
    required this.toJson,
    required this.fromJson,
  });

  final Map<String, dynamic> Function(T data) toJson;
  final T Function(Map<String, dynamic> json) fromJson;
}
