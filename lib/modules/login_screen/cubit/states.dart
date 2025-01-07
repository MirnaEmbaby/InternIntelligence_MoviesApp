abstract class LoginStates {}

class InitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final String uId;

  LoginSuccessState(this.uId);
}

class LoginErrorState extends LoginStates {}

class LoginPassVisibilityChangeSuccessState extends LoginStates {}
