import 'package:flutter/material.dart';

class LinkToLoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var fontPixel = MediaQuery.of(context).textScaleFactor;

    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/login");
          },
          child: SizedBox(
            width: size.width,
            height: size.height * .080,
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Já possui uma conta? ",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: fontPixel * 16,
                      ),
                    ),
                    TextSpan(
                      text: "Faça login",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: fontPixel * 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
