import 'package:value_panel/app/shared/errors/repository.error.dart';

class MonitoringError{
  late String message;

  MonitoringError({required this.message});
}

class MonitoringRepositoryError extends MonitoringError implements RepositoryError{

  @override
  late String message;

  @override
  late int statusCode;

  MonitoringRepositoryError({required this.message, required this.statusCode}) : super(message: '');
}

class DownloadArchiveError extends MonitoringError{

  @override
  late String message;

  DownloadArchiveError({required this.message}) : super(message: '');
}