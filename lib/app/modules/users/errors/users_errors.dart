import '../../../shared/errors/repository.error.dart';
import '../../../shared/errors/unknown.error.dart';
import '../../../utils/utils.dart';

class UsersError{}

class UsersRepositoryError extends UsersError implements RepositoryError{

  @override
  int? statusCode;

  @override
  String? message;

  UsersRepositoryError({this.statusCode = 5, this.message}) {
    message ??= responseErrors[statusCode]??statusCode.toString();
  }

  @override
  Map<int, String?> get responseErrors => httpErrors;

}

class UsersUnknownError extends UsersError implements UnknownError{

  @override
  late String message;

  @override
  late int statusCode = 0;

  UsersUnknownError({this.message = "Problema desconhecido"});
}