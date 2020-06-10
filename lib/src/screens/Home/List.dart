import 'package:flutter/material.dart';
import 'package:frontend/src/components/ItemEvent.dart';

class ListEvent extends StatefulWidget {
  final dynamic events;
  const ListEvent({Key key, this.events}) : super(key: key);

  @override
  _ListEventState createState() => _ListEventState();
}

class _ListEventState extends State<ListEvent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        // itemCount: widget.events.length,
        itemCount: 5,
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
    );
  }
}
