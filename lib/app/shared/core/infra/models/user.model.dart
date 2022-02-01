import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';

class UserModel implements UserEntity{

  @override
  late int id;

  @override
  late String levelAcess;

  @override
  late String name;

  @override
  late String picture;

  UserModel({required this.id, required this.name, required this.levelAcess, required this.picture});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    levelAcess = json['levelAcess'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['levelAcess'] = this.levelAcess;
    data['picture'] = this.picture;
    return data;
  }
}
