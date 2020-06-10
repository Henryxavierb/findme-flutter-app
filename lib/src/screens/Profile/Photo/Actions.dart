import 'package:flutter/material.dart';
import 'package:frontend/src/components/Button.dart';

class ActionsPhoto extends StatefulWidget {
  ActionsPhoto({Key key}) : super(key: key);

  @override
  _ActionsPhotoState createState() => new _ActionsPhotoState();
}

class _ActionsPhotoState extends State<ActionsPhoto> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        Card(),
        Button(
          onPress: () {},
          text: 'Escolher',
          color: Colors.grey[200],
          textColor: Colors.grey[600],
        ),
        Padding(
          child: Button(
            textColor: Colors.white,
            text: 'Escolher depois',
            color: Colors.red[600].withOpacity(0.7),
            onPress: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (Route<dynamic> route) => false);
            },
          ),
          padding: EdgeInsets.only(top: size.height * .02),
        ),
      ],
    );
  }
}
