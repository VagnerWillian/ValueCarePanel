import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';

class UserModel implements UserEntity{

  @override
  late String id;

  @override
  late String levelAccess;

  @override
  late String name;

  @override
  late String picture;

  @override
  late String phone;

  @override
  late String email;

  UserModel({required this.id, required this.name, required this.levelAccess, required this.picture, required this.phone, required this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['nome'];
    levelAccess = json['nivel'];
    picture = json['foto'];
    phone = json['telefone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['levelAccess'] = levelAccess;
    data['picture'] = picture;
    data['phone'] = phone;
    data['email'] = email;
    return data;
  }
}
