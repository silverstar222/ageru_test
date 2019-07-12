import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:ageru/components/gradient-button.dart';
import 'package:ageru/models/user.dart';
import 'package:ageru/screens/signin.dart';
import 'package:ageru/screens/signup_step_4.dart';
import 'package:ageru/theme.dart';
import 'package:ageru/components/signup_layout.dart';

class SignupStep3Screen extends StatefulWidget {
  SignupStep3Screen({Key key, this.user}) : super(key: key);

  final User user;

  @override
  _SignupStep3ScreenState createState() => _SignupStep3ScreenState();
}

class _SignupStep3ScreenState extends State<SignupStep3Screen> {
  TextEditingController _nameController = TextEditingController();
  User user;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent()
    );
  }

  Widget _header(){
    return Text("Enter your Name",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontFamily: 'Avenir-medium'
      )
    );
  }

  Widget _signInForm() {
    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
        TextFormField(
          controller: _nameController,
          validator: (value) {
            if (value.isEmpty) {
              return 'Name can\'t be blank!';
            }
            if (value.length < 2) {
              return 'Name can\'t be less than 2 characters!';
            }
          },
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset('assets/icons/user.png', width: 15),
              ),
              labelText: "Name"
          )
        ),
        SizedBox(height: 50),
        GradientButton(
          height: 50.0,
          onPressed: _openSignUpStep2Screen,
          child: Text(
            'NEXT',
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
            _header(),
            SizedBox(height: 60),
            _signInForm(),
            SizedBox(height: 20),
            _footerText(),
          ],
        ),
      )
    );
  }

  _openSignUpStep2Screen() {
    user = widget.user;
    user.name = _nameController.text;
    if (_formKey.currentState.validate()) {
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
        SignupStep4Screen(
          user: user
      )));
    }
  }
}
