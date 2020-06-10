import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/src/components/ActionAppbar.dart';
import 'package:frontend/src/screens/Password/Forgot/Form.dart';

// /////////////////////////////////////////////////////////

class ForgotPasswordView extends StatefulWidget {
  ForgotPasswordView({Key key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordView> {
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
        ActionAppBar(goBack: true),
      ],
    );
  }
}
