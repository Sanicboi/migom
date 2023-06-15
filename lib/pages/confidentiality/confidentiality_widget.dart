import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'confidentiality_model.dart';
export 'confidentiality_model.dart';

class ConfidentialityWidget extends StatefulWidget {
  const ConfidentialityWidget({Key? key}) : super(key: key);

  @override
  _ConfidentialityWidgetState createState() => _ConfidentialityWidgetState();
}

class _ConfidentialityWidgetState extends State<ConfidentialityWidget> {
  late ConfidentialityModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfidentialityModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).migomBGGrey,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 63.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).migomWhite,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 44.0,
                          fillColor: Color(0xFFF5F5F5),
                          icon: Icon(
                            Icons.chevron_left,
                            color: FlutterFlowTheme.of(context).migomBlack,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.safePop();
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'КОНФИДЕНЦИАЛЬНОСТЬ',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Ermilov',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                    lineHeight: 1.3,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 0.0, 0.0),
                      child: Text(
                        'ПОДЕЛИТЬСЯ С ОСТАЛЬНЫМИ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'SF Pro Display',
                              color: FlutterFlowTheme.of(context)
                                  .migomSecondaryText,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: false,
                              lineHeight: 1.3,
                            ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).migomWhite,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 0.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Switch(
                                value: _model.switchValue ??= false,
                                onChanged: (newValue) async {
                                  setState(
                                      () => _model.switchValue = newValue!);
                                  if (newValue!) {
                                    final usersUpdateData =
                                        createUsersRecordData(
                                      showEvents: _model.switchValue,
                                    );
                                    await currentUserReference!
                                        .update(usersUpdateData);
                                  }
                                },
                                activeColor: Color(0xFFF8F8FA),
                                activeTrackColor: Color(0xFFF93448),
                                inactiveTrackColor: Color(0xFFE1E1E1),
                                inactiveThumbColor: Color(0xFFF93448),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'ПОСЕЩЁННЫМИ\nМЕРОПРИЯТИЯМИ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Ermilov',
                                        color: FlutterFlowTheme.of(context)
                                            .migomBlack,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                        lineHeight: 1.3,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed('eula');
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffffffff),
                      ),
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ПОЛИТИКА\nКОНФИДЕНЦИАЛЬНОСТИ',
                              style: TextStyle(
                                fontFamily: 'Ermilov',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                height: 1.3,
                                color: Color(0xff09090a),
                              ),
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              size: 24,
                            ),
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed('eula2');
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffffffff),
                      ),
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'УСЛОВИЯ\nИСПОЛЬЗОВАНИЯ',
                              style: TextStyle(
                                fontFamily: 'Ermilov',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                height: 1.3,
                                color: Color(0xff09090a),
                              ),
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              size: 24,
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
