import '/backend/backend.dart';
import '/components/event_card/event_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onlain_model.dart';
export 'onlain_model.dart';

class OnlainWidget extends StatefulWidget {
  const OnlainWidget({Key? key}) : super(key: key);

  @override
  _OnlainWidgetState createState() => _OnlainWidgetState();
}

class _OnlainWidgetState extends State<OnlainWidget> {
  late OnlainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnlainModel());
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
            child: SingleChildScrollView(
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Онлайн',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
                  StreamBuilder<List<EventsRecord>>(
                    stream: queryEventsRecord(
                      queryBuilder: (eventsRecord) =>
                          eventsRecord.where('isOnline', isEqualTo: true),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        );
                      }
                      List<EventsRecord> columnEventsRecordList =
                          snapshot.data!;
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(columnEventsRecordList.length,
                            (columnIndex) {
                          final columnEventsRecord =
                              columnEventsRecordList[columnIndex];
                          return EventCardWidget(
                            key: Key(
                                'Keye3q_${columnIndex}_of_${columnEventsRecordList.length}'),
                            eventDoc: columnEventsRecord,
                          );
                        }),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
