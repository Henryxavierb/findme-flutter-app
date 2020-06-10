import 'package:flutter/material.dart';

class LinkToAboutProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('/profile/about');
          },
          child: SizedBox(
            width: size.width,
            height: size.height * .080,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Sobre os perfis",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: MediaQuery.of(context).textScaleFactor * 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
