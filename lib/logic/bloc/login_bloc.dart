import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/logic/events/login_event.dart';
import 'package:flutter_demo/logic/states/login_state.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginBloc() : super(InitialState()){
    on<TextChangeEvent>((event, emit) => {
      if(event.email == "" && !event.email.contains("@")){
        emit(ErrorState("Please enter valid email address"))
      }
      else if(event.password.length < 8){
        emit(ErrorState("Please enter valid password"))
      }else{
        emit(ValidState())
      }
    });

    on<SubmittedEvent>((event, emit) => {
      emit(LoadingState())
    });
  }

}