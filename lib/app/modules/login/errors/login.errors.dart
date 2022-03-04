import '../../../shared/errors/repository.error.dart';
import '../../../shared/errors/unknown.error.dart';
import '../../../utils/utils.dart';

class LoginError{}

class LoginRepositoryError extends LoginError implements RepositoryError{

  @override
  int? statusCode;

  @override
  String? message;

  LoginRepositoryError({this.statusCode = 5, this.message}) {
    message ??= responseErrors[statusCode]??statusCode.toString();
  }

  @override
  Map<int, String?> get responseErrors => httpErrors;

}

class UnknownLoginError extends LoginError implements UnknownError{

  @override
  late String message;

  @override
  late int statusCode = 0;

  UnknownLoginError({this.message = "Problema desconhecido"});
}