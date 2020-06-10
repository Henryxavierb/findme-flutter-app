import 'package:flutter/material.dart';
import 'package:frontend/src/components/ItemEvent.dart';

class NotificationView extends StatefulWidget {
  final dynamic events;
  NotificationView({Key key, this.events}) : super(key: key);

  _NotificationState createState() => new _NotificationState();
}

class _NotificationState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    TextStyle _titleStyle =
        TextStyle(color: Color(0xFFffffff), fontSize: size.height * .035);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Center(child: Text('Notificação', style: _titleStyle)),
      ),
      body: Padding(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                // itemCount: widget.events.length,
                itemBuilder: (context, index) {
                  // final event = widget.events[index];

                  return ListItem(
                    status: true,
                    data: '12/05/2020',
                    spreaderName: "Representante",
                    theme: 'Quando me tornei um programador sênior',
                  );
                },
              ),
            ),
          ],
        ),
        padding: EdgeInsets.only(top: size.height * 0.024),
      ),
    );
  }
}
