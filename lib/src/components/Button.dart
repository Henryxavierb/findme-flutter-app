import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String text;
  final bool margin;
  final Color color;
  final Color textColor;
  final Function onPress;
  final Function onSubmit;

  final AsyncSnapshot snapshot;

  Button({
    Key key,
    this.onPress,
    this.onSubmit,
    this.snapshot,
    this.margin = true,
    this.text = "Confirmar",
    this.color = Colors.green,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  _ButtonState createState() => new _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var fontPixel = MediaQuery.of(context).textScaleFactor;

    bool isValid = widget.snapshot != null
        ? (!widget.snapshot.hasError && widget.snapshot.hasData)
        : null;

    Function onSubmit =
        widget.onSubmit != null && isValid ? widget.onSubmit : null;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: !widget.margin ? 0 : size.width * .064,
      ),
      child: ButtonTheme(
        height: size.width * .15,
        minWidth: size.width,
        child: RaisedButton(
          elevation: 8,
          autofocus: false,
          color: widget.color,
          textColor: widget.textColor,
          clipBehavior: Clip.antiAlias,
          disabledColor: Colors.green[200],
          onPressed: onSubmit ?? (widget.onPress ?? null),
          child: Text(widget.text,
              style: TextStyle(
                fontSize: fontPixel * 20,
                color: widget.textColor,
              )),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(56),
          ),
        ),
      ),
    );
  }
}
