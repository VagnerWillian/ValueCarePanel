import '../../../shared/errors/repository.error.dart';
import '../../../shared/errors/unknown.error.dart';
import '../../../utils/utils.dart';

class PatientDetailsError{}

class PatientDetailsRepositoryError extends PatientDetailsError implements RepositoryError{

  @override
  int? statusCode;

  @override
  String? message;

  PatientDetailsRepositoryError({this.statusCode = 5, this.message}) {
    message ??= responseErrors[statusCode]??statusCode.toString();
  }

  @override
  Map<int, String?> get responseErrors => httpErrors;

}

class DownloadArchiveError extends PatientDetailsError{

  late String? message;

  DownloadArchiveError({required this.message});
}

class PatientDetailsUnknownError extends PatientDetailsError implements UnknownError{

  @override
  late String message;

  @override
  late int statusCode = 0;

  PatientDetailsUnknownError({this.message = "Problema desconhecido"});
}