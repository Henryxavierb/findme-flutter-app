import 'package:flutter/material.dart';

class ProfileDescription extends StatefulWidget {
  final String about;
  final String profile;
  ProfileDescription({Key key, this.about, this.profile}) : super(key: key);

  _ProfileDescriptionState createState() => _ProfileDescriptionState();
}

class _ProfileDescriptionState extends State<ProfileDescription> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var fontPixel = MediaQuery.of(context).textScaleFactor;

    return Container(
      width: size.width,
      padding: EdgeInsets.only(
        left: size.width * .08,
        right: size.width * .08,
        bottom: size.height * .015,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * .016,
              ),
              child: Text(
                widget.profile,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: fontPixel * 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Text(
            widget.about,
            style: TextStyle(
              fontSize: fontPixel * 18,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
