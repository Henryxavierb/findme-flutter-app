import 'package:flutter/material.dart';
import 'package:frontend/src/components/Input.dart';
import 'package:frontend/src/components/Button.dart';
import 'package:frontend/src/screens/Event/Create/Social/index.dart';

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
        Row(
          children: <Widget>[
            StreamBuilder<bool>(
                stream: props.getYoutube,
                builder: (context, snapshot) {
                  return Row(
                    children: <Widget>[
                      Checkbox(
                        value: snapshot.data ?? false,
                        onChanged: (bool value) {
                          props.setYoutube.add(value);
                        },
                      ),
                      Text('Youtube'),
                    ],
                  );
                }),
            StreamBuilder<bool>(
                stream: props.getTwitter,
                builder: (context, snapshot) {
                  return Row(
                    children: <Widget>[
                      Checkbox(
                        value: snapshot.data ?? false,
                        onChanged: (bool value) {
                          props.setTwitter.add(value);
                        },
                      ),
                      Text('Twitter'),
                    ],
                  );
                }),
            StreamBuilder<bool>(
                stream: props.getLinkedIn,
                builder: (context, snapshot) {
                  return Row(
                    children: <Widget>[
                      Checkbox(
                        value: snapshot.data ?? false,
                        onChanged: (bool value) {
                          props.setLinkedIn.add(value);
                        },
                      ),
                      Text('LinkedIn'),
                    ],
                  );
                }),
            StreamBuilder<bool>(
                stream: props.getInstagram,
                builder: (context, snapshot) {
                  return Row(
                    children: <Widget>[
                      Checkbox(
                        value: snapshot.data ?? false,
                        onChanged: (bool value) {
                          props.setInstagram.add(value);
                        },
                      ),
                      Text('Instagram'),
                    ],
                  );
                }),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: size.width * .05,
          ),
          child: StreamBuilder(
            stream: props.getYoutube,
            builder: (context, flagSnapshot) {
              return StreamBuilder<String>(
                stream: props.getLinkYoutube,
                builder: (context, snapshot) {
                  return (flagSnapshot.data ?? false)
                      ? Padding(
                          padding: EdgeInsets.only(top: size.height * .03),
                          child: Input(
                            margin: false,
                            error: snapshot.error,
                            type: TextInputType.text,
                            onChange: props.setLinkYoutube,
                            placeholder: "Link para o Youtube",
                          ),
                        )
                      : Container();
                },
              );
            },
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: size.width * .05,
          ),
          child: StreamBuilder(
            stream: props.getTwitter,
            builder: (context, flagSnapshot) {
              return StreamBuilder<String>(
                stream: props.getLinkTwitter,
                builder: (context, snapshot) {
                  return (flagSnapshot.data ?? false)
                      ? Padding(
                          padding: EdgeInsets.only(top: size.height * .03),
                          child: Input(
                            margin: false,
                            error: snapshot.error,
                            type: TextInputType.text,
                            onChange: props.setLinkTwitter,
                            placeholder: "Link para o Twitter",
                          ),
                        )
                      : Container();
                },
              );
            },
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: size.width * .05,
          ),
          child: StreamBuilder(
            stream: props.getLinkedIn,
            builder: (context, flagSnapshot) {
              return StreamBuilder<String>(
                stream: props.getLinkLinkedIn,
                builder: (context, snapshot) {
                  return (flagSnapshot.data ?? false)
                      ? Padding(
                          padding: EdgeInsets.only(top: size.height * .03),
                          child: Input(
                            margin: false,
                            error: snapshot.error,
                            type: TextInputType.text,
                            onChange: props.setLinkLinkedIn,
                            placeholder: "Link para o LinkedIn",
                          ),
                        )
                      : Container();
                },
              );
            },
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: size.width * .05,
          ),
          child: StreamBuilder(
            stream: props.getInstagram,
            builder: (context, flagSnapshot) {
              return StreamBuilder<String>(
                stream: props.getLinkInstagram,
                builder: (context, snapshot) {
                  return (flagSnapshot.data ?? false)
                      ? Padding(
                          padding: EdgeInsets.only(top: size.height * .03),
                          child: Input(
                            margin: false,
                            error: snapshot.error,
                            type: TextInputType.text,
                            onChange: props.setLinkInstagram,
                            placeholder: "Link para o Instagram",
                          ),
                        )
                      : Container();
                },
              );
            },
          ),
        ),
        Padding(
          child: Button(
            text: 'Cadastrar',
            // snapshot: snapshot,
            color: Colors.green,
            textColor: Colors.white,
            onPress: () {
              Navigator.pushNamed(context, "/event/create/social");
            },
          ),
          padding: EdgeInsets.only(top: size.height * .03),
        ),
      ],
    );
  }
}
