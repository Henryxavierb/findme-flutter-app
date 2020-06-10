import 'package:flutter/material.dart';
import 'package:frontend/src/screens/Event/Create/Social/Form.dart';

class SocialView extends StatefulWidget {
  @override
  _SocialFormViewState createState() => _SocialFormViewState();
}

class _SocialFormViewState extends State<SocialView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Base(),
    );
  }
}

class Base extends StatefulWidget {
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: size.height * .07,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: size.width * .08,
            ),
            child: Text(
              'Cadastrar evento',
              style: TextStyle(
                fontSize: size.width * .06,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700].withOpacity(0.9),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: size.width * .08,
              vertical: size.height * .02,
            ),
            child: Text(
              'Compartilhe as mídias sociais do representante',
              style: TextStyle(
                fontSize: size.width * .05,
                color: Colors.grey[700].withOpacity(0.9),
              ),
            ),
          ),
          SectionForm(),
        ],
      ),
    );
  }
}
