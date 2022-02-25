import 'dart:async';
import 'package:day1/blocpattern/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc with Validators{
  final _regEmail = BehaviorSubject<String>();
  final _regPass = BehaviorSubject<String>();

  //getters
  Stream<String> get regEmail => _regEmail.stream.transform(emailValidator);

  Stream<String> get regPass => _regPass.stream.transform(passValidator);

  Stream <bool> get isValid => Rx.combineLatest2(regEmail, regPass, (regEmail, regPass) => true);


  //setters
  Function(String) get changeRegEmail => _regEmail.sink.add;

  Function(String) get changeRegPass => _regPass.sink.add;

  void submit(){
    print(_regEmail.value);
    print(_regPass.value);
  }

  void despose() {
    _regEmail.close();
    _regPass.close();
  }
}
