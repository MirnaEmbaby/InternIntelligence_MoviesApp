import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/modules/login_screen/cubit/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      debugPrint(value.user!.email);
      debugPrint(value.user?.uid);

      emit(LoginSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(LoginErrorState());
    });
  }

  IconData suffixIcon = Icons.visibility_outlined;
  bool isVisible = true;

  void changeVisibility() {
    isVisible = !isVisible;
    suffixIcon =
        isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginPassVisibilityChangeSuccessState());
  }
}
