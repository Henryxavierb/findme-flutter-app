import 'package:flutter/material.dart';

class Preface extends StatefulWidget {
  @override
  _PrefaceState createState() => _PrefaceState();
}

class _PrefaceState extends State<Preface> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          top: size.height * .05,
          left: size.width * .03,
          right: size.width * .03,
        ),
        child: Row(
          children: [
            ClipOval(
              child: Icon(
                Icons.account_circle,
                size: size.height * .2,
                color: Colors.grey[600].withOpacity(0.7),
              ),
            ),
            DescriptionUser(),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}

class DescriptionUser extends StatefulWidget {
  @override
  _DescriptionUserState createState() => _DescriptionUserState();
}

class _DescriptionUserState extends State<DescriptionUser> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: size.height * .045,
        horizontal: size.width * .02,
      ),
      child: Column(
        children: [
          Text(
            'Felipe Deschamps',
            style: TextStyle(
                fontSize: 22,
                fontFamily: 'Roboto',
                color: Colors.grey[700],
                fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * .02),
            child: Text('Divulgador',
                style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'Roboto',
                    color: Colors.grey[700])),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
