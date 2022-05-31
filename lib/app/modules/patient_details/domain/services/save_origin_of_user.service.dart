import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/patient_details/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/patient_details/domain/usecases/save_origin_of_user.usecase.dart';
import 'package:value_panel/app/modules/patient_details/errors/patient_details.errors.dart';

class SaveOriginOfUser implements SaveOriginOfUserUseCase{

  final PatientDetailsRepository _patientDetailsRepository;
  SaveOriginOfUser(this._patientDetailsRepository);

  @override
  Future<Either<PatientDetailsError, bool>> call(String newOrigin)async{
    return await _patientDetailsRepository.saveOriginOfUser(newOrigin);
  }
}