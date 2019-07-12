import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:ageru/components/gradient-button.dart';
import 'package:ageru/models/user.dart';
import 'package:ageru/screens/signin.dart';
import 'package:ageru/screens/signup_step_2.dart';
import 'package:ageru/theme.dart';
import 'package:ageru/components/signup_layout.dart';
import 'package:ageru/validators/email-validator.dart';

class SignupStep1Screen extends StatefulWidget {

  @override
  _SignupStep1ScreenState createState() => _SignupStep1ScreenState();
}

class _SignupStep1ScreenState extends State<SignupStep1Screen> {
  TextEditingController _emailController = TextEditingController();
  User user;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent()
    );
  }

  Widget _header(){
    return Text("Enter your Email",
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
          controller: _emailController,
          validator: (value) {
            if (value.isEmpty) {
              return 'Email can\'t be blank!';
            }
            if (!EmailValidator.regex.hasMatch(value)) {
              return 'Enter valid email!';
            }
          },
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset('assets/icons/email.png', width: 15),
            ),
            labelText: "Email"
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
    user = User(_emailController.text);
    if (_formKey.currentState.validate()) {
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
        SignupStep2Screen(user: user)
      ));
    }
  }
}
