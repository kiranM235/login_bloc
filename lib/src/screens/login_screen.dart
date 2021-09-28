import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final bloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          buildEmailField(),
          SizedBox(height: 16),
          buildPasswordField(),
          SizedBox(height: 16),
          buildGenderDropDown(),
          SizedBox(height: 16),
          buildSubmitButton(),
        ],
      ),
    );
  }

  Widget buildEmailField() {
    return StreamBuilder<String>(
      stream: bloc.emailStream,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: "Email address",
              hintText: "you@example.com",
              errorText: snapshot.hasError ? snapshot.error.toString() : null,
              border: OutlineInputBorder()),
          onChanged: (val) {
            bloc.addEmail(val);
          },
        );
      }
    );
  }

  Widget buildPasswordField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          labelText: "Your password",
          hintText: "password",
          border: OutlineInputBorder()),
      onChanged: (val) {
        bloc.addPassword(val);
      },
    );
  }

  Widget buildGenderDropDown() {
    return DropdownButtonFormField<String>(
      items: [
        DropdownMenuItem(child: Text("Male"), value: "male"),
        DropdownMenuItem(child: Text("Female"), value: "female"),
        DropdownMenuItem(
            child: Text("I don't wish to answer"),
            value: "I don't wish to answer"),
      ],
      onChanged: (val) {
        bloc.addGender(val!);
      },
      decoration: InputDecoration(
          labelText: "Select your Gender",
          hintText: "male/female",
          border: OutlineInputBorder()),
    );
  }

  buildSubmitButton() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text("Submit"),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(12), primary: Colors.teal),
      ),
    );
  }
}
