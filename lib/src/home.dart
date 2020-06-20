import 'package:flutter/material.dart';
import 'register.dart';
import 'cardprofile.dart';
import 'camera.dart';


class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  int _currentIndex = 0;
  final appTitle = 'Devoret';

  Widget _bodyLogin()
   {
    return MyCard();
  }

  void onTabTapped(int index) {
    setState(() {
      if (index==2)
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyCamera()));
          else
           Navigator.push(
          context, MaterialPageRoute(builder: (context) => Register()));
      _currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Insta Drive'),),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          backgroundColor: Colors.white30,
          currentIndex: _currentIndex,
          items: [
            new BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              title: Text('Messages'),
            ),
            // new BottomNavigationBarItem(
            // icon: Icon(Icons.person), title: Text('Profile')),
            new BottomNavigationBarItem(
                icon: Icon(Icons.photo_camera), title: Text('Camera'))
          ],
        ),
        body: _bodyLogin(),
    );
  }
}
