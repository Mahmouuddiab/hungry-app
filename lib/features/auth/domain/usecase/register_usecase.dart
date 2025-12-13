import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/errors/execptions.dart';
import 'package:hungry_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCse {
  AuthRepository authRepository;
  RegisterUseCse({required this.authRepository});
  Future<Either<ServerException, Unit>> call(String name, String email, String password, String rePassword,String phone) =>
      authRepository.register(name, email, password, rePassword,phone);
}
