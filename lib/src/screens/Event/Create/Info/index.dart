import 'dart:async';
import 'package:rxdart/rxdart.dart';

class FormStateToProps implements BaseBloc {
  // ////////////////////////////////////////////////////////
  //
  // Controllers
  //
  // ////////////////////////////////////////////////////////
  BehaviorSubject<String> _linkControler = BehaviorSubject<String>();
  BehaviorSubject<String> _themeControler = BehaviorSubject<String>();
  BehaviorSubject<String> _ownerControler = BehaviorSubject<String>();
  BehaviorSubject<String> _imageControler = BehaviorSubject<String>();
  BehaviorSubject<String> _endDateControler = BehaviorSubject<String>();
  BehaviorSubject<String> _beginDateControler = BehaviorSubject<String>();
  BehaviorSubject<String> _descriptionControler = BehaviorSubject<String>();

// ////////////////////////////////////////////////////////
  //
  // Seters
  //
  // ////////////////////////////////////////////////////////
  Sink<String> get setLink => _linkControler.sink;
  Sink<String> get setTheme => _themeControler.sink;
  Sink<String> get setOwner => _ownerControler.sink;
  Sink<String> get setImage => _imageControler.sink;
  Sink<String> get setEndDate => _endDateControler.sink;
  Sink<String> get setbeginDate => _beginDateControler.sink;
  Sink<String> get setDescription => _descriptionControler.sink;

  // ////////////////////////////////////////////////////////
  //
  // Geters
  //
  // ////////////////////////////////////////////////////////
  Stream<String> get getImage => _imageControler.stream;
  Stream<String> get getLink =>
      _linkControler.stream.transform(validateInputLink);
  Stream<String> get getTheme =>
      _themeControler.stream.transform(validateInputTheme);
  Stream<String> get getOwner =>
      _ownerControler.stream.transform(validateInputOwner);
  Stream<String> get getEndDate =>
      _endDateControler.stream.transform(validateInputEndDate);
  Stream<String> get getBeginDate =>
      _beginDateControler.stream.transform(validateInputBeginDate);
  Stream<String> get getDescription => _descriptionControler.stream;

  // ////////////////////////////////////////////////////////
  //
  // onSubmit
  //
  // ////////////////////////////////////////////////////////
  Stream<bool> get onSubmit => CombineLatestStream.combine7(
      getLink,
      getTheme,
      getOwner,
      getImage,
      getEndDate,
      getBeginDate,
      getDescription,
      (link, theme, owner, image, endDate, beginDate, description) => true);

  // ////////////////////////////////////////////////////////
  //
  // Validations
  //
  // ////////////////////////////////////////////////////////

  final validateInputLink = StreamTransformer<String, String>.fromHandlers(
      handleData: (link, sink) => link.length < 8
          ? sink.addError("Link deve conter no mínimo 8 caracteres")
          : sink.add(link));

  final validateInputTheme = StreamTransformer<String, String>.fromHandlers(
      handleData: (theme, sink) => theme.length < 3
          ? sink.addError("Tema deve conter no mínimo 3 caracteres")
          : sink.add(theme));

  final validateInputOwner = StreamTransformer<String, String>.fromHandlers(
      handleData: (owner, sink) => owner.length < 3
          ? sink.addError("Representante deve conter no mínimo 3 caracteres")
          : sink.add(owner));

  // final validateInputImage = StreamTransformer<String, String>.fromHandlers(
  //     handleData: (name, sink) => name.length < 3
  //         ? sink.addError("Nome deve conter no mínimo 3 caracteres")
  //         : sink.add(name));

  final validateInputEndDate = StreamTransformer<String, String>.fromHandlers(
      handleData: (endDate, sink) => endDate.length < 3
          ? sink.addError("Data fim não possui um formato válido")
          : sink.add(endDate));

  final validateInputBeginDate = StreamTransformer<String, String>.fromHandlers(
      handleData: (name, sink) => name.length < 3
          ? sink.addError("Data de início não possui um formato válido")
          : sink.add(name));

  @override
  void dispose() {
    _linkControler.close();
    _themeControler.close();
    _ownerControler.close();
    _imageControler.close();
    _endDateControler.close();
    _beginDateControler.close();
    _descriptionControler.close();
  }
}

abstract class BaseBloc {
  void dispose();
}
