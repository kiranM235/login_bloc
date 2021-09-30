import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/auth_bloc.dart';

class AuthBlocProvider extends InheritedWidget {
  final AuthBloc bloc = AuthBloc();

  AuthBlocProvider({Key? key, required Widget child}) : super(key: key,child: child);



  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static AuthBloc of (BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<AuthBlocProvider>()!.bloc;
  }
}



