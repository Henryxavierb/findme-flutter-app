import 'package:flutter/material.dart';
import 'package:frontend/src/components/Input.dart';
import 'package:frontend/src/components/Button.dart';
import 'package:frontend/src/screens/Password/Reset/index.dart';

class SectionForm extends StatefulWidget {
  SectionForm({Key key}) : super(key: key);

  @override
  _SectionFormState createState() => new _SectionFormState();
}

class _SectionFormState extends State<SectionForm> {
  final GlobalKey<FormState> _formResetPasswordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    FormStateToProps formBloc = FormStateToProps();
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        top: size.height * .072,
      ),
      child: Column(
        children: <Widget>[
          Form(
            key: _formResetPasswordKey,
            child: Column(
              children: [
                StreamBuilder<String>(
                    stream: formBloc.getPassword,
                    builder: (context, snapshot) {
                      return Input(
                        isPassword: true,
                        error: snapshot.error,
                        type: TextInputType.text,
                        placeholder: 'Nova senha',
                        onChange: formBloc.setPassword,
                      );
                    }),
                StreamBuilder<String>(
                    stream: formBloc.getConfirmPassword,
                    builder: (context, snapshot) {
                      return Input(
                        isPassword: true,
                        error: snapshot.error,
                        type: TextInputType.text,
                        placeholder: 'Confirmar senha',
                        onChange: formBloc.setConfirmPassword,
                      );
                    }),
                StreamBuilder<String>(
                    stream: formBloc.getToken,
                    builder: (context, snapshot) {
                      return Input(
                        error: snapshot.error,
                        type: TextInputType.text,
                        onChange: formBloc.setToken,
                        placeholder: 'Token de validação',
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
                    text: 'Redefinir',
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
