import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';

class UserModel implements UserEntity {
  @override
  late final String id;

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

  @override
  late final bool desktopNotifies;

  @override
  late final bool emailNotifies;

  @override
  late final bool pushNotifies;

  @override
  late final bool smsNotifies;

  @override
  late bool userActive;

  UserModel(
      {required this.id,
      required this.userActive,
      required this.name,
      required this.levelAccess,
      required this.picture,
      required this.phone,
      required this.email,
      this.token = '',
      required this.desktopNotifies,
      required this.pushNotifies,
      required this.emailNotifies,
      required this.smsNotifies});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['nome'];
    userActive = json['ativo'];
    levelAccess = json['nivel'];
    picture = json['foto'];
    phone = json['telefone'];
    email = json['email'];
    token = json['token'] ?? '';
    desktopNotifies = json['desktopNotifies'] ?? false;
    pushNotifies = json['pushNotifies'] ?? true;
    emailNotifies = json['emailNotifies'] ?? false;
    smsNotifies = json['smsNotifies'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['nivel'] = levelAccess;
    data['picture'] = picture;
    data['phone'] = phone;
    data['email'] = email;
    data['token'] = token;
    data['desktopNotifies'] = desktopNotifies;
    data['pushNotifies'] = pushNotifies;
    data['emailNotifies'] = emailNotifies;
    data['smsNotifies'] = smsNotifies;
    return data;
  }

}
