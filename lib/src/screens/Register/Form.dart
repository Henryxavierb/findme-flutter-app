import 'package:flutter/material.dart';
import 'package:frontend/src/components/Input.dart';
import 'package:frontend/src/components/Button.dart';
import 'package:frontend/src/screens/Register/index.dart';

class SectionForm extends StatefulWidget {
  SectionForm({Key key}) : super(key: key);

  @override
  _SectionFormState createState() => new _SectionFormState();
}

class _SectionFormState extends State<SectionForm> {
  FormStateToProps formBloc = FormStateToProps();
  final GlobalKey<FormState> _formRegisterKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        top: size.height * .064,
      ),
      child: Column(
        children: <Widget>[
          Form(
            key: _formRegisterKey,
            child: Column(
              children: [
                StreamBuilder<String>(
                    stream: formBloc.getName,
                    builder: (context, snapshot) {
                      return Input(
                        placeholder: 'Nome',
                        error: snapshot.error,
                        type: TextInputType.text,
                        onChange: formBloc.setName,
                      );
                    }),
                StreamBuilder<String>(
                    stream: formBloc.getEmail,
                    builder: (context, snapshot) {
                      return Input(
                        placeholder: 'Email',
                        error: snapshot.error,
                        onChange: formBloc.setEmail,
                        type: TextInputType.emailAddress,
                      );
                    }),
                StreamBuilder<String>(
                    stream: formBloc.getPassword,
                    builder: (context, snapshot) {
                      return Input(
                        isPassword: true,
                        placeholder: 'Senha',
                        error: snapshot.error,
                        type: TextInputType.text,
                        onChange: formBloc.setPassword,
                      );
                    }),
              ],
            ),
          ),
          Padding(
            child: StreamBuilder<Object>(
                stream: formBloc.onSubmit,
                builder: (context, snapshot) {
                  return Button(
                    text: 'Cadastrar',
                    snapshot: snapshot,
                    color: Colors.green,
                    textColor: Colors.white,
                    onSubmit: () {
                      Navigator.pushNamedAndRemoveUntil(context,
                          '/profile/select', (Route<dynamic> route) => false);
                    },
                  );
                }),
            padding: EdgeInsets.only(top: size.height * .016),
          ),
        ],
      ),
    );
  }
}
