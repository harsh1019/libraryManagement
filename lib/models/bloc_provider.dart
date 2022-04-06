// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
// import 'package:library_managment/bloc/student_bloc.dart';

// class BlocProvider extends InheritedWidget {
//   final Widget child;
//   final StudentData studentData;

//   const BlocProvider({Key? key, required this.child, required this.studentData})
//       : super(child: child, key: key);

//   static StudentData of(BuildContext context) =>
//       context.dependOnInheritedWidgetOfExactType<BlocProvider>()!.studentData;
//   @override
//   bool updateShouldNotify(BlocProvider oldWidget) {
//     return oldWidget.studentData != studentData;
//   }
// }
