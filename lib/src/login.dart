import 'package:flutter/material.dart';
import 'package:instadrive/src/bottomnavigation.dart';
import 'package:instadrive/src/register.dart';
import 'bottomnavigation.dart';

import 'package:google_fonts/google_fonts.dart';
import 'register.dart';
import 'googlesignin.dart';

class Login extends StatefulWidget {
  
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
    final appTitle = 'Devoret';

  /* Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
*/
  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xfffbb448), Color(0xfff7892b)])),
      // child:Image.asset('assets/images/facebooklogo.jpg',height: 200.0,),
      child: Text('Login'),
    );
  }

  Widget _signinPartner() {
    return Container(
      child: Text(
        'Or Sign Up Using',
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }

  Widget _signUpPartnersIcons() {
    return Container(
      width: MediaQuery.of(context).size.width,

      // height: MediaQuery.of(context).size.height,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/facebooklogo.jpg',
              height: 30.0,
              width: 30.0,
            ),
            IconButton(
              icon: Icon(Icons.ac_unit),
              onPressed: () {
                signInWithGoogle().whenComplete(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return MyHomePage(title: appTitle);
                      },
                    ),
                  );
                });
              },
            ),

            /*Image.asset(
              'assets/images/google.jpg',
              height: 35.0,
              width: 35.0,
            ),*/
            Image.asset(
              'assets/images/twitter.jpg',
              height: 30.0,
              width: 30.0,
            )
          ]),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Register()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Don't have Account ?",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Sign Up',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Insta',
          style: GoogleFonts.portLligatSans(
            //  textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),
          children: [
            TextSpan(
              text: 'Drive',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: '..',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        // _entryField("Username"),
        _entryField("Email id"),
        _entryField("Password", isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            /*   Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),*/
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .09),
                    _title(),

                    SizedBox(
                      height: 80,
                    ),

                    _emailPasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _loginButton(),

                    // SizedBox(height: height * .14),
                    _signUpButton(),
                    // SizedBox(
                    //  height: 10,
                    //),
                    _signinPartner(),
                    _signUpPartnersIcons(),
                    // RaisedButton(onPressed: (){},child: Text('Google Sign In'),),
                  ],
                ),
              ),
            ),
            // Positioned(top: 40, left: 0, child: _backButton()), for back page
          ],
        ),
      ),
    );
  }
}
