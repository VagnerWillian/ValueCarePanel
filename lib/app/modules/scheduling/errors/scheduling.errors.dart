import 'package:value_panel/app/shared/errors/repository.error.dart';
import 'package:value_panel/app/shared/errors/unknown.error.dart';

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
  Map<int, dynamic> get responseErrors => {
    // Errors from Dio
    0 :   "Tempo de limite esgotado",
    1 :   "Tempo de envio esgotado",
    2 :   "Tempo de recebimento esgotado",
    5 :   "Verifique sua conexão com a internet",

    // Erros from response
    401 : "Solicitação não autorizada, sessão expirada, entre novamente para continuar.",
    404 : "Não encontrado",
    500 : "Erro no servidor interno",
    503 : "Servidor indisponível"
  };

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