import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuhuWidget extends StatefulWidget {
  SuhuWidget({Key key}) : super(key: key);

  @override
  _SuhuWidgetState createState() => _SuhuWidgetState();
}

class _SuhuWidgetState extends State<SuhuWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF099683),
        iconTheme: IconThemeData(color: Color(0xFFFFFBFB)),
        automaticallyImplyLeading: true,
        title: Text(
          'Suhu',
          style: FlutterFlowTheme.title2.override(
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
    );
  }
}
