import 'package:flutter/material.dart';
import 'package:frontend/src/screens/Profile/About/Options.dart';
import 'package:frontend/src/screens/Profile/About/Description.dart';

class ProfileSection extends StatefulWidget {
  ProfileSection({Key key}) : super(key: key);

  @override
  _ProfileSectionState createState() => new _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ProfileDescription(
          profile: 'Divulgador',
          about: 'É o responsável por agendar, editar e cancelar um evento.' +
              ' São eles que ditam o rumo da exploração.',
        ),
        ProfileDescription(
          profile: 'Explorador',
          about: 'É aquele que se aventura, corre atrás dos eventos ' +
              ' digitais que mais lhe agrada.',
        ),
        ProfileOptions(),
      ],
    );
  }
}
