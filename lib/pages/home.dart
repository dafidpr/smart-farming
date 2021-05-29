import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:smart_farming_app/pages/login.dart';
import 'package:smart_farming_app/api/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name, serialNumber;
  var statusCondition;

  @override
  void initState() {
    _loadUserData();
    super.initState();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));

    if (user != null) {
      setState(() {
        name = user['name'];
        serialNumber = user['serial_number'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Farming App'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hi, $name' + ' - my serial number : $serialNumber',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Center(
              child: RaisedButton(
                elevation: 10,
                onPressed: () {
                  logout();
                },
                color: Colors.teal,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text('Logout'),
              ),
            ),
            Center(
              child: RaisedButton(
                elevation: 10,
                onPressed: () {
                  onOffLamp();
                },
                color: Colors.teal,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text('$statusCondition'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void logout() async {
    var res = await Network().getData('/logout');
    var body = json.decode(res.body);

    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }

  void onOffLamp() async {
    var data = {
      'serial_number': serialNumber,
    };

    var res = await Network().sendPostData(data, '/lamp-status-update');
    var body = json.decode(res.body);
    print(body);
    if (body['success']) {
      setState(() {
        if (body['condition'] == 1) {
          statusCondition = 'Off';
        } else {
          statusCondition = 'On';
        }
      });
    }
  }
}
