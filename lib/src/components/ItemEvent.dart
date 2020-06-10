import 'package:flutter/material.dart';
import 'package:frontend/src/utils/index.dart';

class ListItem extends StatefulWidget {
  final bool status;
  final String data;
  final String theme;
  final String spreaderName;

  const ListItem({
    Key key,
    this.data = "---",
    this.theme = "---",
    this.status = true,
    this.spreaderName = "---",
  }) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: size.height * .0080,
        horizontal: size.width * .040,
      ),
      child: Material(
        elevation: 5,
        shadowColor: Colors.grey[200],
        borderRadius: BorderRadius.circular(24),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            bottomLeft: Radius.circular(24),
          ),
          child: Stack(
            children: [
              Container(
                width: 8,
                decoration: BoxDecoration(
                  color: widget.status
                      ? Colors.green
                      : Colors.red.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(24),
                ),
                constraints: BoxConstraints(maxHeight: size.height * .09),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed('/event/detail');
                },
                trailing: Text(
                  widget.data,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                title: Text(
                  ellipses(widget.theme),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: size.height * .008),
                  child: Text(
                    ellipses(widget.spreaderName),
                  ),
                ),
                leading: Icon(
                  Icons.account_circle,
                  size: size.width * .12,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: size.width * .05),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
