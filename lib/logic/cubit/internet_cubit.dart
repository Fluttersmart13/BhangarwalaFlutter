import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState1{Inititial,Gained,Lost}

class InternetCubit extends Cubit<InternetState1>{
  Connectivity _connectivity = Connectivity();
  StreamSubscription? streamSubscription;

  InternetCubit() : super(InternetState1.Inititial){
    streamSubscription = _connectivity.onConnectivityChanged.listen((result) {
      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
        emit(InternetState1.Inititial);
        Future.delayed(Duration(seconds: 3));
        emit(InternetState1.Gained);
      }else{
        emit(InternetState1.Lost);
      }
    });
  }

  @override
  Future<void> close() {
    //? use for optional it is in active state
    streamSubscription?.cancel();
    return super.close();
  }
}