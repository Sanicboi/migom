import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'safety_model.dart';
export 'safety_model.dart';

class SafetyWidget extends StatefulWidget {
  const SafetyWidget({Key? key}) : super(key: key);

  @override
  _SafetyWidgetState createState() => _SafetyWidgetState();
}

class _SafetyWidgetState extends State<SafetyWidget> {
  late SafetyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SafetyModel());
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
        backgroundColor: Color(0xFFF5F5F5),
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
                          'БЕЗОПАСНОСТЬ',
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
                // Padding(
                //   padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                //   child: Container(
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(15.0),
                //     ),
                //     child: Padding(
                //       padding: EdgeInsetsDirectional.fromSTEB(
                //           20.0, 20.0, 20.0, 20.0),
                //       child: Row(
                //         mainAxisSize: MainAxisSize.max,
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: [
                //           Icon(
                //             Icons.qr_code,
                //             color: Colors.black,
                //             size: 24.0,
                //           ),
                //           Expanded(
                //             child: Padding(
                //               padding: EdgeInsetsDirectional.fromSTEB(
                //                   10.0, 0.0, 0.0, 0.0),
                //               child: Text(
                //                 'ДВУХШАГОВАЯ ПРОВЕРКА',
                //                 style: FlutterFlowTheme.of(context)
                //                     .bodyMedium
                //                     .override(
                //                       fontFamily: 'Ermilov',
                //                       fontSize: 18.0,
                //                       fontWeight: FontWeight.bold,
                //                       useGoogleFonts: false,
                //                     ),
                //               ),
                //             ),
                //           ),
                //           Icon(
                //             Icons.arrow_forward_ios_outlined,
                //             color: Colors.black,
                //             size: 24.0,
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 66.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 20.0, 20.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.black,
                            size: 24.0,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'ИЗМЕНИТЬ НОМЕР',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Ermilov',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios_outlined,
                            ),
                            color: Colors.black,
                            onPressed: () {
                              context.pushNamed('changeinfo');
                            },
                            padding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                //   child: Container(
                //     width: double.infinity,
                //     height: 66.0,
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(15.0),
                //     ),
                //     child: Padding(
                //       padding: EdgeInsetsDirectional.fromSTEB(
                //           20.0, 20.0, 20.0, 20.0),
                //       child: Row(
                //         mainAxisSize: MainAxisSize.max,
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: [
                //           Icon(
                //             Icons.fiber_pin_outlined,
                //             color: Colors.black,
                //             size: 24.0,
                //           ),
                //           Expanded(
                //             child: Padding(
                //               padding: EdgeInsetsDirectional.fromSTEB(
                //                   10.0, 0.0, 0.0, 0.0),
                //               child: Text(
                //                 'ИЗМЕНИТЬ ПАРОЛЬ',
                //                 style: FlutterFlowTheme.of(context)
                //                     .bodyMedium
                //                     .override(
                //                       fontFamily: 'Ermilov',
                //                       fontSize: 18.0,
                //                       fontWeight: FontWeight.bold,
                //                       useGoogleFonts: false,
                //                     ),
                //               ),
                //             ),
                //           ),
                //           Icon(
                //             Icons.arrow_forward_ios_outlined,
                //             color: Colors.black,
                //             size: 24.0,
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 88.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 20.0, 20.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.trashCan,
                            color: Color(0xFFFF0922),
                            size: 24.0,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'УДАЛИТЬ УЧЕТНУЮ \nЗАПИСЬ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Ermilov',
                                            color: Color(0xFFFF0922),
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                            size: 24.0,
                          ),
                        ],
                      ),
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
