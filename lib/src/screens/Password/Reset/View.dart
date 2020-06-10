import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/src/screens/Password/Reset/Form.dart';

// /////////////////////////////////////////////////////////

class ResetPasswordView extends StatefulWidget {
  ResetPasswordView({Key key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Logo(),
          SectionForm(),
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
