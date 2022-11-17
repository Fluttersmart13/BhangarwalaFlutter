import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/logic/events/login_event.dart';
import 'package:flutter_demo/logic/states/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialState()) {
    on<TextChangeEvent>((event, emit) => {
          if (event.email == "" || event.email.length != 10)
            {
              print(event.email.length),
              emit(ErrorState("Invalid Phone Number"))
            }
          else if (event.password.length < 8)
            {emit(ErrorState("Please enter valid password"))}
          else
            {emit(ValidState())}
        });

    on<SubmittedEvent>((event, emit) => {
          //emit(LoadingState()),
          // Timer(Duration(seconds: 4), () {
          //   print("Yeah, this line is printed after 3 seconds");
          //   emit(ApiSuccessState());
          // })

          emit(ApiSuccessState())
        });
  }
}
