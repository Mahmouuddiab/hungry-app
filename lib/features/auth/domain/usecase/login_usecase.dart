import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/errors/execptions.dart';
import 'package:hungry_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCse {
  AuthRepository authRepository;
  LoginUseCse({required this.authRepository});
  Future<Either<ServerException, Unit>> call(String email, String password) =>
      authRepository.login(email, password);
}
