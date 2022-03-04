import '../../../shared/errors/repository.error.dart';
import '../../../shared/errors/unknown.error.dart';
import '../../../utils/utils.dart';

class SchedulingError{}

class SchedulingRepositoryError extends SchedulingError implements RepositoryError{

  @override
  int? statusCode;

  @override
  String? message;

  SchedulingRepositoryError({this.statusCode = 5, this.message}) {
    message ??= responseErrors[statusCode]??statusCode.toString();
  }

  @override
  Map<int, String?> get responseErrors => httpErrors;

}

class DownloadArchiveError extends SchedulingError{

  @override
  late String message;

  DownloadArchiveError({required this.message});
}

class SchedulingUnknownError extends SchedulingError implements UnknownError{

  @override
  late String message;

  @override
  late int statusCode = 0;

  SchedulingUnknownError({this.message = "Problema desconhecido"});
}