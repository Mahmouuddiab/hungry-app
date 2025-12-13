import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/auth/domain/usecase/login_usecase.dart';
import 'package:hungry_app/features/auth/domain/usecase/register_usecase.dart';
import 'package:hungry_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthCubit extends Cubit<AuthStates>{
  RegisterUseCse registerUseCse;
  LoginUseCse loginUseCse;
  AuthCubit(this.registerUseCse,this.loginUseCse):super(AuthInitialState());
  Future<void> register(String name,String email,String password,String rePassword,String phone)async{
    emit(RegisterLoadingState());
    var response = await registerUseCse.call(name, email, password, rePassword, phone);
    return response.fold(
        (l) {
          emit(RegisterErrorState(l.message));
        },
        (r) {
          emit(RegisterSuccessState());
        },
    ) ;
  }

  Future<void> login(String email,String password)async{
    emit(LoginLoadingState());
    var response = await loginUseCse.call(email, password);
    return response.fold(
          (l) {
        emit(LoginErrorState(l.message));
      },
          (r) {
        emit(LoginSuccessState());
      },
    ) ;
  }
}