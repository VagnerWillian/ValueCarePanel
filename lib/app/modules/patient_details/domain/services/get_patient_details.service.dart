import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/patient_details/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/patient_details/domain/usecases/get_patient_details.usecase.dart';
import '../../errors/patient_details.errors.dart';
import '../entities/patient.entity.dart';

class GetPatientDetails implements GetPatientDetailsUseCase{

  final PatientDetailsRepository _patientDetailsRepository;
  GetPatientDetails(this._patientDetailsRepository);

  @override
  Future<Either<PatientDetailsError, PatientEntity>> call({required String idUserPatient, required String idPatient})async{
    return _patientDetailsRepository.getPatientDetails(idUserPatient: idUserPatient, idPatient: idPatient);
  }
}