import 'package:flutter/material.dart';
import 'package:frontend/src/screens/Event/Create/Info/Form.dart';

class CreateEventView extends StatefulWidget {
  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEventView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
        horizontal: size.width * .08,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Cadastrar evento',
            style: TextStyle(
              fontSize: size.width * .06,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700].withOpacity(0.9),
            ),
          ),
          Padding(
            child: Text(
              'Identifique o evento',
              style: TextStyle(
                fontSize: size.width * .05,
                color: Colors.grey[700].withOpacity(0.9),
              ),
            ),
            padding: EdgeInsets.only(top: size.height * .02),
          ),
          SectionForm(),
        ],
      ),
    );
  }
}
