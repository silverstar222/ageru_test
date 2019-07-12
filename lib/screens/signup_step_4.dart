import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ageru/components/gradient-button.dart';
import 'package:ageru/components/navigator-hub.dart';
import 'package:ageru/models/user.dart';
import 'package:ageru/screens/signin.dart';
import 'package:ageru/theme.dart';
import 'package:ageru/components/signup_layout.dart';

class SignupStep4Screen extends StatefulWidget {
  SignupStep4Screen({Key key, this.user}) : super(key: key);

  final User user;

  @override
  _SignupStep4ScreenState createState() => _SignupStep4ScreenState();
}

class _SignupStep4ScreenState extends State<SignupStep4Screen> {
  User user;
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent()
    );
  }

  Widget _signInForm() {
    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
        CircleAvatar(
          radius: 50,
          child: Image.asset('assets/images/avatar_stub.png'),
          backgroundColor: Colors.transparent,
        ),
        SizedBox(height: 10),
        Text("ADD PROFILE PICTURE",
          style: TextStyle(
            color: AppThemeProvider.teal,
            fontSize: 11,
            fontFamily: 'Avenir-roman'
          )
        ),
        SizedBox(height: 50),
        GradientButton(
          height: 50.0,
          onPressed: _signUp,
          child: Text(
            'SIGNUP',
            style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Avenir-medium'),
          ),
          gradient: LinearGradient(
            colors: <Color>[AppThemeProvider.teal, AppThemeProvider.lime,],
          ),
        )
      ],)
    );
  }

  _footerText(){
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(fontSize: 13),
        children: [
          TextSpan(
            text: 'Already have an account? ',
            style: TextStyle(color: AppThemeProvider.darkTeal),
          ),
          TextSpan(
            text: 'Sign in',
            style: TextStyle(color: AppThemeProvider.teal),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                  SigninScreen()
                ));
              }
          )
        ]
      ),
    );
  }

  _buildContent() {
    return SignUpLayout(
      content: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 60),
            _signInForm(),
            SizedBox(height: 20),
            _footerText(),
          ],
        ),
      ),
    );
  }

  _signUp() async {
    user = widget.user;
    try {
      final FirebaseUser firebaseUser = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      if (firebaseUser != null) {
        Firestore.instance.collection('users').document()
          .setData({ 'email': user.email, 'name': user.name });
        Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => NavigatorHub()));
      }
    } on PlatformException catch(e) {
      Fluttertoast.showToast(msg: e.code, toastLength: Toast.LENGTH_LONG);
    }
  }
}
