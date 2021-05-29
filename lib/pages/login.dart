import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:smart_farming_app/api/api.dart';
import 'package:smart_farming_app/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_farming_app/pages/register_widget.dart';
import 'package:smart_farming_app/pages/theme.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var username;
  var password;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(3, 40, 140, 50),
                child: Text(
                  'Selamat datang,\nSmart Farming App!',
                  style: GoogleFonts.poppins(),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text('Masukan username dan password',
                              style: GoogleFonts.raleway(
                                  color: Color(0xFF0D1724),
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                      key: _formKey,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: 330,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Color(0xFFE6E6E6),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                child: TextFormField(
                                    //controller: textController1,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Username',
                                      labelStyle: blackTextFont2.copyWith(
                                          color: Color(0xFF8B97A2),
                                          fontWeight: FontWeight.w500),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    validator: (usernameValue) {
                                      if (usernameValue.isEmpty) {
                                        return 'Please enter username';
                                      }
                                      username = usernameValue;
                                      return null;
                                    },
                                    style: GoogleFonts.raleway(
                                        color: Color(0xFF8B97A2),
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: 330,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Color(0xFFE6E6E6),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                child: TextFormField(
                                    //controller: textController1,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      labelStyle: blackTextFont2.copyWith(
                                          color: Color(0xFF8B97A2),
                                          fontWeight: FontWeight.w500),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    validator: (passwordValue) {
                                      if (passwordValue.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      password = passwordValue;
                                      return null;
                                    },
                                    style: GoogleFonts.raleway(
                                        color: Color(0xFF8B97A2),
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, -1),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(3, 10, 0, 2),
                        child: InkWell(
                          onTap: () {
                            if (_formKey.currentState.validate()) {
                              _login();
                            }
                          },
                          child: Container(
                            width: 80,
                            height: 40,
                            margin: EdgeInsets.all(25),
                            decoration: BoxDecoration(
                              color: Color(0xFF099683),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text("Masuk",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => RegisterWidget()));
                  },
                  // Padding(
                  //   padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                  child: Text('Buat akun baru', style: GoogleFonts.poppins()),
                  //  )
                ),
              ),
            ],
          ),
        ));
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });
    var data = {'username': username, 'password': password};

    var res = await Network().authData(data, '/login');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['_token']));
      localStorage.setString('user', json.encode(body['data']));
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => Home()),
      );
    } else {
      _showMsg(body['messages']);
    }

    setState(() {
      _isLoading = false;
    });
  }
}
