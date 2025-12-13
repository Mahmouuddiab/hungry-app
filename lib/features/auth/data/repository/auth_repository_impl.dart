import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/errors/execptions.dart';
import 'package:hungry_app/features/auth/data/dataSource/auth_remote_data_source.dart';
import 'package:hungry_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:AuthRepository)
class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<ServerException, Unit>> register(String name, String email, String password, String rePassword,String phone)async{
    await authRemoteDataSource.register(name, email, password, rePassword, phone);
    return right(unit);
  }

  @override
  Future<Either<ServerException, Unit>> login(String email, String password)async{
    await authRemoteDataSource.login(email, password);
    return right(unit);
  }
  
}