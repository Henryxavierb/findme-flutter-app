import 'package:flutter/material.dart';
import 'package:frontend/src/components/Input.dart';
import 'package:frontend/src/components/Button.dart';
import 'package:frontend/src/screens/Profile/Details/index.dart';

class SectionForm extends StatefulWidget {
  final bool isEditing;
  final Function cancelEdit;

  const SectionForm({
    Key key,
    this.cancelEdit,
    this.isEditing = false,
  }) : super(key: key);

  @override
  _FormProfileState createState() => _FormProfileState();
}

class _FormProfileState extends State<SectionForm> {
  FormStateToProps formBloc = FormStateToProps();
  GlobalKey<FormState> _formEditProfile = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: size.height * .05),
      child: Column(
        children: [
          Form(
            key: _formEditProfile,
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
                        disabled: widget.isEditing,
                      );
                    }),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: size.height * .01,
                  ),
                  child: StreamBuilder<String>(
                      stream: formBloc.getEmail,
                      builder: (context, snapshot) {
                        return Input(
                          placeholder: 'Email',
                          error: snapshot.error,
                          disabled: widget.isEditing,
                          onChange: formBloc.setEmail,
                          type: TextInputType.emailAddress,
                        );
                      }),
                ),
                StreamBuilder<String>(
                    stream: formBloc.getPassword,
                    builder: (context, snapshot) {
                      return Input(
                        isPassword: true,
                        placeholder: 'Senha',
                        error: snapshot.error,
                        type: TextInputType.text,
                        disabled: widget.isEditing,
                        onChange: formBloc.setPassword,
                      );
                    }),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * .02),
            child: StreamBuilder(
                stream: formBloc.onSubmit,
                builder: (context, snapshot) {
                  return Button(
                    text: "Editar",
                    snapshot: snapshot,
                    onSubmit: widget.isEditing ? () {} : null,
                  );
                }),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * .02),
            child: widget.isEditing
                ? Button(
                    color: Colors.red,
                    text: "Cancelar",
                    onPress: () {
                      widget.cancelEdit(false);
                    },
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
