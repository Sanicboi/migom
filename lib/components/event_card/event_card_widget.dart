import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'event_card_model.dart';
export 'event_card_model.dart';

class EventCardWidget extends StatefulWidget {
  const EventCardWidget({
    Key? key,
    required this.eventDoc,
  }) : super(key: key);

  final EventsRecord? eventDoc;

  @override
  _EventCardWidgetState createState() => _EventCardWidgetState();
}

class _EventCardWidgetState extends State<EventCardWidget> {
  late EventCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.eventDoc!.host!),
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
        final containerUsersRecord = snapshot.data!;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        if (widget.eventDoc!.host == currentUserReference) {
                          context.goNamed('MyProfile');
                        } else {
                          context.pushNamed(
                            'UsersProfile',
                            queryParams: {
                              'user': serializeParam(
                                containerUsersRecord,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'user': containerUsersRecord,
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
                          containerUsersRecord.photoUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                  if (widget.eventDoc!.host ==
                                      currentUserReference) {
                                    context.goNamed('MyProfile');
                                  } else {
                                    context.pushNamed(
                                      'UsersProfile',
                                      queryParams: {
                                        'user': serializeParam(
                                          containerUsersRecord,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'user': containerUsersRecord,
                                      },
                                    );
                                  }
                                },
                                child: Text(
                                  containerUsersRecord.tag,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        color: FlutterFlowTheme.of(context)
                                            .migomBlack,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: false,
                                        lineHeight: 1.3,
                                      ),
                                ),
                              ),
                              if (containerUsersRecord.isVerified)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 3.0, 8.0, 3.0),
                                      child: Text(
                                        'PRO',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'SF Pro Display',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .migomWhite,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          Text(
                            dateTimeFormat('yMMMd', widget.eventDoc!.date!),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'SF Pro Display',
                                  color: FlutterFlowTheme.of(context)
                                      .migomSecondaryText,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: MediaQuery.of(context).size.height * 0.223,
                    child: Stack(
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: FlutterFlowExpandedImageView(
                                  image: Image.network(
                                    widget.eventDoc!.fotoPath,
                                    fit: BoxFit.contain,
                                  ),
                                  allowRotation: false,
                                  tag: widget.eventDoc!.fotoPath,
                                  useHeroAnimation: true,
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: widget.eventDoc!.fotoPath,
                            transitionOnUserGestures: true,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.network(
                                widget.eventDoc!.fotoPath,
                                width: MediaQuery.of(context).size.width * 0.95,
                                height:
                                    MediaQuery.of(context).size.height * 0.223,
                                fit: BoxFit.cover,
                              ),
                            ),
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
                                            widget.eventDoc!.price *
                                                (100 -
                                                    valueOrDefault<int>(
                                                      widget
                                                          .eventDoc!.discounts,
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
                                            widget.eventDoc!.price,
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
                                          '-${widget.eventDoc!.discounts.toString()} %',
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
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: ExpandableNotifier(
                      initialExpanded: false,
                      child: ExpandablePanel(
                        header: Text(
                          functions.toCaps(widget.eventDoc!.name),
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Ermilov',
                                color: FlutterFlowTheme.of(context).tertiary,
                                useGoogleFonts: false,
                                lineHeight: 1.3,
                              ),
                        ),
                        collapsed: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: Text(
                            widget.eventDoc!.description.maybeHandleOverflow(
                              maxChars: 60,
                              replacement: '…',
                            ),
                            maxLines: 2,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'SF Pro Display',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontSize: 18.0,
                                  useGoogleFonts: false,
                                  lineHeight: 1.3,
                                ),
                          ),
                        ),
                        expanded: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                widget.eventDoc!.description,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'SF Pro Display',
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      fontSize: 18.0,
                                      useGoogleFonts: false,
                                      lineHeight: 1.3,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        theme: ExpandableThemeData(
                          tapHeaderToExpand: true,
                          tapBodyToExpand: true,
                          tapBodyToCollapse: true,
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          hasIcon: false,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(
                        'SingleEventPage',
                        queryParams: {
                          'ev': serializeParam(
                            widget.eventDoc,
                            ParamType.Document,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'ev': widget.eventDoc,
                        },
                      );
                    },
                    text: 'ХОЧУ ПОЙТИ!',
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
                          ),
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).migomPrimary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
