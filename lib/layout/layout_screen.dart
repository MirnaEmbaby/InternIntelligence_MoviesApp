import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/layout/cubit/cubit.dart';
import 'package:movies_app/layout/cubit/states.dart';
import 'package:movies_app/models/genres_model.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/modules/favourites_screen/favourites_screen.dart';
import 'package:movies_app/modules/profile_screen/profile_screen.dart';
import 'package:movies_app/modules/search_screen/search_screen.dart';
import 'package:movies_app/modules/settings_screen/settings_screen.dart';
import 'package:movies_app/modules/watching_list_screen/watching_list_screen.dart';
import 'package:movies_app/shared/components/components.dart';
import 'package:movies_app/shared/styles/colors.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = AppCubit.get(context).userModel;

        return ConditionalBuilder(
          condition: AppCubit.get(context).userModel != null,
          builder: (context) => Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60.0),
              child: AppBar(
                titleSpacing: 0.0,
                title: Text(
                  'Home',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                backgroundColor: defBlack,
                actionsIconTheme: const IconThemeData(
                  color: defWhite,
                ),
                iconTheme: const IconThemeData(
                  color: defWhite,
                ),
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.search_outlined,
                      size: 30.0,
                    ),
                    onPressed: () {
                      navigateTo(
                        context,
                        const SearchScreen(),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                ],
              ),
            ),
            drawer: Drawer(
              backgroundColor: defBlack,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 50.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            model!.image,
                          ),
                          radius: 70.0,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          model.userName,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildDrawerItem(
                          context: context,
                          text: 'My Profile',
                          screen: const ProfileScreen(),
                        ),
                        buildDrawerItem(
                          context: context,
                          text: 'My Favourites',
                          screen: const FavouritesScreen(),
                        ),
                        buildDrawerItem(
                          context: context,
                          text: 'My Watching List',
                          screen: const WatchingListScreen(),
                        ),
                        buildDrawerItem(
                          context: context,
                          text: 'Settings',
                          screen: const SettingsScreen(),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () {
                                logOut(context);
                              },
                              style: const ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                  defPink,
                                ),
                                alignment: AlignmentDirectional.center,
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  'Log Out',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                color: defBlack,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header(
                      context: context,
                      text: 'Trending movies',
                      function: () {},
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: CarouselSlider.builder(
                        itemCount: 5,
                        itemBuilder: (context, index, pageViewIndex) {
                          return ConditionalBuilder(
                            condition:
                                AppCubit.get(context).trendingModel != null,
                            builder: (context) => InkWell(
                              onTap: () {
                                AppCubit.get(context).addLastWatchedMovie(
                                  AppCubit.get(context)
                                      .trendingModel!
                                      .results![index],
                                );
                              },
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Container(
                                    foregroundDecoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.transparent,
                                          defBlack,
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        stops: [0.4, 0.9],
                                      ),
                                    ),
                                    child: Image(
                                      width: double.infinity,
                                      image: NetworkImage(
                                          "https://image.tmdb.org/t/p/w500${AppCubit.get(context).trendingModel!.results![index].posterPath!}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Text(
                                      "${AppCubit.get(context).trendingModel!.results![index].title!}  "
                                      "${DateTime.parse(AppCubit.get(context).trendingModel!.results![index].releaseDate!).year}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            fallback: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          height: 250.0,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          viewportFraction: 1.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    ConditionalBuilder(
                      condition: AppCubit.get(context).genresModel != null &&
                          AppCubit.get(context).userModel != null,
                      fallback: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      builder: (context) {
                        return SizedBox(
                          height: 50.0,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => genreItem(
                              context: context,
                              list: AppCubit.get(context)
                                  .genresModel!
                                  .genres![index],
                              function: () => AppCubit.get(context)
                                  .getGenreMovies(AppCubit.get(context)
                                      .genresModel!
                                      .genres![index]
                                      .id
                                      .toString()),
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 10.0,
                            ),
                            itemCount: AppCubit.get(context)
                                .genresModel!
                                .genres!
                                .length,
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    header(
                      context: context,
                      text: 'Last watched',
                      function: () {},
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    ConditionalBuilder(
                      condition:
                          AppCubit.get(context).lastWatchedMovies!.isNotEmpty,
                      builder: (context) => SizedBox(
                        height: 200.0,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => lastWatchedListItem(
                              context: context,
                              movie: AppCubit.get(context)
                                  .lastWatchedMovies![index]),
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 16.0,
                          ),
                          itemCount:
                              AppCubit.get(context).lastWatchedMovies!.length,
                        ),
                      ),
                      fallback: (context) => Center(
                        heightFactor: 10,
                        child: Text(
                          'You didn\'t watch any movies recently',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    header(
                      context: context,
                      text: 'Explore',
                      function: () {},
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    ConditionalBuilder(
                      condition: AppCubit.get(context).movieModel != null,
                      builder: (context) => SizedBox(
                        height: 250.0,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return buildMoviePoster(
                              index: index,
                              context: context,
                              movieModel: AppCubit.get(context)
                                  .movieModel!
                                  .results![index],
                              image:
                                  "https://image.tmdb.org/t/p/w500${AppCubit.get(context).movieModel!.results![index].posterPath!}",
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 16.0,
                          ),
                          itemCount: 5,
                        ),
                      ),
                      fallback: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    header(
                      context: context,
                      text: 'Top rated movies',
                      function: () {},
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    ConditionalBuilder(
                      condition:
                          AppCubit.get(context).topRatedMoviesModel != null,
                      builder: (context) => SizedBox(
                        height: 250.0,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => buildMoviePoster(
                              index: index,
                              context: context,
                              movieModel: AppCubit.get(context)
                                  .topRatedMoviesModel!
                                  .results![index],
                              image:
                                  "https://image.tmdb.org/t/p/w500${AppCubit.get(context).topRatedMoviesModel!.results![index].posterPath!}"),
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 16.0,
                          ),
                          itemCount: 5,
                        ),
                      ),
                      fallback: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    header(
                      context: context,
                      text: 'Upcoming movies',
                      function: () {},
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    ConditionalBuilder(
                      condition:
                          AppCubit.get(context).upcomingMoviesModel != null,
                      builder: (context) => SizedBox(
                        height: 250.0,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => buildMoviePoster(
                            index: index,
                            context: context,
                            movieModel: AppCubit.get(context)
                                .upcomingMoviesModel!
                                .results![index],
                            image:
                                "https://image.tmdb.org/t/p/w500${AppCubit.get(context).upcomingMoviesModel!.results![index].posterPath!}",
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 16.0,
                          ),
                          itemCount: 5,
                        ),
                      ),
                      fallback: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

Widget genreItem({
  required context,
  required Genres list,
  required Function function,
}) {
  return TextButton(
    onPressed: () => function(),
    style: const ButtonStyle(
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 0,
        ),
      ),
      backgroundColor: WidgetStatePropertyAll(
        defGrey,
      ),
    ),
    child: Text(
      list.name!,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.bold,
          ),
    ),
  );
}

Widget header({
  required context,
  required String text,
  required Function function,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        text,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      const Spacer(),
      TextButton(
        onPressed: () => function(),
        style: const ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
        ),
        child: Text(
          'See all',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    ],
  );
}

Widget lastWatchedListItem({
  required context,
  required Results movie,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
    child: InkWell(
      onTap: () {},
      child: SizedBox(
        width: 250.0,
        height: 100.0,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image(
              width: double.infinity,
              image: NetworkImage(
                  "https://image.tmdb.org/t/p/w500${movie.posterPath}"),
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              height: 110.0,
              decoration: const BoxDecoration(
                color: defGrey,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title!,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        movie.releaseDate!,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 10),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          color: defWhite,
                          size: 20.0,
                          Icons.favorite_border_rounded,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget buildMoviePoster(
    {required String image,
    required context,
    required int index,
    required Results movieModel}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
    child: InkWell(
      onTap: () {
        AppCubit.get(context).addLastWatchedMovie(movieModel);
      },
      child: SizedBox(
        width: 140.0,
        height: 100,
        child: Image(
          width: double.infinity,
          height: double.infinity,
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget buildDrawerItem({
  required context,
  required String text,
  required Widget screen,
}) {
  return SizedBox(
    width: double.infinity,
    child: TextButton(
      onPressed: () => navigateTo(context, screen),
      style: const ButtonStyle(
          alignment: AlignmentDirectional.centerStart,
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // Removes the border radius
            ),
          )),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    ),
  );
}
