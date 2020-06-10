import 'dart:async';
import 'package:rxdart/rxdart.dart';

class FormStateToProps implements BaseBloc {
  // ////////////////////////////////////////////////////////
  //
  // Controllers
  //
  // ////////////////////////////////////////////////////////
  BehaviorSubject<bool> _youtubeControler = BehaviorSubject<bool>();
  BehaviorSubject<bool> _twitterControler = BehaviorSubject<bool>();
  BehaviorSubject<bool> _linkedInControler = BehaviorSubject<bool>();
  BehaviorSubject<bool> _instagramControler = BehaviorSubject<bool>();

  BehaviorSubject<String> _linkYoutubeControler = BehaviorSubject<String>();
  BehaviorSubject<String> _linkTwitterControler = BehaviorSubject<String>();
  BehaviorSubject<String> _linkLinkedInControler = BehaviorSubject<String>();
  BehaviorSubject<String> _linkInstagramControler = BehaviorSubject<String>();

// ////////////////////////////////////////////////////////
  //
  // Seters
  //
  // ////////////////////////////////////////////////////////
  Sink<String> get setLinkYoutube => _linkYoutubeControler.sink;
  Sink<String> get setLinkTwitter => _linkTwitterControler.sink;
  Sink<String> get setLinkLinkedIn => _linkLinkedInControler.sink;
  Sink<String> get setLinkInstagram => _linkInstagramControler.sink;

  Sink<bool> get setYoutube => _youtubeControler.sink;
  Sink<bool> get setTwitter => _twitterControler.sink;
  Sink<bool> get setLinkedIn => _linkedInControler.sink;
  Sink<bool> get setInstagram => _instagramControler.sink;

  // ////////////////////////////////////////////////////////
  //
  // Geters
  //
  // ////////////////////////////////////////////////////////

  Stream<bool> get getYoutube => _youtubeControler.stream;
  Stream<bool> get getTwitter => _twitterControler.stream;
  Stream<bool> get getLinkedIn => _linkedInControler.stream;
  Stream<bool> get getInstagram => _instagramControler.stream;

  Stream<String> get getLinkYoutube => _linkYoutubeControler.stream;
  Stream<String> get getLinkTwitter => _linkTwitterControler.stream;
  Stream<String> get getLinkLinkedIn => _linkLinkedInControler.stream;
  Stream<String> get getLinkInstagram => _linkInstagramControler.stream;

  @override
  void dispose() {
    _youtubeControler.close();
    _twitterControler.close();
    _linkedInControler.close();
    _instagramControler.close();

    _linkYoutubeControler.close();
    _linkTwitterControler.close();
    _linkLinkedInControler.close();
    _linkInstagramControler.close();
  }
}

abstract class BaseBloc {
  void dispose();
}
