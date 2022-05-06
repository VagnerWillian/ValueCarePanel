import '../../../shared/errors/repository.error.dart';
import '../../../shared/errors/unknown.error.dart';
import '../../../utils/utils.dart';

class SplashError{}

class SplashRepositoryError extends SplashError implements RepositoryError{

  @override
  int? statusCode;

  @override
  String? message;

  SplashRepositoryError({this.statusCode = 5, this.message}) {
    message ??= responseErrors[statusCode]??statusCode.toString();
  }

  @override
  Map<int, String?> get responseErrors => httpErrors;

}

class UnknownSplashError extends SplashError implements UnknownError{

  @override
  late String message;

  @override
  late int statusCode = 0;

  UnknownSplashError({this.message = "Problema desconhecido"});
}