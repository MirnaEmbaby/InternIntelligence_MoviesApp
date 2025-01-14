import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/layout/cubit/cubit.dart';
import 'package:movies_app/layout/cubit/states.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/shared/styles/colors.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen(this.movie, {super.key});
  final Results movie;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: Text(
              movie.title!,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(
              color: defWhite,
            ),
          ),
          body: Container(
            color: defBlack,
          ),
        );
      },
    );
  }
}
