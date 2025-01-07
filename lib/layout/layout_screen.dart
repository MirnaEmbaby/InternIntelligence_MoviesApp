import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/layout/cubit/cubit.dart';
import 'package:movies_app/layout/cubit/states.dart';
import 'package:movies_app/shared/styles/colors.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
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
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
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
                  SizedBox(
                    height: 50.0,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => genreItem(context),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10.0,
                      ),
                      itemCount: 5,
                    ),
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
        );
      },
    );
  }
}

Widget genreItem(context) {
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
      'Fantasy',
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
      onTap: () {},
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
