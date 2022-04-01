import 'package:value_panel/app/modules/patient_details/domain/entities/sequel_info.entity.dart';

class SequelInfo implements SequelInfoEntity{

  @override
  late final String label;

  @override
  late final String value;

  SequelInfo({required this.label, required this.value});

  SequelInfo.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'];
  }
}