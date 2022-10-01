import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/logic/events/internet_events.dart';
import 'package:flutter_demo/logic/states/internet_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetBloc extends Bloc<InternetEvent,InternetState>{
  Connectivity _connectivity = Connectivity();
  StreamSubscription? streamSubscription;

  //without on click by user it will check automatically
  //listen is type StreamOption
  //Connectivity is continue listning the event by closing the page
  //use StreamOption to close when bloc is closed
  InternetBloc():super(InternetInitialState()){
    //initialize the bloc
    //after initializing bloc check listner of connectivity
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    on<InternetGainEvent>((event, emit) => emit(InternetGainedSate()));

    //get result of internet 
    streamSubscription = _connectivity.onConnectivityChanged.listen((result) {
      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
        add(InternetGainEvent());
      }else{
        add(InternetLostEvent());
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