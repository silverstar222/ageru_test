import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:ageru/components/gradient-button.dart';
import 'package:ageru/models/user.dart';
import 'package:ageru/screens/signin.dart';
import 'package:ageru/screens/signup_step_3.dart';
import 'package:ageru/theme.dart';
import 'package:ageru/components/signup_layout.dart';

class SignupStep2Screen extends StatefulWidget {
  SignupStep2Screen({Key key, this.user}) : super(key: key);

  final User user;

  @override
  _SignupStep2ScreenState createState() => _SignupStep2ScreenState();
}

class _SignupStep2ScreenState extends State<SignupStep2Screen> {
  TextEditingController _passwordController = TextEditingController();
  User user;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent()
    );
  }

  Widget _header(){
    return Text("Enter your Password",
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
          obscureText: true,
          controller: _passwordController,
          validator: (value) {
            if (value.isEmpty) {
              return 'Password can\'t be blank!';
            }
            if (value.length < 6) {
              return 'Password can\'t be less than 6 characters!';
            }
          },
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset('assets/icons/lock.png', width: 15),
            ),
            labelText: "Password"
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
      ])
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
    user.password = _passwordController.text;
    if (_formKey.currentState.validate()) {
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
        SignupStep3Screen(user: user)
      ));
    }
  }
}
