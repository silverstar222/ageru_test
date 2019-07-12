import 'dart:io';

import 'package:ageru/screens/chat.dart';
import 'package:ageru/screens/deal.dart';
import 'package:ageru/screens/home.dart';
import 'package:ageru/screens/settings.dart';
import 'package:ageru/theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NavigatorHub extends StatefulWidget {
  @override
  _NavigatorHubState createState() => _NavigatorHubState();
}

class _NavigatorHubState extends State<NavigatorHub> {

  int currentTab = 0;
  File image;
  Widget home = HomeScreen();
  Widget deal = DealScreen();
  Widget chat = ChatScreen();
  Widget settings = SettingsScreens();
  Widget currentScreen;

  List<Widget> screens;

  PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    screens = [home, deal, chat, settings];
    currentScreen = home;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.photo_camera),
        backgroundColor: AppThemeProvider.teal,
        onPressed: getImage
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Future getImage() async {
    var _image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {image = _image;});
  }

  _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentTab,
      onTap: (int index) async {
        setState(() {
          currentTab = index;
          currentScreen = screens[index];
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.pin_drop, color: Colors.grey.shade300, size: 30),
          activeIcon: Icon(Icons.pin_drop, color: AppThemeProvider.teal, size: 30),
          title: Text('Home', style: TextStyle(color: Colors.black)),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard, color: Colors.grey.shade300, size: 30),
          activeIcon: Icon(Icons.dashboard, color: AppThemeProvider.teal, size: 30),
          title: Text('Deal', style: TextStyle(color: Colors.black)),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.question_answer, color: Colors.grey.shade300, size: 30),
          activeIcon: Icon(Icons.question_answer, color: AppThemeProvider.teal, size: 30),
          title: Text('Chat', style: TextStyle(color: Colors.black)),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, color: Colors.grey.shade300, size: 30),
          activeIcon: Icon(Icons.settings, color: AppThemeProvider.teal, size: 30),
          title: Text('Settings', style: TextStyle(color: Colors.black)),
        ),
      ]
    );
  }

}
