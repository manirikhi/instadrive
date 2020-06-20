import 'package:flutter/material.dart';

    

class MyCard extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
         debugShowCheckedModeBanner: false,

      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController(
    viewportFraction: 0.3,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView.builder(
         controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (context, index) => _builder(index),
        ),
      ),
    );
  }

  _builder(int index) {
    return Tard();
  }
}


    

class Tard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(color: Colors.deepOrange,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.add_a_photo),
              title: Text('Student Name:'),
              subtitle: Text('Date:  Time: '),
            ),
            ButtonBar(
              children: <Widget>[
                IconButton(icon: Icon(Icons.phone), onPressed: (){}),
                   IconButton(icon: Icon(Icons.message), onPressed: (){}),              
                              
        
              ],
            ),
          ],
        ),
      );
    
  }
}

