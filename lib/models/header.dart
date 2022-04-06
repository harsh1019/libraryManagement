import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_managment/bloc/login_bloc.dart';
import 'package:library_managment/bloc/login_state.dart';
import 'package:library_managment/effects/hover_effect.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      color: const Color.fromRGBO(48, 46, 46, 1),
      child: Row(
        // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: 100,
                  height: 100,
                ),
                const Text(
                  "Central Library",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(),
              ],
            ),
          ),
          SizedBox(
            child: BlocBuilder<LoginBloc, AttemptState>(
              bloc: BlocProvider.of<LoginBloc>(context),
              builder: (context, snapshot) {
                if (snapshot is LogedIn) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40,
                    ),
                  );
                }
                return buildWhenLogedOut();
              },
            ),
          )
        ],
      ),
    );
  }

  Widget buildWhenLogedOut() {
    return HoverEffect(
      color: Colors.red,
      child: Container(
        margin: const EdgeInsets.only(right: 30),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.login,
              size: 30,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Login",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
