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

  // ////////////////////////////////////////////////////////
  //
  // Seters
  //
  // ////////////////////////////////////////////////////////
  Sink<String> get setEmail => _emailControler.sink;

  // ////////////////////////////////////////////////////////
  //
  // Geters
  //
  // ////////////////////////////////////////////////////////
  Stream<String> get getEmail =>
      _emailControler.stream.transform(validateInputEmail);

  // ////////////////////////////////////////////////////////
  //
  // Submit
  //
  // ////////////////////////////////////////////////////////

  Stream<bool> get onSubmit =>
      CombineLatestStream.combine2(getEmail, getEmail, (a, b) => true);

  // ////////////////////////////////////////////////////////
  //
  // Validators
  //
  // ////////////////////////////////////////////////////////
  final validateInputEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (email, sink) => !EmailValidator.validate(email)
          ? sink.addError("Email possui formato inválido.")
          : sink.add(email));

  @override
  void dispose() {
    _emailControler.close();
  }
}

abstract class BaseBloc {
  void dispose();
}
