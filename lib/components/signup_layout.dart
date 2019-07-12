import 'package:flutter/material.dart';

class SignUpLayout extends StatelessWidget {
  SignUpLayout({this.content});

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: Image.asset('assets/images/background_bottom.png',
            width: MediaQuery.of(context).size.width
          ),
          bottom: 0,
          right: 0,
        ),
        Positioned(
          child: Image.asset('assets/images/background_top.png',
              width: MediaQuery.of(context).size.width
          ),
          top: 0,
          right: 0,
        ),
        content,
        Container(
          height: 100,
          child: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: true,
          ),
          color: Colors.transparent,
        ),
      ],
    );
  }
}
