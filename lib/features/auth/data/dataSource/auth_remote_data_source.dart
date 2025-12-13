import 'package:hungry_app/features/auth/data/models/UserModel.dart';

abstract class AuthRemoteDataSource{
  Future<UserModel> register(
      String name,
      String email,
      String password,
      String rePassword,
      String phone
      );

  Future<UserModel> login(
      String email,
      String password
      );
}