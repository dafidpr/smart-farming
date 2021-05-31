import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TampilanakunWidget extends StatefulWidget {
  TampilanakunWidget({Key key}) : super(key: key);

  @override
  _TampilanakunWidgetState createState() => _TampilanakunWidgetState();
}

class _TampilanakunWidgetState extends State<TampilanakunWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF099683),
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: true,
        title: Text(
          'Akun',
          style: FlutterFlowTheme.title3.override(
            fontFamily: 'Poppins',
            color: Color(0xFFFFFBFB),
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(38, 35, 0, 0),
          child: Container(
            width: 300,
            height: 150,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
                  child: Text(
                    'Foto Profil',
                    style: FlutterFlowTheme.title3.override(
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(230, 6, 0, 0),
                  child: Container(
                    width: 60,
                    height: 60,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/Untitled-1.png',
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.84, 0.57),
                  child: Text(
                    'Nama',
                    style: FlutterFlowTheme.title3.override(
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.9, 0.59),
                  child: Text(
                    'Rohman',
                    style: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Roboto',
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
