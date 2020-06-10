import 'package:flutter/material.dart';
import 'package:frontend/src/screens/Home/Form.dart';
import 'package:frontend/src/screens/Home/List.dart';
import 'package:frontend/src/screens/Home/index.dart';
import 'package:frontend/src/screens/Home/Notification.dart';
import 'package:frontend/src/screens/Notification/View.dart';
import 'package:frontend/src/screens/Profile/Details/View.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeView> {
  static List _events = List();
  static List _notificationEvents = List();
  MapStateToProps props = MapStateToProps();

  @override
  Widget build(BuildContext context) {
    int _homeIndex = 1;
    var size = MediaQuery.of(context).size;

    return StreamBuilder(
        stream: props.getHomeState,
        builder: (context, showActionButton) {
          return StreamBuilder(
              stream: props.getMenuState,
              builder: (context, view) {
                return Scaffold(
                  resizeToAvoidBottomPadding: false,
                  body: view.data ?? Home(events: _events),
                  bottomNavigationBar: CurvedNavigationBar(
                    index: _homeIndex,
                    color: Color(0xFF09B83E),
                    height: size.width * .13,
                    backgroundColor: Colors.white,
                    onTap: (index) {
                      props.setMenuState.add(
                          _renderPage(index, _events, _notificationEvents));

                      if (index.toInt() != 1) {
                        props.setHomeState.add(false);
                      }
                      if (index.toInt() == 1) {
                        props.setHomeState.add(true);
                      }
                    },
                    items: [
                      NotificationIcon(
                          hasNotification: _notificationEvents.length > 0),
                      Icon(
                        Icons.home,
                        color: Colors.white,
                        size: size.width * .1,
                      ),
                      Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: size.width * .1,
                      ),
                    ],
                  ),
                  floatingActionButton: Visibility(
                    visible: showActionButton.data ?? true,
                    child: Padding(
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/event/create");
                        },
                        child: Icon(Icons.add, color: Colors.white),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      padding: EdgeInsets.only(bottom: size.height * .01),
                    ),
                  ),
                );
              });
        });
  }
}

// ///////////////////////////////////////////////////////////////////////////

class Home extends StatefulWidget {
  final dynamic events;
  Home({Key key, this.events}) : super(key: key);

  @override
  _Home createState() => new _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionForm(),
        ListEvent(events: widget.events),
      ],
    );
  }
}

// ///////////////////////////////////////////////////////////////////////////
_renderPage(int page, List events, List notifications) {
  switch (page) {
    case 0:
      return NotificationView(events: notifications);
      break;

    case 1:
      return Home(events: events);
      break;

    case 2:
      return ProfileView();
      break;

    default:
      return Home();
  }
}
