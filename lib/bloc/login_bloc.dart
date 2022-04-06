import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_managment/bloc/login_state.dart';
import 'package:library_managment/bloc/request_type.dart';
import 'package:library_managment/classes/student.dart';

class LoginBloc extends Bloc<RequestType, AttemptState> {
  late Student _student;
  LoginBloc(AttemptState initialState) : super(initialState) {
    on<LoginRequest>(_attemptLogin);
    on<LogoutRequest>(_attemptLogout);
  }
  _attemptLogin(LoginRequest event, emit) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("users");
    final snapshot =
        await collectionReference.doc(event.admin.toUpperCase()).get();
    if (snapshot.exists) {
      if (snapshot.get("password") != event.password) {
        emit(IncorrectPassword());
      } else {
        Map<String, String> json = {
          "name": snapshot.get("name"),
          "adminNo": snapshot.get("adminNo"),
          "contactNo": snapshot.get("contactNo"),
          "email": snapshot.get("email"),
        };
        _student = Student.fromJason(json);
        emit(LogedIn());
      }
    } else {
      emit(NoUserExist());
    }
  }

  _attemptLogout(LogoutRequest event, emit) {
    emit(LogedOut());
  }

  Student get studentDetails => _student;
}
