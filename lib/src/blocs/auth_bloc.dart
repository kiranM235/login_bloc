import 'dart:async';

class AuthBloc {
  final StreamController<String> emailController = StreamController();
  final StreamController<String> passwordController = StreamController();
  final StreamController<String> genderController = StreamController();

  void dispose() {
    emailController.close();
    passwordController.close();
    genderController.close();
  }
}
