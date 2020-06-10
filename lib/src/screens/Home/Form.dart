import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/src/screens/Home/SearchBar.dart';

class SectionForm extends StatefulWidget {
  SectionForm({Key key}) : super(key: key);

  @override
  _AppBarState createState() => new _AppBarState();
}

class _AppBarState extends State<SectionForm> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Stack(
      children: [
        SvgPicture.asset(
          'assets/images/smallAppbar.svg',
          width: size.width,
        ),
        Container(
          padding: EdgeInsets.only(
            top: size.height * 0.08,
          ),
          child: SearchBar(placeholder: 'Explore um tema'),
        ),
      ],
    );
  }
}
