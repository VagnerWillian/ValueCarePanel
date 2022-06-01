import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter/services.dart';

import '../../../../shared/core/domain/entities/user.entity.dart';
import '../../../../shared/core/infra/models/user.model.dart';
import '../../domain/repositories/repository.dart';
import '../../errors/users_errors.dart';

class AssetUsersRepository implements UsersRepository{

  @override
  Future<Either<UsersError, List<UserEntity>>> getAllUsers() async{
    await Future.delayed(const Duration(seconds: 1));
    String data = await rootBundle.loadString('assets/static_jsons/users.json');
    var jsonResult = json.decode(data);
    List<UserEntity> users = (jsonResult as List).map((u) => UserModel.fromJson(u)).toList();
    return Right(users);

  }

  @override
  Future<Either<UsersError, UserEntity>> createUser({required String name, required String email, required String phone, required int level}) async{
    await Future.delayed(const Duration(seconds: 1));
    String data = await rootBundle.loadString('assets/static_jsons/logged_user.json');
    var jsonResult = json.decode(data);
    return Right(UserModel.fromJson(jsonResult));
  }

  @override
  Future<Either<UsersError, bool>> activateUser({required String operatorId}) async{
    await Future.delayed(const Duration(seconds: 2));
    return const Right(true);
  }

  @override
  Future<Either<UsersError, bool>> deactivateUser({required String operatorId}) async{
    await Future.delayed(const Duration(seconds: 2));
    return const Right(true);
  }

  @override
  Future<Either<UsersError, bool>> deleteUser({required String operatorId}) async{
    await Future.delayed(const Duration(seconds: 2));
    return const Right(true);
  }

}