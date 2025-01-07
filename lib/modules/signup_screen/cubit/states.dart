abstract class SignUpStates {}

class InitialState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {}

class SignUpErrorState extends SignUpStates {}

class SignUpPassVisibilityChangeSuccessState extends SignUpStates {}

class CreateUserSuccessState extends SignUpStates {}

class CreateUserErrorState extends SignUpStates {
  final String error;

  CreateUserErrorState(this.error);
}
