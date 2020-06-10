import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // if (true) {
    //   Navigator.pushReplacementNamed(context, '/home');
    // } else {
    //   Navigator.pushReplacementNamed(context, '/login');
    // }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(child: SvgPicture.asset('assets/images/logo.svg')),
    );
  }
}
