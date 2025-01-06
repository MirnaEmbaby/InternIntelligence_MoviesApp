import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/layout/cubit/cubit.dart';
import 'package:movies_app/layout/cubit/states.dart';
import 'package:movies_app/shared/bloc_observer.dart';
import 'package:movies_app/shared/styles/theme.dart';

import 'firebase_options.dart';
import 'modules/login_screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        builder: (context, state) {
          return SafeArea(
            child: MaterialApp(
              theme: myTheme,
              debugShowCheckedModeBanner: false,
              debugShowMaterialGrid: false,
              home: LoginScreen(),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
