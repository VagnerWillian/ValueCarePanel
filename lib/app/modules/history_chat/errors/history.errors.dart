import '../../../shared/errors/repository.error.dart';
import '../../../shared/errors/unknown.error.dart';
import '../../../utils/utils.dart';

class HistoryError{}

class HistoryRepositoryError extends HistoryError implements RepositoryError{

  @override
  int? statusCode;

  @override
  String? message;

  HistoryRepositoryError({this.statusCode = 5, this.message}) {
    message ??= responseErrors[statusCode]??statusCode.toString();
  }

  @override
  Map<int, String?> get responseErrors => httpErrors;

}

class DownloadArchiveError extends HistoryError{

  @override
  late String message;

  DownloadArchiveError({required this.message});
}

class HistoryUnknownError extends HistoryError implements UnknownError{

  @override
  late String message;

  @override
  late int statusCode = 0;

  HistoryUnknownError({this.message = "Problema desconhecido"});
}