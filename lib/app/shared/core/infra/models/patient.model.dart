abstract class PatientEntity{
  late final String id;
  late final String name;

  PatientEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}