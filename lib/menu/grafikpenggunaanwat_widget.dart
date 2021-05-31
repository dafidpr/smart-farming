import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GrafikpenggunaanwatWidget extends StatefulWidget {
  GrafikpenggunaanwatWidget({Key key}) : super(key: key);

  @override
  _GrafikpenggunaanwatWidgetState createState() =>
      _GrafikpenggunaanwatWidgetState();
}

class _GrafikpenggunaanwatWidgetState extends State<GrafikpenggunaanwatWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF099683),
        iconTheme: IconThemeData(color: FlutterFlowTheme.tertiaryColor),
        automaticallyImplyLeading: true,
        title: Text(
          'Penggunaan Watt',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.title3.override(
            fontFamily: 'Poppins',
            color: Color(0xFFFFFBFB),
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
    );
  }
}
