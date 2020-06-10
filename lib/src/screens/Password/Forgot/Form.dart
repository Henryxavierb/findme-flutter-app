import 'package:flutter/material.dart';
import 'package:frontend/src/components/Input.dart';
import 'package:frontend/src/components/Button.dart';
import 'package:frontend/src/screens/Password/Forgot/index.dart';

class SectionForm extends StatefulWidget {
  SectionForm({Key key}) : super(key: key);

  @override
  _SectionFormState createState() => new _SectionFormState();
}

class _SectionFormState extends State<SectionForm> {
  FormStateToProps formBloc = FormStateToProps();
  final GlobalKey<FormState> _formForgotPasswordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        top: size.height * .096,
      ),
      child: Column(
        children: <Widget>[
          Form(
            key: _formForgotPasswordKey,
            child: StreamBuilder<String>(
                stream: formBloc.getEmail,
                builder: (context, snapshot) {
                  return Input(
                    placeholder: 'Email',
                    error: snapshot.error,
                    onChange: formBloc.setEmail,
                    type: TextInputType.emailAddress,
                  );
                }),
          ),
          Padding(
            child: StreamBuilder<Object>(
                stream: formBloc.onSubmit,
                builder: (context, snapshot) {
                  return Button(
                    text: 'Enviar',
                    snapshot: snapshot,
                    color: Colors.green,
                    textColor: Colors.white,
                    onSubmit: () {},
                  );
                }),
            padding: EdgeInsets.only(top: size.height * .016),
          ),
        ],
      ),
    );
  }
}
