abstract class LoginEvent{}

class TextChangeEvent extends LoginEvent{
  final String email;
  final String password;
  TextChangeEvent(this.email, this.password);
}

class SubmittedEvent extends LoginEvent{
  final String email;
  final String password;
  SubmittedEvent(this.email, this.password);
}

