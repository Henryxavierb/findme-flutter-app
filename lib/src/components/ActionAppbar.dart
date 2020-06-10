import 'package:flutter/material.dart';

// If goBack is false the action in Appbar is logout default.
class ActionAppBar extends StatefulWidget {
  final bool goBack;
  const ActionAppBar({Key key, this.goBack = false}) : super(key: key);

  @override
  _ActionAppBarState createState() => _ActionAppBarState();
}

class _ActionAppBarState extends State<ActionAppBar> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var pixel = MediaQuery.of(context).devicePixelRatio;

    return Align(
      alignment: !widget.goBack ? Alignment.topRight : Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(
          top: size.height * .04,
          left: widget.goBack ? size.width * .02 : 0,
          right: widget.goBack ? 0 : size.width * .032,
        ),
        child: ClipOval(
          child: Material(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(100),
            child: InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  widget.goBack
                      ? Navigator.pop(context)
                      : Navigator.pushNamedAndRemoveUntil(
                          context, '/login', (Route<dynamic> route) => false);
                },
                child: Padding(
                  padding: EdgeInsets.all(pixel * 2.5),
                  child: Icon(
                      !widget.goBack
                          ? Icons.power_settings_new
                          : Icons.arrow_back,
                      color: Colors.white,
                      size: size.width * .088),
                )),
          ),
        ),
      ),
    );
  }
}
