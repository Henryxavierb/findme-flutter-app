import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:email_validator/email_validator.dart';

class FormStateToProps implements BaseBloc {
  // ////////////////////////////////////////////////////////
  //
  // Controllers
  //
  // ////////////////////////////////////////////////////////
  BehaviorSubject<String> _emailControler = BehaviorSubject<String>();
  BehaviorSubject<String> _passwordControler = BehaviorSubject<String>();

  // ////////////////////////////////////////////////////////
  //
  // Seters
  //
  // ////////////////////////////////////////////////////////
  Sink<String> get setEmail => _emailControler.sink;
  Sink<String> get setPassword => _passwordControler.sink;

  // ////////////////////////////////////////////////////////
  //
  // Geters
  //
  // ////////////////////////////////////////////////////////
  Stream<String> get getEmail =>
      _emailControler.stream.transform(validateInputEmail);

  Stream<String> get getPassword =>
      _passwordControler.stream.transform(validateInputPassword);

  // ////////////////////////////////////////////////////////
  //
  // Submit
  //
  // ////////////////////////////////////////////////////////

  Stream<bool> get onSubmit => CombineLatestStream.combine2(
      getEmail, getPassword, (email, password) => true);

  // ////////////////////////////////////////////////////////
  //
  // Validators
  //
  // ////////////////////////////////////////////////////////
  final validateInputEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (email, sink) =>
          !EmailValidator.validate(email.replaceAll(" ", ""))
              ? sink.addError("Email possui formato inválido.")
              : sink.add(email));

  final validateInputPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (name, sink) => name.length < 8
          ? sink.addError("Senha deve possuir no mínimo 8 caracteres.")
          : sink.add(name));

  @override
  void dispose() {
    _emailControler.close();
    _passwordControler.close();
  }
}

abstract class BaseBloc {
  void dispose();
}
