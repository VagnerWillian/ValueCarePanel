import '../../../shared/errors/repository.error.dart';
import '../../../shared/errors/unknown.error.dart';
import '../../../utils/utils.dart';

class HomeError{}

class HomeRepositoryError extends HomeError implements RepositoryError{

  @override
  int? statusCode;

  @override
  String? message;

  HomeRepositoryError({this.statusCode = 5, this.message}) {
    message ??= responseErrors[statusCode]??statusCode.toString();
  }

  @override
  Map<int, String?> get responseErrors => httpErrors;

}

class UnknownHomeError extends HomeError implements UnknownError{

  @override
  late String message;

  @override
  late int statusCode = 0;

  UnknownHomeError({this.message = "Problema desconhecido"});
}