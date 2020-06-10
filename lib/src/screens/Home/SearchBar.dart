import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final String placeholder;
  final String validateMessage;
  final TextEditingController controller;

  SearchBar({
    Key key,
    this.controller,
    this.placeholder,
    this.validateMessage,
  }) : super(key: key);

  @override
  _SearchBarState createState() => new _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * .08,
      ),
      child: Container(
        child: Center(
          child: Column(children: [
            TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                filled: true,
                hintText: 'Username',
                fillColor: Colors.white,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: size.height * .008,
                  ),
                  child: Icon(Icons.search),
                ),
                contentPadding: EdgeInsets.only(
                  top: size.width * .032,
                  left: size.width * .016,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              validator: (field) {
                if (field.length == 0) {
                  return widget.validateMessage;
                }

                return null;
              },
              keyboardType: TextInputType.text,
              style: TextStyle(fontFamily: "Poppins"),
            ),
          ]),
        ),
      ),
    );
  }
}
