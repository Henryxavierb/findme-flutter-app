import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/src/screens/Event/Detail/Preface.dart';

class DetailEventView extends StatefulWidget {
  @override
  _DetailEventState createState() => _DetailEventState();
}

class _DetailEventState extends State<DetailEventView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Logo(),
          Preface(),
        ],
      ),
    );
  }
}

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        SvgPicture.asset('assets/images/eventAppBar.svg', width: size.width),
        ActionsAppbar(),
      ],
    );
  }
}

class ActionsAppbar extends StatefulWidget {
  @override
  _ActionsAppbarState createState() => _ActionsAppbarState();
}

class _ActionsAppbarState extends State<ActionsAppbar> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: size.height * .05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: IconButton(
              iconSize: 32,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
