import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/shared/styles/colors.dart';

class MoviesListScreen extends StatelessWidget {
  const MoviesListScreen({super.key, required this.movieList});

  final MovieModel movieList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          movieList.results!.first.title!,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        iconTheme: const IconThemeData(
          color: defWhite,
        ),
        backgroundColor: defPink,
      ),
      body: Container(
        color: defBlack,
      ),
    );
  }
}
