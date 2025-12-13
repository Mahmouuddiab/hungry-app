abstract class AuthStates{}

class AuthInitialState extends AuthStates{}

class RegisterLoadingState extends AuthStates{}
class RegisterSuccessState extends AuthStates {}
class RegisterErrorState extends AuthStates {
  final String error;
  RegisterErrorState(this.error);
}

class LoginLoadingState extends AuthStates{}
class LoginSuccessState extends AuthStates {}
class LoginErrorState extends AuthStates {
  final String error;
  LoginErrorState(this.error);
}

