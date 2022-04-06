import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_managment/bloc/login_bloc.dart';
import 'package:library_managment/bloc/login_state.dart';
import 'package:library_managment/bloc/request_type.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameIcon = Icons.person;
  final passwordIcon = Icons.password;
  final _adminController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late LoginBloc _loginBloc;

  String adminNo = "";
  String password = "";
  @override
  void initState() {
    super.initState();
    _loginBloc = context.read<LoginBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/lib.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent.withOpacity(.3),
        body: Center(
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Login Here !",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    child: BlocBuilder<LoginBloc, AttemptState>(
                      bloc: _loginBloc,
                      builder: (context, state) {
                        String message = "";
                        if (state is LogedIn) {
                          {
                            message = "Login Successful";
                          }
                        } else if (state is IncorrectPassword) {
                          message = "Incorrect Password";
                        } else if (state is NoUserExist) {
                          message = "Admission No Is Incorrect";
                        } else if (state is LogedOut) {
                          message = "";
                        }
                        return Text(
                          message,
                          style: TextStyle(
                            color: Colors.white.withRed(100),
                            fontSize: 25,
                          ),
                        );
                      },
                    ),
                  ),
                  buildUsername("Admission No", usernameIcon),
                  buildPassword("Password", passwordIcon),
                  GestureDetector(
                    onTap: () {
                      if (!_formKey.currentState!.validate()) return;

                      _formKey.currentState!.save();
                      _addDataToDatabase(adminNo, password);
                    },
                    child: Container(
                      alignment: const Alignment(0, 0),
                      width: MediaQuery.of(context).size.width * 1 / 5,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.shade100,
                            Colors.blue.shade500,
                            Colors.blue.shade900,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: const Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildUsername(String hint, IconData iconData) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 500,
      decoration: const BoxDecoration(),
      child: TextFormField(
        controller: _adminController,
        validator: (value) {
          if (value!.isEmpty) return hint + " Required";
          return null;
        },
        onSaved: (value) {
          adminNo = value.toString();
        },
        cursorColor: Colors.white,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          errorStyle: TextStyle(
              color: Colors.white.withRed(100),
              fontSize: 20,
              fontWeight: FontWeight.bold),
          border: InputBorder.none,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black.withOpacity(.3),
              width: 2,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black.withOpacity(1),
              width: 2,
            ),
          ),
          labelText: hint,
          prefixIcon: Container(
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(),
            child: Icon(
              iconData,
              size: 40,
              color: Colors.white,
            ),
          ),
          labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  buildPassword(String hint, IconData iconData) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 500,
      decoration: const BoxDecoration(),
      child: TextFormField(
        controller: _passwordController,
        obscureText: true,
        validator: (value) {
          if (value!.isEmpty) return hint + " Required";
          return null;
        },
        onSaved: (value) {
          password = value.toString();
        },
        cursorColor: Colors.white,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          errorStyle: TextStyle(
              color: Colors.white.withRed(100),
              fontSize: 20,
              fontWeight: FontWeight.bold),
          border: InputBorder.none,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black.withOpacity(.3),
              width: 2,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black.withOpacity(1),
              width: 2,
            ),
          ),
          labelText: hint,
          prefixIcon: Container(
            decoration: const BoxDecoration(),
            margin: const EdgeInsets.all(10),
            child: Icon(
              iconData,
              size: 40,
              color: Colors.white,
            ),
          ),
          labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  _addDataToDatabase(String admin, String password) async {
    _loginBloc.add(LoginRequest(admin: admin, password: password));
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (_loginBloc.state is LogedIn) Navigator.of(context).pop();
    });
  }
}
