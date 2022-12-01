import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/constants/shared_preference.dart';

enum SplashScreenState { Initial, Loding, Dashboard, Login, Intro, Welcome }

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenState.Initial) {
    emit(SplashScreenState.Loding);
    Auth.getIsIntroCheck().then((value) {
      if (value == "1") {
        Timer(const Duration(seconds: 3), () {
          emit(SplashScreenState.Dashboard);
        });
      } else {
        emit(SplashScreenState.Intro);
      }
    });
  }
}
