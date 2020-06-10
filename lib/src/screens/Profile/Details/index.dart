import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:rxdart/rxdart.dart';

class FormStateToProps implements BaseBloc {
  // ////////////////////////////////////////////////////////
  //
  // Controllers
  //
  // ////////////////////////////////////////////////////////
  BehaviorSubject<String> _nameControler = BehaviorSubject<String>();
  BehaviorSubject<String> _emailControler = BehaviorSubject<String>();
  BehaviorSubject<String> _passwordControler = BehaviorSubject<String>();
  BehaviorSubject<bool> _statusToEditControler = BehaviorSubject<bool>();

// ////////////////////////////////////////////////////////
  //
  // Seters
  //
  // ////////////////////////////////////////////////////////
  Sink<String> get setName => _nameControler.sink;
  Sink<String> get setEmail => _emailControler.sink;
  Sink<String> get setPassword => _passwordControler.sink;
  Sink<bool> get setStatusToEdit => _statusToEditControler.sink;

  // ////////////////////////////////////////////////////////
  //
  // Geters
  //
  // ////////////////////////////////////////////////////////
  Stream<String> get getName =>
      _nameControler.stream.transform(validateInputName);
  Stream<String> get getEmail =>
      _emailControler.stream.transform(validateInputEmail);
  Stream<String> get getPassword =>
      _passwordControler.stream.transform(validateInputPassword);
  Stream<bool> get getStatusToEdit => _statusToEditControler.stream;

  // ////////////////////////////////////////////////////////
  //
  // onSubmit
  //
  // ////////////////////////////////////////////////////////
  Stream<bool> get onSubmit => CombineLatestStream.combine3(
      getName, getEmail, getPassword, (name, email, password) => true);

  // ////////////////////////////////////////////////////////
  //
  // Validations
  //
  // ////////////////////////////////////////////////////////

  final validateInputName = StreamTransformer<String, String>.fromHandlers(
      handleData: (name, sink) => name.length < 3
          ? sink.addError("Nome deve conter no mínimo 3 caracteres")
          : sink.add(name));

  final validateInputEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (email, sink) => !EmailValidator.validate(email)
          ? sink.addError("Email possui formato inválido")
          : sink.add(email));

  final validateInputPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) => password.length < 8
          ? sink.addError('Senha deve conter no mínimo 8 caracteres')
          : sink.add(password));

  @override
  void dispose() {
    _nameControler.close();
    _emailControler.close();
    _passwordControler.close();
    _statusToEditControler.close();
  }
}

abstract class BaseBloc {
  void dispose();
}
