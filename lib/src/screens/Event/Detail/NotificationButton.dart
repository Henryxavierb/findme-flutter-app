import 'package:flutter/material.dart';

class NotificationButton extends StatefulWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Function onPress;

  NotificationButton({
    Key key,
    this.onPress,
    this.text = "Confirmar",
    this.color = Colors.green,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  _ButtonState createState() => new _ButtonState();
}

class _ButtonState extends State<NotificationButton> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var fontPixel = MediaQuery.of(context).textScaleFactor;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: size.height * .01,
      ),
      child: ButtonTheme(
        height: size.height * .06,
        minWidth: size.width * .52,
        child: RaisedButton(
          elevation: 8,
          autofocus: false,
          color: widget.color,
          textColor: widget.textColor,
          clipBehavior: Clip.antiAlias,
          disabledColor: Colors.green[200],
          onPressed: widget.onPress ?? null,
          child: Text(widget.text,
              style: TextStyle(
                fontSize: fontPixel * 16,
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
