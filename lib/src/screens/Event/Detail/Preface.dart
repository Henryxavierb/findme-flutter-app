import 'package:flutter/material.dart';
import 'package:frontend/src/screens/Event/Detail/NotificationButton.dart';

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
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: size.width * .024,
              ),
              child: Text(
                'Quando me tornei um Programador Profissional',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
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
          ],
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
        vertical: size.height * .015,
      ),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Icon(
                Icons.keyboard_voice,
                size: 30,
                color: Colors.grey[700],
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * .01),
                child: Text(
                  'Felipe Deschamps', // Put ellipses to validate name spreader
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Roboto',
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * .01),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.date_range,
                  size: 30,
                  color: Colors.grey[700],
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * .02),
                  child: Text(
                    '30/04/2020 às 11h00-12h00', // Put mask to date
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width * .50,
            margin: EdgeInsets.only(top: size.height * .005),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'CONFIRMADO',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context)
                        .primaryColor, // Change color by status
                  ),
                ),
              ],
            ),
          ),
          NotificationButton(
            // Change visible by type profile
            onPress: () {},
            text: "Quero ser notificado", // Change text by status
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
