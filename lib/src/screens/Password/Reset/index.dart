import 'dart:async';
import 'package:rxdart/rxdart.dart';

class FormStateToProps implements BaseBloc {
  // ////////////////////////////////////////////////////////
  //
  // Controllers
  //
  // ////////////////////////////////////////////////////////
  BehaviorSubject<String> _tokenControler = BehaviorSubject<String>();
  BehaviorSubject<String> _passwordControler = BehaviorSubject<String>();
  BehaviorSubject<String> _confirmPasswordControler = BehaviorSubject<String>();

  // ////////////////////////////////////////////////////////
  //
  // Seters
  //
  // ////////////////////////////////////////////////////////
  Sink<String> get setToken => _tokenControler.sink;
  Sink<String> get setPassword => _passwordControler.sink;
  Sink<String> get setConfirmPassword => _confirmPasswordControler.sink;

  // ////////////////////////////////////////////////////////
  //
  // Geters
  //
  // ////////////////////////////////////////////////////////
  Stream<String> get getToken =>
      _tokenControler.stream.transform(validateInputToken);

  Stream<String> get getPassword => _passwordControler.stream
          .transform(validateInputPassword)
          .doOnData((String password) {
        int isEquals = 0;

        if (_confirmPasswordControler.value.compareTo(password) != isEquals) {
          _confirmPasswordControler.addError("Senhas não correspondem");
        }
      });

  Stream<String> get getConfirmPassword => _confirmPasswordControler.stream
          .transform(validateInputPassword)
          .doOnData((String confirmPassword) {
        int isEquals = 0;

        if (_passwordControler.value.compareTo(confirmPassword) != isEquals) {
          _confirmPasswordControler.addError("Senhas não correspondem");
        }
      });

  // ////////////////////////////////////////////////////////
  //
  // onSubmit
  //
  // ////////////////////////////////////////////////////////
  Stream<bool> get onSubmit => CombineLatestStream.combine3(getPassword,
      getToken, getConfirmPassword, (token, password, confirmPassword) => true);

  // ////////////////////////////////////////////////////////
  //
  // Validations
  //
  // ////////////////////////////////////////////////////////

  final validateInputToken = StreamTransformer<String, String>.fromHandlers(
      handleData: (token, sink) =>
          token.length < 8 ? sink.addError("Token inválido") : sink.add(token));

  final validateInputPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) => password.length < 8
          ? sink.addError('Senha deve conter no mínimo 8 caracteres')
          : sink.add(password));

  @override
  void dispose() {
    _tokenControler.close();
    _passwordControler.close();
    _confirmPasswordControler.close();
  }
}

abstract class BaseBloc {
  void dispose();
}
