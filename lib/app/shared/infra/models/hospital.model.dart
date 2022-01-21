import 'package:value_panel/app/shared/domain/entities/hospital.entity.dart';

class HospitalModel implements HospitalEntity{

  @override
  late int id;

  @override
  late String name;

  HospitalModel({required this.id, required this.name});

  HospitalModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
