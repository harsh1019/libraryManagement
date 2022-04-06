import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_managment/bloc/login_bloc.dart';
import 'package:library_managment/bloc/login_state.dart';

import 'package:library_managment/models/feedback.dart';
import 'package:library_managment/models/hovered_text.dart';
import 'package:library_managment/models/header.dart';
import 'package:library_managment/models/issue_card.dart';
import 'package:library_managment/models/new_arrival.dart';
import 'package:library_managment/models/search_result.dart';
import 'package:library_managment/pages/login.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => LoginBloc(LogedOut())),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late LoginBloc _loginBloc;
  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
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
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 100,
              child: buildStack(),
            ),
            const NewArrival(),
            const Center(
              child: FeedBack(),
            ),
          ],
        ),
      ),
    );
  }

  buildSecondHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: GestureDetector(
            child: const HoveredText(
              title: "Home",
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        BlocBuilder(
          bloc: _loginBloc,
          builder: (context, state) {
            if (state is LogedIn) {
              return const SizedBox();
            }
            return GestureDetector(
              onTap: (() => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Login(),
                  ))),
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: const HoveredText(
                  title: "Login",
                ),
              ),
            );
          },
        ),
        const SizedBox(
          width: 30,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: const HoveredText(
            title: "About Us",
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                  value: BlocProvider.of<LoginBloc>(context),
                  child: const Login(),
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: const HoveredText(
              title: "Contributors",
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  buildStack() {
    return Stack(alignment: Alignment.center, children: [
      SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          "assets/images/lib.jpg",
          fit: BoxFit.fill,
        ),
      ),
      const Positioned(
        top: 0,
        child: Header(),
      ),
      Positioned(
        top: 100,
        left: 0,
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: Container(
          color: const Color(0xFFF3D094),
          child: buildSecondHeader(),
        ),
      ),
      Positioned(
        left: 50,
        child: Container(
          child: const IssueCard(),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.15),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
      Positioned(
        right: 50,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.15),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: const SearchResult(
            author: "Dale Carnige",
          ),
        ),
      )
    ]);
  }
}
