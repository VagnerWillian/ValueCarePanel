import 'package:value_panel/app/shared/errors/repository.error.dart';
import 'package:value_panel/app/shared/errors/unknown.error.dart';

import '../../../utils/utils.dart';

class DashboardError{}

class DashboardRepositoryError extends DashboardError implements RepositoryError{

  @override
  int? statusCode;

  @override
  String? message;

  DashboardRepositoryError({this.statusCode = 5, this.message}) {
    message ??= responseErrors[statusCode]??statusCode.toString();
  }

  @override
  Map<int, String?> get responseErrors => httpErrors;

}

class DownloadArchiveError extends DashboardError{

  late String message;

  DownloadArchiveError({required this.message});
}

class DashboardUnknownError extends DashboardError implements UnknownError{

  @override
  late String message;

  @override
  late int statusCode = 0;

  DashboardUnknownError({this.message = "Problema desconhecido"});
}