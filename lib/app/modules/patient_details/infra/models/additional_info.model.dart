import 'package:value_panel/app/modules/patient_details/domain/entities/additional_info.entity.dart';

class AdditionalInfo implements AdditionalInfoEntity{

  @override
  late final String title;

  @override
  late final String urlImage;

  @override
  late final String value;

  AdditionalInfo({required this.urlImage, required this.title, required this.value});

  AdditionalInfo.fromJson(Map<String, dynamic> json) {
    urlImage = json['urlImage'];
    title = json['title'];
    value = json['value'];
  }

}