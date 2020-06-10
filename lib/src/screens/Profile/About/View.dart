import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/src/components/ActionAppbar.dart';
import 'package:frontend/src/screens/Profile/About/Profile.dart';

class AboutProfileView extends StatefulWidget {
  AboutProfileView({Key key}) : super(key: key);

  @override
  _AboutProfileState createState() => _AboutProfileState();
}

class _AboutProfileState extends State<AboutProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Logo(),
          ProfileSection(),
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
