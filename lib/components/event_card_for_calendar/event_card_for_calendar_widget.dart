import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'event_card_for_calendar_model.dart';
import 'package:share_plus/share_plus.dart';
export 'event_card_for_calendar_model.dart';

class EventCardForCalendarWidget extends StatefulWidget {
  const EventCardForCalendarWidget({
    Key? key,
    required this.event,
  }) : super(key: key);

  final EventsRecord? event;

  @override
  _EventCardForCalendarWidgetState createState() =>
      _EventCardForCalendarWidgetState();
}

class _EventCardForCalendarWidgetState
    extends State<EventCardForCalendarWidget> {
  late EventCardForCalendarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventCardForCalendarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<int>(
      future: queryRegistrationsRecordCount(
        queryBuilder: (registrationsRecord) => registrationsRecord
            .where('event', isEqualTo: widget.event!.reference),
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
        int containerCount = snapshot.data!;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                StreamBuilder<UsersRecord>(
                  stream: UsersRecord.getDocument(widget.event!.host!),
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
                    final rowUsersRecord = snapshot.data!;
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (widget.event!.host == currentUserReference) {
                              context.goNamed('MyProfile');
                            } else {
                              context.pushNamed(
                                'UsersProfile',
                                queryParams: {
                                  'user': serializeParam(
                                    rowUsersRecord,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'user': rowUsersRecord,
                                },
                              );
                            }
                          },
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              rowUsersRecord.photoUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (widget.event!.host ==
                                                currentUserReference) {
                                              context.goNamed('MyProfile');
                                            } else {
                                              context.pushNamed(
                                                'UsersProfile',
                                                queryParams: {
                                                  'user': serializeParam(
                                                    rowUsersRecord,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'user': rowUsersRecord,
                                                },
                                              );
                                            }
                                          },
                                          child: Text(
                                            rowUsersRecord.tag,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'SF Pro Display',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .migomBlack,
                                                  fontSize: 16.0,
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.3,
                                                ),
                                          ),
                                        ),
                                        if (widget.event!.isAgeRestricted)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 44.0,
                                              height: 22.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .migomPrimary,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  widget.event!.restriction,
                                                  '18+',
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .migomWhite,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    Text(
                                      widget.event!.hasLimit
                                          ? 'Мест:\n${functions.getDifference(widget.event!.limit, containerCount).toString()} из ${widget.event!.limit.toString()}'
                                          : 'Мест:\nне ограничено',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Display',
                                            color: FlutterFlowTheme.of(context)
                                                .migomBlack,
                                            fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width >
                                                    360
                                                ? 16
                                                : 12,
                                            useGoogleFonts: false,
                                            lineHeight: 1.3,
                                          ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${dateTimeFormat('d/M/y', widget.event!.date)} в ${dateTimeFormat('Hm', widget.event!.date)}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        color: FlutterFlowTheme.of(context)
                                            .migomSecondaryText,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Container(
                    width: 335.0,
                    height: 188.0,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                            widget.event!.fotoPath,
                            width: 335.0,
                            height: 188.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 5.0),
                                child: Container(
                                  height: 22.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF93448),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '${formatNumber(
                                            valueOrDefault<double>(
                                                  widget.event!.price,
                                                  0.0,
                                                ) *
                                                (100 -
                                                    valueOrDefault<int>(
                                                      widget.event!.discounts,
                                                      0,
                                                    )) /
                                                100,
                                            formatType: FormatType.custom,
                                            format: '0',
                                            locale: '',
                                          )} ₽',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: Color(0xFFF8F8FA),
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: Text(
                                          '${formatNumber(
                                            widget.event!.price,
                                            formatType: FormatType.custom,
                                            format: '0',
                                            locale: '',
                                          )} ₽',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: Color(0x80FFFFFF),
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 5.0),
                                child: Container(
                                  width: 58.0,
                                  height: 22.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFDE31),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          '-${valueOrDefault<String>(
                                            widget.event!.discounts.toString(),
                                            '0',
                                          )} %',
                                          '-0 %',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'SF Pro Display',
                                              color: Color(0xFF09090A),
                                              fontSize: 16.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ],
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
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    widget.event!.name.toUpperCase(),
                    style: TextStyle(
                      color: Color(0xff09090a),
                      fontSize: 18,
                      fontFamily: 'Ermilov',
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(
                        'registration_event',
                        queryParams: {
                          'ev': serializeParam(
                            widget.event,
                            ParamType.Document,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'ev': widget.event,
                        },
                      );
                    },
                    text: 'ЗАПИСАТЬСЯ',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).migomWhite,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily: 'Ermilov',
                            color: FlutterFlowTheme.of(context).migomPrimary,
                            fontSize: 18.0,
                            useGoogleFonts: false,
                            lineHeight: 1.3,
                          ),
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: FFButtonWidget(
                          onPressed: () {
                            Share.share(
                                'Пойдем со мной на мероприятие\n\n"${widget.event!.name}"\n\nhttp://95.163.240.236/invite/${widget.event!.reference.id}',
                                subject: "Migom");
                          },
                          text: 'Пригласить друга',
                          icon: Icon(
                            Icons.add_circle_outline,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            width: 227.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFFE1E1E1),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'SF Pro Display',
                                  color: Color(0xFF09090A),
                                  fontSize: 16.0,
                                  useGoogleFonts: false,
                                ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: StreamBuilder<UsersRecord>(
                        stream: UsersRecord.getDocument(widget.event!.host!),
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
                          final iconButtonUsersRecord = snapshot.data!;
                          return FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 44.0,
                            fillColor: Color(0xFFF5F5F5),
                            icon: FaIcon(
                              FontAwesomeIcons.user,
                              color: Color(0xFF09090A),
                              size: 24.0,
                            ),
                            onPressed: () async {
                              if (widget.event!.host == currentUserReference) {
                                context.goNamed('MyProfile');
                              } else {
                                context.pushNamed(
                                  'UsersProfile',
                                  queryParams: {
                                    'user': serializeParam(
                                      iconButtonUsersRecord,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'user': iconButtonUsersRecord,
                                  },
                                );
                              }
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 44.0,
                        fillColor: Color(0xFFF5F5F5),
                        icon: Icon(
                          Icons.chat_outlined,
                          color: Color(0xFF09090A),
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.pushNamed('support');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
