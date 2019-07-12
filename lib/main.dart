import 'package:ageru/screens/onboarding.dart';
import 'package:ageru/screens/signin_select.dart';
import 'package:ageru/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/navigator-hub.dart';

void main() async {
  Widget _launchWidget;
  FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
    _launchWidget = (user != null) ? NavigatorHub() : SigninSelectScreen();

  });

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemeProvider.current,
        title: 'Ageru',
        home: _launchWidget,
      )
    );
  });
}