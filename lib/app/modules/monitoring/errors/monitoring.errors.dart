import '../../../shared/errors/repository.error.dart';
import '../../../shared/errors/unknown.error.dart';
import '../../../utils/utils.dart';

class MonitoringError{}

class MonitoringRepositoryError extends MonitoringError implements RepositoryError{

  @override
  int? statusCode;

  @override
  String? message;

  MonitoringRepositoryError({this.statusCode = 5, this.message}) {
    message ??= responseErrors[statusCode]??statusCode.toString();
  }

  @override
  Map<int, String?> get responseErrors => httpErrors;

}

class DownloadArchiveError extends MonitoringError{

  @override
  late String message;

  DownloadArchiveError({required this.message});
}

class MonitoringUnknownError extends MonitoringError implements UnknownError{

  @override
  late String message;

  @override
  late int statusCode = 0;

  MonitoringUnknownError({this.message = "Problema desconhecido"});
}