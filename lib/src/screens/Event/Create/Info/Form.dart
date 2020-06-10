import 'package:flutter/material.dart';
import 'package:frontend/src/components/Button.dart';
import 'package:frontend/src/components/Input.dart';
import 'package:frontend/src/screens/Event/Create/Info/index.dart';

class SectionForm extends StatefulWidget {
  @override
  _SectionFormState createState() => _SectionFormState();
}

class _SectionFormState extends State<SectionForm> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    FormStateToProps props = FormStateToProps();

    return Column(
      children: <Widget>[
        StreamBuilder<String>(
          stream: props.getTheme,
          builder: (context, snapshot) {
            return Padding(
              padding: EdgeInsets.only(top: size.height * .03),
              child: Input(
                margin: false,
                error: snapshot.error,
                onChange: props.setTheme,
                type: TextInputType.text,
                placeholder: "Tema do evento",
              ),
            );
          },
        ),
        StreamBuilder<String>(
          stream: props.getOwner,
          builder: (context, snapshot) {
            return Padding(
              padding: EdgeInsets.only(top: size.height * .03),
              child: Input(
                margin: false,
                error: snapshot.error,
                onChange: props.setOwner,
                type: TextInputType.text,
                placeholder: "Representante",
              ),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * .03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              StreamBuilder<String>(
                stream: props.getBeginDate,
                builder: (context, snapshot) {
                  return Container(
                    width: size.width * .35,
                    child: Input(
                      margin: false,
                      error: snapshot.error,
                      hintText: '01/01/2000',
                      type: TextInputType.text,
                      placeholder: "Data início",
                      onChange: props.setbeginDate,
                    ),
                  );
                },
              ),
              //
              Text('Até', style: TextStyle(fontSize: size.width * .04)),
              //
              StreamBuilder<String>(
                stream: props.getEndDate,
                builder: (context, snapshot) {
                  return Container(
                    width: size.width * .35,
                    child: Input(
                      margin: false,
                      error: snapshot.error,
                      hintText: '01/01/2000',
                      placeholder: "Data fim",
                      type: TextInputType.text,
                      onChange: props.setEndDate,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        StreamBuilder<String>(
          stream: props.getLink,
          builder: (context, snapshot) {
            return Padding(
              padding: EdgeInsets.only(top: size.height * .03),
              child: Input(
                margin: false,
                error: snapshot.error,
                onChange: props.setLink,
                type: TextInputType.text,
                placeholder: "Link do evento",
              ),
            );
          },
        ),
        StreamBuilder<String>(
          stream: props.getDescription,
          builder: (context, snapshot) {
            return Padding(
              padding: EdgeInsets.only(top: size.height * .03),
              child: Input(
                margin: false,
                expandInput: true,
                error: snapshot.error,
                type: TextInputType.text,
                onChange: props.setDescription,
                placeholder: "Descrição (Opcional)",
              ),
            );
          },
        ),
        Padding(
          child: StreamBuilder<Object>(
              stream: props.onSubmit,
              builder: (context, snapshot) {
                return Button(
                  margin: false,
                  text: 'Continuar',
                  // snapshot: snapshot,
                  color: Colors.green,
                  textColor: Colors.white,
                  onPress: () {
                    Navigator.pushNamed(context, "/event/create/social");
                  },
                );
              }),
          padding: EdgeInsets.only(top: size.height * .018),
        ),
      ],
    );
  }
}
