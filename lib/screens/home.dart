import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset('assets/images/map.jpg',
              height: screenHeight,
              width: screenWidth,
              fit: BoxFit.fitHeight
            ),
          ),
          Container(
            width: screenWidth,
            height: 88,
            color: Colors.black12,
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 5, right: 12,
                  height: 28, width: 28,
                  child: Image.asset('assets/icons/notification.png')
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}
