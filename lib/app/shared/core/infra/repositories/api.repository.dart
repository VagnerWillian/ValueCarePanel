import 'package:value_panel/app/shared/core/domain/entities/classification.entity.dart';
import 'package:value_panel/app/shared/core/domain/entities/specialty.entity.dart';
import 'package:value_panel/app/shared/core/domain/repositories/repository.dart';
import 'package:value_panel/app/shared/core/infra/models/classification.model.dart';
import 'package:value_panel/app/shared/core/infra/models/specialty.model.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';
import 'package:value_panel/app/utils/utils.dart';

class ApiCoreRepository implements CoreRepository{
  
  final CustomDio _customDio;
  ApiCoreRepository(this._customDio);
  
  @override
  Future<List<ClassificationEntity>> getClassifications() async{
    try{
      var response = await _customDio.client.get(getClassificationsEP);
      List<ClassificationEntity> values = (response.data['result'] as List).map((c) => Classification.fromJson(c)).toList();
      return values;
    }catch(e){
      print("ERRO AO CARREGAR LISTA DE CLASSIFICACOES");
      return [];
    }
  }

  @override
  Future<List<SpecialtyEntity>> getSpecialties() async{
    try{
      var response = await _customDio.client.get(getSpecialtiesEP);
      List<SpecialtyEntity> values = (response.data['result'] as List).map((c) => Specialty.fromJson(c)).toList();
      return values;
    }catch(e){
      print("ERRO AO CARREGAR LISTA DE CLASSIFICACOES");
      return [];
    }
  }
  
}