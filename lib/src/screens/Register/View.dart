import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/src/screens/Register/Form.dart';
import 'package:frontend/src/screens/Register/Link.dart';

// /////////////////////////////////////////////////////////

class RegisterView extends StatefulWidget {
  RegisterView({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Logo(),
          SectionForm(),
          LinkToLoginView(),
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
      ],
    );
  }
}

// /////////////////////////////////////////////////////////
