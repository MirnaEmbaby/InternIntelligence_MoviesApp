import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/layout/cubit/states.dart';
import 'package:movies_app/models/genres_model.dart';
import 'package:movies_app/models/user_model.dart';
import 'package:movies_app/shared/network/remote/dio_helper.dart';
import 'package:movies_app/shared/network/remote/end_points.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  void getUserData() {
    FirebaseFirestore.instance
        .collection('users')
        .doc('uId')
        .get()
        .then((value) {
      debugPrint(value.data().toString());
      userModel = UserModel.fromJson(value.data()!);
      emit(GetUserDataSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetUserDataErrorState());
    });
  }

  GenresModel? genresModel;

  void getGenres() {
    DioHelper.getData(
      url: genresEP,
      token: token,
    ).then((value) {
      genresModel = GenresModel.fromJson(value.data);
      debugPrint(value.data.toString());
      debugPrint(genresModel!.genres!.first.name);
      emit(GetGenresSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetGenresErrorState());
    });
  }
}
