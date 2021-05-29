import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TambahperangkatWidget extends StatefulWidget {
  TambahperangkatWidget({Key key}) : super(key: key);

  @override
  _TambahperangkatWidgetState createState() => _TambahperangkatWidgetState();
}

class _TambahperangkatWidgetState extends State<TambahperangkatWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF099683),
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(87, 190, 0, 0),
                  child: Image.asset(
                    'assets/images/baseline_online_prediction_black_48.png',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            Text(
              'Tidak ada perangkat yang terhubung, mohon tambahkan',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.subtitle2.override(
                fontFamily: 'Roboto',
                color: Color(0xFF260000),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: 'Tambahkan',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: Color(0xFF099683),
                  textStyle: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
