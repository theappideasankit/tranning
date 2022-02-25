import 'dart:async';
import 'package:day1/blocpattern/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  final _loginEmail = BehaviorSubject<String>();
  final _loginPass = BehaviorSubject<String>();

  //getters
  Stream<String> get loginEmail => _loginEmail.stream.transform(emailValidator);

  Stream<String> get loginPass => _loginPass.stream.transform(passValidator);

  Stream<bool> get isValid =>
      Rx.combineLatest2(loginEmail, loginPass, (a, b) => true);

  //setters
  Function(String) get changeLoginEmail => _loginEmail.sink.add;

  Function(String) get changeLoginPass => _loginPass.sink.add;

  void submit() {
    print("login success");
    print(_loginEmail.value);
    print(_loginPass.value);
  }

  void despose() {
    _loginEmail.close();
    _loginPass.close();
  }
}
