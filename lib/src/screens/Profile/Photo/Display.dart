import 'package:flutter/material.dart';

class DisplayPhoto extends StatefulWidget {
  DisplayPhoto({Key key}) : super(key: key);

  @override
  _DisplayPhotoState createState() => new _DisplayPhotoState();
}

class _DisplayPhotoState extends State<DisplayPhoto> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var fontPixel = MediaQuery.of(context).textScaleFactor;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 0),
          child: Icon(
            Icons.account_circle,
            color: Colors.grey[400],
            size: size.height * .25,
          ),
        ),
        Container(
          width: size.width,
          padding: EdgeInsets.only(
            left: size.width * .09,
            right: size.width * .09,
            bottom: size.height * .03,
          ),
          child: Text(
            'É muito importante para um divulgador ser conhecido por todos' +
                ' a sua volta. Escolha uma boa foto para reconhecermos ' +
                'você logo de cara.',
            style: TextStyle(
              fontSize: fontPixel * 16,
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
