import 'package:flutter/material.dart';
import 'package:frontend/src/components/Button.dart';

class ProfileSection extends StatefulWidget {
  ProfileSection({Key key}) : super(key: key);

  @override
  _ProfileSectionState createState() => new _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var fontPixel = MediaQuery.of(context).textScaleFactor;

    return Padding(
      padding: EdgeInsets.only(
        top: size.height * .03,
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: size.width,
            padding: EdgeInsets.symmetric(
              vertical: size.height * .04,
              horizontal: size.width * .07,
            ),
            child: Text(
              'Aqui você pode escolher entre divulgar ou ser um bom explorador.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: fontPixel * 20,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * .024),
            child: Button(
              color: Colors.grey[200],
              textColor: Colors.grey[600],
              text: 'Quero ser um explorador',
              onPress: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (Route<dynamic> route) => false);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * .024),
            child: Button(
              onPress: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/profile/photo', (Route<dynamic> route) => false);
              },
              color: Colors.green,
              textColor: Colors.white,
              text: 'Quero ser um divulgador',
            ),
          ),
        ],
      ),
    );
  }
}
