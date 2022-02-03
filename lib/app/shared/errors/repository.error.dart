class RepositoryError{
  final int? statusCode;
  final String? message;

  RepositoryError({this.statusCode = 0, this.message});

  // ============ RESPONSE ERROS ========================
  Map<int, dynamic> get responseErrors => {};
}