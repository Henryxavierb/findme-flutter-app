import 'package:flutter/material.dart';

class LinkToForgotPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        top: size.height * .024,
      ),
      child: GestureDetector(
        child: Container(
          width: size.width,
          color: Colors.white12,
          child: Center(
            child: Text(
              'Esqueci minha senha',
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
                fontSize: MediaQuery.of(context).textScaleFactor * 16,
              ),
            ),
          ),
        ),
        onTap: () => Navigator.of(context).pushNamed('/password/forgot'),
      ),
    );
  }
}

// /////////////////////////////////////////////////////////

class LinkToRegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var fontPixel = MediaQuery.of(context).textScaleFactor;

    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('/register');
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
                      text: "Não tem uma conta? ",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: fontPixel * 16,
                      ),
                    ),
                    TextSpan(
                      text: "Cadastre-se",
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
