import 'package:flutter/material.dart';

class NotificationIcon extends StatefulWidget {
  final bool hasNotification;
  NotificationIcon({Key key, this.hasNotification = false}) : super(key: key);

  @override
  _NotificationIconState createState() => _NotificationIconState();
}

class _NotificationIconState extends State<NotificationIcon> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Icon(
              Icons.notifications,
              color: Colors.white,
              size: size.width * .1,
            ),
            Visibility(
              visible: widget.hasNotification,
              child: Positioned(
                top: size.height * .015,
                right: size.width * .020,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
