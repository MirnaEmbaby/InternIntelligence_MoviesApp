import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/models/user_model.dart';
import 'package:movies_app/modules/signup_screen/cubit/states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(InitialState());
  static SignUpCubit get(context) => BlocProvider.of(context);

  void createUser({
    String? image,
    required String userName,
    required String email,
    required String uId,
  }) {
    UserModel model = UserModel(
      userName: userName,
      email: email,
      uId: uId,
      image:
          'https://www.shutterstock.com/image-vector/default-avatar-profile-icon-social-600nw-1677509740.jpg',
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc('uId')
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(CreateUserErrorState(error.toString()));
    });
  }

  void signUp({
    required String userName,
    required String email,
    required String password,
  }) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      createUser(
        userName: userName,
        email: email,
        uId: value.user!.uid,
      );
      emit(SignUpSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(SignUpErrorState());
    });
  }

  IconData suffixIcon = Icons.visibility_outlined;
  bool isVisible = true;

  void changeVisibility() {
    isVisible = !isVisible;
    suffixIcon =
        isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SignUpPassVisibilityChangeSuccessState());
  }
}
