import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/layout/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());
  static AppCubit get(context) => BlocProvider.of(context);
}
