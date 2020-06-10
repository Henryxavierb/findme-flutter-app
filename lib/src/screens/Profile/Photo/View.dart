import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/src/components/ActionAppbar.dart';
import 'package:frontend/src/screens/Profile/Photo/Actions.dart';
import 'package:frontend/src/screens/Profile/Photo/Display.dart';

class SpreaderPhotoView extends StatefulWidget {
  SpreaderPhotoView({Key key}) : super(key: key);

  @override
  _SpreaderPhotoState createState() => _SpreaderPhotoState();
}

class _SpreaderPhotoState extends State<SpreaderPhotoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Logo(),
          DisplayPhoto(),
          ActionsPhoto(),
        ],
      ),
    );
  }
}

// /////////////////////////////////////////////////////////

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        SvgPicture.asset('assets/images/bigAppbar.svg', width: size.width),
        ActionAppBar(goBack: false),
      ],
    );
  }
}
