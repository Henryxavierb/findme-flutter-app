import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final bool margin;
  final String error;
  final bool disabled;
  final Sink onChange;
  final String hintText;
  final bool isPassword;
  final bool expandInput;
  final TextInputType type;
  final String placeholder;

  Input({
    Key key,
    this.error,
    this.onChange,
    this.hintText,
    this.margin = true,
    this.disabled = true,
    this.isPassword = false,
    this.expandInput = false,
    this.type = TextInputType.text,
    this.placeholder = "Coloque seu texto aqui.",
  }) : super(key: key);

  @override
  _InputState createState() => new _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: widget.margin ? size.height * .008 : 0,
        horizontal: widget.margin ? size.width * .064 : 0,
      ),
      child: Column(
        children: [
          TextFormField(
            autofocus: false,
            autovalidate: true,
            enabled: widget.disabled,
            keyboardType: widget.type,
            obscureText: widget.isPassword,
            style: TextStyle(fontFamily: "Poppins"),
            onChanged: (value) => widget.onChange.add(value),
            decoration: InputDecoration(
              fillColor: Colors.white,
              errorText: widget.error,
              labelText: widget.placeholder,
              hintText: widget.hintText ?? widget.placeholder,
              border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(24.0)),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: widget.expandInput ? size.height * .06 : 0),
            ),
          ),
        ],
      ),
    );
  }
}
