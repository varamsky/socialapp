import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() {
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  Color eyeIconColor = Colors.black;
  bool isTextHidden = true;

  static String pattern = '^`~!@#\$\%^&*()-=+{}|[]:";<>?,./';

  final _emailFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();

  var _loginPosition = 0.34;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFBA767), Color(0xFFF85685)],
          ),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16.0,
                  ),
                  child: Image.asset(
                    'assets/logo.png',
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Card(
                          elevation: 8.0,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 15.0),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20.0,
                                    horizontal: 20.0,
                                  ),
                                  child: Form(
                                    key: _emailFormKey,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty)
                                          return 'Please fill this field';
                                        else if(value.length < 5)
                                          return 'Too short to be a username';
                                        else{
                                          if(value.startsWith(RegExp(r'[0-9]')))
                                            return 'Username doesn\'t start with a number' ;
                                          for(int i=0;i<pattern.length;i++) {
                                            if(value.contains(pattern[i]))
                                              return 'Only alphabets or underscores or numbers';
                                          }
                                        }
                                      },
                                      decoration: InputDecoration(
                                        icon: Icon(
                                          Icons.mail_outline,
                                          color: Colors.black,
                                        ),
                                        border: InputBorder.none,
                                        hintText: 'Enter a Username',
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                        //border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 22.0),
                                  child: Divider(
                                    color: Colors.grey[500],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20.0,
                                    right: 20.0,
                                    top: 5.0,
                                    bottom: 60.0,
                                  ),
                                  child: Form(
                                    key: _passwordFormKey,
                                    child: TextFormField(
                                      //key: _formKey,
                                      validator: (value) {
                                        if (value.isEmpty)
                                          return 'Please fill this field';
                                        else if(value.length < 6)
                                          return 'Too short to be a Password';
                                      },
                                      obscureText: isTextHidden,
                                      decoration: InputDecoration(
                                        icon: Icon(
                                          Icons.lock,
                                          color: Colors.black,
                                        ),
                                        border: InputBorder.none,
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.remove_red_eye),
                                          color: eyeIconColor,
                                          onPressed: () {
                                            isTextHidden = !isTextHidden;
                                            eyeIconColor = isTextHidden
                                                ? Colors.black
                                                : Colors.grey;
                                          },
                                        ),
                                        hintText: 'Password',
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height*_loginPosition,
                      height: MediaQuery.of(context).size.height*0.1,
                      width: MediaQuery.of(context).size.width*1,
                      child: InkWell(
                        onTap: () {
                          if (_emailFormKey.currentState.validate() && _passwordFormKey.currentState.validate())
                            Navigator.of(context).pushReplacementNamed('userDetails');
                          else
                            setState(() {
                              _loginPosition = 0.37;
                            });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 80.0,
                            vertical: 8.0,
                          ),
                          child: new Container(
                            height: 50.0,
                            decoration: new BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.grey[800],
                                  offset: Offset(0.5, 1.0),
                                  blurRadius: 2.0,
                                ),
                              ],
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFF85685),
                                  Color(0xFFFBA767)
                                ],
                              ),
                              borderRadius:
                              new BorderRadius.circular(10.0),
                            ),
                            child: new Center(
                              child: new Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
