import 'package:either_dart/either.dart';
import '../../errors/patient_details.errors.dart';
import '../entities/patient.entity.dart';

abstract class GetPatientDetailsUseCase{
  Future<Either<PatientDetailsError, PatientEntity>> call();
}