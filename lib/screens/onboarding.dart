import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:ageru/components/gradient-button.dart';
import 'package:ageru/screens/signin_select.dart';
import 'package:ageru/theme.dart';

class TutorialScreen extends StatefulWidget {

  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final SwiperController _swiperController = SwiperController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Swiper(
          loop: false,
          controller: _swiperController,
          pagination: SwiperPagination(
            margin: EdgeInsets.only(bottom: 40),
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
              color: Colors.grey.shade100,
              activeColor: AppThemeProvider.lime,
              size: 8.0,
              activeSize: 8.0,
              space: 5.0
            )
          ),
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            switch (index) {
              case 0:
                {
                  return _buildTutorialStep('assets/images/onboarding_1.png', "Reuse the product for environment", index);
                }
                break;
              case 1:
                {
                  return _buildTutorialStep('assets/images/onboarding_2.png', "No delivery required, \ngive and take with your neighbors", index);
                }
                break;
              case 2:
                {
                  return _buildTutorialStep('assets/images/onboarding_3.png', "Considering privacy and being displayed only to neighbors", index);
                }
                break;
            }
          },
        ),
      ),
    );
  }

  Widget _buildTutorialStep(String image, title, index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Image.asset(image),
        _buildDescription(title),
        (index == 2) ? _buildButton() : Container()
      ],
    );
  }

  _buildDescription(String title) {
    return Container(padding: EdgeInsets.only(top: 40, left: 20, right: 20),
      child: Text(title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 22)
      )
    );
  }

  _buildButton() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: GradientButton(
        onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SigninSelectScreen())),
        child: Text(
          'GET STARTED',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        gradient: LinearGradient(
          colors: <Color>[AppThemeProvider.teal, AppThemeProvider.lime,],
        ),
      ),
    );
  }
}
