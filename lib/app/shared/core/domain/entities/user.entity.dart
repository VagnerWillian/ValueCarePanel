abstract class UserEntity{
  late final String id, name, picture, levelAccess, phone, email, token;
  late final bool userActive;
  late final bool pushNotifies, emailNotifies, desktopNotifies, smsNotifies;
}