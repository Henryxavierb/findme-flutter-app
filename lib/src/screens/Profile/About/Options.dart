import 'package:flutter/material.dart';
import 'package:frontend/src/components/Button.dart';

class ProfileOptions extends StatefulWidget {
  final String about;
  final String profile;
  ProfileOptions({Key key, this.about, this.profile}) : super(key: key);

  _ProfileOptionsState createState() => _ProfileOptionsState();
}

class _ProfileOptionsState extends State<ProfileOptions> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(
        top: size.height * .075,
      ),
      child: Column(
        children: [
          Button(
            color: Colors.grey[200],
            textColor: Colors.grey[600],
            text: 'Quero ser um explorador',
            onPress: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (Route<dynamic> route) => false);
            },
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
