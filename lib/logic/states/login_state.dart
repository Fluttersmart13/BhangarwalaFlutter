abstract class LoginState{}

class InitialState extends LoginState{}

class ValidState extends LoginState{}

class LoadingState extends LoginState{}

class ErrorState extends LoginState{
  final String errorMessage;
  ErrorState(this.errorMessage);
}


