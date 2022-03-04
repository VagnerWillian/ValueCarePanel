import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';

class UserModel implements UserEntity{

  @override
  late final int id;

  @override
  late final String levelAccess;

  @override
  late final String name;

  @override
  late final String picture;

  @override
  late final String phone;

  @override
  late final String email;

  @override
  late final String token;

  UserModel({required this.id, required this.name, required this.levelAccess, required this.picture, required this.phone, required this.email, this.token = ''});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['nome'];
    levelAccess = json['nivel'];
    picture = json['foto'];
    phone = json['telefone'];
    email = json['email'];
    token = json['token']??'';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['levelAccess'] = levelAccess;
    data['picture'] = picture;
    data['phone'] = phone;
    data['email'] = email;
    data['token'] = token;
    return data;
  }
}
