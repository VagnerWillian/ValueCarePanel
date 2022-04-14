import 'package:value_panel/app/modules/patient_details/domain/entities/additional_info.entity.dart';

class AdditionalInfo implements AdditionalInfoEntity{

  @override
  late final int id;

  @override
  late final String title;

  @override
  late final String urlImage;

  @override
  late final String value;

  AdditionalInfo({required this.urlImage, required this.title, required this.value});

  AdditionalInfo.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    urlImage = json['image']??"";
    title = json['title'];
    value = json['valor'];
  }

}