import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/layout/cubit/states.dart';
import 'package:movies_app/models/genres_model.dart';
import 'package:movies_app/models/movie_model.dart';
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

  MovieModel? movieModel;

  void exploreMovies() {
    emit(GetMoviesLoadingState());
    DioHelper.getData(
      url: explore,
      token: token,
    ).then((value) {
      debugPrint(value.data.toString());
      movieModel = MovieModel.fromJson(value.data);
      emit(GetMoviesSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetMoviesErrorState());
    });
  }

  MovieModel? trendingModel;

  void getTrendingMovies() {
    emit(GetTrendingMoviesLoadingState());
    DioHelper.getData(
      url: trending,
      token: token,
    ).then((value) {
      debugPrint(value.data.toString());
      trendingModel = MovieModel.fromJson(value.data);
      emit(GetTrendingMoviesSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetTrendingMoviesErrorState());
    });
  }

  MovieModel? upcomingMoviesModel;

  void getUpcomingMovies() {
    emit(GetUpcomingMoviesLoadingState());
    DioHelper.getData(
      url: upcoming,
      token: token,
    ).then((value) {
      debugPrint(value.data.toString());
      upcomingMoviesModel = MovieModel.fromJson(value.data);
      emit(GetUpcomingMoviesSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetUpcomingMoviesErrorState());
    });
  }

  void getGenreMovies(String id) {
    DioHelper.getData(url: explore, token: token, query: {"with_genres": id})
        .then((value) {
      debugPrint(value.data.toString());
      emit(GetGenreMoviesSuccessState());
    }).catchError((error) {
      emit(GetGenreMoviesErrorState());
    });
  }

  MovieModel? topRatedMoviesModel;

  void getTopRatedMovies() {
    emit(GetTopRatedMoviesLoadingState());
    DioHelper.getData(
      url: topRated,
      token: token,
    ).then((value) {
      debugPrint(value.data.toString());
      topRatedMoviesModel = MovieModel.fromJson(value.data);
      emit(GetTopRatedMoviesSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetTopRatedMoviesErrorState());
    });
  }

  List<Results>? lastWatchedMovies = [];

  void addLastWatchedMovie(Results movie) {
    if (lastWatchedMovies!.contains(movie)) {
      lastWatchedMovies!.remove(movie);
    }

    lastWatchedMovies!.insert(0, movie);

    if (lastWatchedMovies!.length > 10) {
      lastWatchedMovies!.removeRange(10, lastWatchedMovies!.length);
    }
    emit(MovieAdded());
    debugPrint('----------------MOVIE WATCHED-----------------');
    debugPrint(movie.title);
    debugPrint(lastWatchedMovies!.length.toString());
  }
}
