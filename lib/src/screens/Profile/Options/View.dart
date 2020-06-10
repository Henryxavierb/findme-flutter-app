import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/src/components/ActionAppbar.dart';
import 'package:frontend/src/screens/Profile/Options/Link.dart';
import 'package:frontend/src/screens/Profile/Options/Profile.dart';

class TypeProfileView extends StatefulWidget {
  TypeProfileView({Key key}) : super(key: key);

  @override
  _TypeProfileState createState() => _TypeProfileState();
}

class _TypeProfileState extends State<TypeProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Logo(),
          ProfileSection(),
          LinkToAboutProfileView(),
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
