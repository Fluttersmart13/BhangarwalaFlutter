import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
enum SplashScreenState{Initial,Loding,Dashboard,Login,Intro}

class SplashScreenCubit extends Cubit<SplashScreenState>{
  SplashScreenCubit():super(SplashScreenState.Initial){
    emit(SplashScreenState.Loding);
    Timer(Duration(seconds: 3), () {
      emit(SplashScreenState.Login);
    });
  }
}