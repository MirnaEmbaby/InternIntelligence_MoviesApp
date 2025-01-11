import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/layout/cubit/cubit.dart';
import 'package:movies_app/layout/cubit/states.dart';
import 'package:movies_app/models/genres_model.dart';
import 'package:movies_app/modules/login_screen/login_screen.dart';
import 'package:movies_app/modules/search_screen/search_screen.dart';
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
            appBar: AppBar(
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
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                model!.image,
                              ),
                              radius: 70.0,
                            ),
                            CircleAvatar(
                              radius: 18.0,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.camera_alt_outlined,
                                  size: 20.0,
                                ),
                              ),
                            ),
                          ],
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
                        buildDrawerItem(context: context, text: 'My Profile'),
                        buildDrawerItem(
                            context: context, text: 'My Favourites'),
                        buildDrawerItem(
                            context: context, text: 'My Watching List'),
                        buildDrawerItem(context: context, text: 'Settings'),
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
                                navigateAndFinish(context, LoginScreen());
                              },
                              style: const ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                  defPink,
                                ),
                                alignment: AlignmentDirectional.centerStart,
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
                padding: const EdgeInsets.all(20.0),
                color: defBlack,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: CarouselSlider.builder(
                        itemCount: 3,
                        itemBuilder: (context, index, pageViewIndex) {
                          return Stack(
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
                                child: const Image(
                                  width: double.infinity,
                                  image: NetworkImage(
                                      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/action-mistery-movie-poster-design-template-2ec690d65c22aa12e437d765dbf7e4af_screen.jpg?ts=1680854635'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text(
                                  'OUTSIDER (2020)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                              ),
                            ],
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
                      height: 16.0,
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
                                context,
                                AppCubit.get(context)
                                    .genresModel!
                                    .genres![index]),
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
                    header(
                      context: context,
                      text: 'Last watched',
                      function: () {},
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    SizedBox(
                      height: 200.0,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            lastWatchedListItem(context),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 16.0,
                        ),
                        itemCount: 5,
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    header(
                      context: context,
                      text: 'Trending',
                      function: () {},
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    SizedBox(
                      height: 250.0,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => buildMoviePoster(),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 16.0,
                        ),
                        itemCount: 5,
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    header(
                      context: context,
                      text: 'Latest movies',
                      function: () {},
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    SizedBox(
                      height: 250.0,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => buildMoviePoster(),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 16.0,
                        ),
                        itemCount: 5,
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

Widget genreItem(context, Genres list) {
  return TextButton(
    onPressed: () {},
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
    crossAxisAlignment: CrossAxisAlignment.end,
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
          alignment: Alignment.bottomRight,
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

Widget lastWatchedListItem(context) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
    child: InkWell(
      onTap: () {
        AppCubit.get(context).getGenres();
      },
      child: SizedBox(
        width: 250.0,
        height: 100.0,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            const Image(
              width: double.infinity,
              image: NetworkImage(
                  'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/action-mistery-movie-poster-design-template-2ec690d65c22aa12e437d765dbf7e4af_screen.jpg?ts=1680854635'),
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
                    'This is a movie name movie name movie name movie name movie name movie name movie name movie name ',
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
                        '12:12:12  2020',
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

Widget buildMoviePoster() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
    child: InkWell(
      onTap: () {},
      child: const SizedBox(
        width: 140.0,
        height: 100,
        child: Image(
          width: double.infinity,
          height: double.infinity,
          image: NetworkImage(
              'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/action-mistery-movie-poster-design-template-2ec690d65c22aa12e437d765dbf7e4af_screen.jpg?ts=1680854635'),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget buildDrawerItem({required context, required String text}) {
  return SizedBox(
    width: double.infinity,
    child: TextButton(
      onPressed: () {},
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
