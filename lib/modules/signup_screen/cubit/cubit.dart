import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/modules/signup_screen/cubit/states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(InitialState());
  static SignUpCubit get(context) => BlocProvider.of(context);

  IconData suffixIcon = Icons.visibility_outlined;
  bool isVisible = true;

  void changeVisibility() {
    isVisible = !isVisible;
    suffixIcon =
        isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SignUpPassVisibilityChangeSuccessState());
  }
}
