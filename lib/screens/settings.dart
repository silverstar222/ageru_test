import 'package:ageru/screens/signin_select.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class SettingsScreens extends StatefulWidget {
  @override
  _SettingsScreensState createState() => _SettingsScreensState();
}

class _SettingsScreensState extends State<SettingsScreens> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: OutlineButton(
            padding: EdgeInsets.all(13),
            borderSide: BorderSide(width: 1.5, color: AppThemeProvider.teal),
            child: Text("Logout",
              style: TextStyle(color: AppThemeProvider.teal, fontSize: 14)
            ),
            onPressed: _signOut,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
            )
          )
        ),
      ),
    );
  }

  void _signOut() async {
    await _auth.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => SigninSelectScreen()));
  }
}
