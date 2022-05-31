import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/patient_details/errors/patient_details.errors.dart';

abstract class SaveOriginOfUserUseCase{
  Future<Either<PatientDetailsError, bool>> call(String newOrigin);
}