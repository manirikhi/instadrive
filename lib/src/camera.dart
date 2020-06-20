import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';



class MyCamera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('alert box')),
      body: Column(
        children: [
          FlatButton(
            child: Text('click me'),
            onPressed: () {
              return Alert(
                context: context,
                title: "Pinterest",
                desc:
                    "The App does not have access to your photos or videos.Enable Access in privacy setting",
                buttons: [
                  DialogButton(
                      child: Text('Allow'),
                      onPressed: () {
                        Navigator.pop(context,MaterialPageRoute(builder: (context) => HomePage()));
                  
                      }),
                  DialogButton(
                    child: Text('Dont Allow'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ).show();
            },
          )
        ],
      ),
    );
  }
}
