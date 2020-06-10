import 'dart:async';
import 'package:rxdart/rxdart.dart';

class MapStateToProps implements BaseBloc {
  // ////////////////////////////////////////////////////////
  //
  // Controllers
  //
  // ////////////////////////////////////////////////////////
  BehaviorSubject _menuControler = BehaviorSubject();
  BehaviorSubject<bool> _isHomeControler = BehaviorSubject<bool>();

// ////////////////////////////////////////////////////////
  //
  // Seters
  //
  // ////////////////////////////////////////////////////////
  Sink get setMenuState => _menuControler.sink;
  Sink<bool> get setHomeState => _isHomeControler.sink;

  // ////////////////////////////////////////////////////////
  //
  // Geters
  //
  // ////////////////////////////////////////////////////////
  Stream get getMenuState => _menuControler.stream;
  Stream<bool> get getHomeState => _isHomeControler.stream;

  @override
  void dispose() {
    _menuControler.close();
    _isHomeControler.close();
  }
}

abstract class BaseBloc {
  void dispose();
}
