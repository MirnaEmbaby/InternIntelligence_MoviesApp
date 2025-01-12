import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/layout/cubit/cubit.dart';
import 'package:movies_app/layout/cubit/states.dart';
import 'package:movies_app/shared/bloc_observer.dart';
import 'package:movies_app/shared/network/local/cache_helper.dart';
import 'package:movies_app/shared/network/remote/dio_helper.dart';
import 'package:movies_app/shared/styles/theme.dart';

import 'firebase_options.dart';
import 'layout/layout_screen.dart';
import 'modules/login_screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await CacheHelper.init();
  await DioHelper.init();

  Widget widget;
  String? uId = CacheHelper.getData(key: 'uId');

  if (uId != null) {
    widget = const LayoutScreen();
  } else {
    widget = LoginScreen();
  }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.startWidget});
  final Widget startWidget;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getUserData()
        ..getGenres()
        ..exploreMovies()
        ..getTrendingMovies()
        ..getTrendingShowsMovies(),
      child: BlocConsumer<AppCubit, AppStates>(
        builder: (context, state) {
          return SafeArea(
            child: MaterialApp(
              theme: myTheme,
              debugShowCheckedModeBanner: false,
              debugShowMaterialGrid: false,
              home: startWidget,
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
