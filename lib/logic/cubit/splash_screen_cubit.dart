import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SplashScreenState{Initial,Loding,Dashboard,Login,Intro}

class SplashScreenCubit extends Cubit<SplashScreenState>{
  SplashScreenCubit():super(SplashScreenState.Initial){
    emit(SplashScreenState.Loding);
    print("object");
    Timer(Duration(seconds: 4), () {
      print("Yeah, this line is printed after 3 seconds");
      emit(SplashScreenState.Login);
    });
    print("object1");
  }
}