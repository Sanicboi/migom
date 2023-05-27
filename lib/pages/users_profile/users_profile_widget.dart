import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'users_profile_model.dart';
export 'users_profile_model.dart';

class UsersProfileWidget extends StatefulWidget {
  const UsersProfileWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UsersRecord? user;

  @override
  _UsersProfileWidgetState createState() => _UsersProfileWidgetState();
}

class _UsersProfileWidgetState extends State<UsersProfileWidget> {
  late UsersProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsersProfileModel());
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

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.user!.reference),
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
        final usersProfileUsersRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryText,
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Image.network(
                              usersProfileUsersRecord.image2,
                              width: double.infinity,
                              height: 124.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 100.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Container(
                                  width: 100.0,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 60.0, 20.0, 20.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  if (widget.user!.isVerified)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 48.0,
                                                        height: 22.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFF93448),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      90.0),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          'PRO',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                fontSize: 16.0,
                                                                useGoogleFonts:
                                                                    false,
                                                                lineHeight: 1.3,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  Text(
                                                    usersProfileUsersRecord
                                                        .displayName,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'SF Pro Display',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 24.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: Text(
                                                  '@${usersProfileUsersRecord.tag}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .migomSecondaryText,
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.3,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 0.0),
                                          child: Text(
                                            widget.user!.description,
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'SF Pro Display',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .migomSecondaryText,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.3,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      formatNumber(
                                                        usersProfileUsersRecord
                                                            .friends.length,
                                                        formatType:
                                                            FormatType.compact,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .migomBlack,
                                                                fontSize: 20.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: AutoSizeText(
                                                        'друзей',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'SF Pro Display',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .migomSecondaryText,
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              useGoogleFonts:
                                                                  false,
                                                              lineHeight: 1.3,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      formatNumber(
                                                        usersProfileUsersRecord
                                                            .subscribers.length,
                                                        formatType:
                                                            FormatType.compact,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .migomBlack,
                                                                fontSize: 20.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: AutoSizeText(
                                                        'подписчиков',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'SF Pro Display',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .migomSecondaryText,
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              useGoogleFonts:
                                                                  false,
                                                              lineHeight: 1.3,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    FutureBuilder<int>(
                                                      future:
                                                          queryEventsRecordCount(
                                                        queryBuilder: (eventsRecord) =>
                                                            eventsRecord.where(
                                                                'host',
                                                                isEqualTo:
                                                                    usersProfileUsersRecord
                                                                        .reference),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        int textCount =
                                                            snapshot.data!;
                                                        return Text(
                                                          valueOrDefault<
                                                              String>(
                                                            formatNumber(
                                                              textCount,
                                                              formatType:
                                                                  FormatType
                                                                      .compact,
                                                            ),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .migomBlack,
                                                                fontSize: 20.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        );
                                                      },
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: AutoSizeText(
                                                        'публикаций',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'SF Pro Display',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .migomSecondaryText,
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              useGoogleFonts:
                                                                  false,
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
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        FFButtonWidget(
                                                      onPressed: () async {
                                                        if ((currentUserDocument
                                                                        ?.subscriptions
                                                                        ?.toList() ??
                                                                    [])
                                                                .contains(
                                                                    usersProfileUsersRecord
                                                                        .reference) &&
                                                            usersProfileUsersRecord
                                                                .subscribers
                                                                .contains(
                                                                    currentUserReference)) {
                                                          if (usersProfileUsersRecord
                                                              .subscriptions
                                                              .contains(
                                                                  currentUserReference)) {
                                                            final usersUpdateData1 =
                                                                {
                                                              'subscribers':
                                                                  FieldValue
                                                                      .arrayRemove([
                                                                currentUserReference
                                                              ]),
                                                              'friends': FieldValue
                                                                  .arrayRemove([
                                                                currentUserReference
                                                              ]),
                                                            };
                                                            await usersProfileUsersRecord
                                                                .reference
                                                                .update(
                                                                    usersUpdateData1);

                                                            final usersUpdateData2 =
                                                                {
                                                              'subscriptions':
                                                                  FieldValue
                                                                      .arrayRemove([
                                                                usersProfileUsersRecord
                                                                    .reference
                                                              ]),
                                                              'friends': FieldValue
                                                                  .arrayRemove([
                                                                usersProfileUsersRecord
                                                                    .reference
                                                              ]),
                                                            };
                                                            await currentUserReference!
                                                                .update(
                                                                    usersUpdateData2);
                                                          } else {
                                                            final usersUpdateData3 =
                                                                {
                                                              'subscribers':
                                                                  FieldValue
                                                                      .arrayRemove([
                                                                currentUserReference
                                                              ]),
                                                            };
                                                            await usersProfileUsersRecord
                                                                .reference
                                                                .update(
                                                                    usersUpdateData3);

                                                            final usersUpdateData4 =
                                                                {
                                                              'subscriptions':
                                                                  FieldValue
                                                                      .arrayRemove([
                                                                usersProfileUsersRecord
                                                                    .reference
                                                              ]),
                                                            };
                                                            await currentUserReference!
                                                                .update(
                                                                    usersUpdateData4);
                                                          }
                                                        } else {
                                                          final usersUpdateData5 =
                                                              {
                                                            'subscriptions':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              usersProfileUsersRecord
                                                                  .reference
                                                            ]),
                                                          };
                                                          await currentUserReference!
                                                              .update(
                                                                  usersUpdateData5);
                                                          if (usersProfileUsersRecord
                                                              .subscriptions
                                                              .contains(
                                                                  currentUserReference)) {
                                                            final usersUpdateData6 =
                                                                {
                                                              'subscriptions':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                usersProfileUsersRecord
                                                                    .reference
                                                              ]),
                                                              'friends': FieldValue
                                                                  .arrayUnion([
                                                                usersProfileUsersRecord
                                                                    .reference
                                                              ]),
                                                            };
                                                            await currentUserReference!
                                                                .update(
                                                                    usersUpdateData6);

                                                            final usersUpdateData7 =
                                                                {
                                                              'subscribers':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                currentUserReference
                                                              ]),
                                                              'friends': FieldValue
                                                                  .arrayUnion([
                                                                currentUserReference
                                                              ]),
                                                            };
                                                            await usersProfileUsersRecord
                                                                .reference
                                                                .update(
                                                                    usersUpdateData7);
                                                          } else {
                                                            final usersUpdateData8 =
                                                                {
                                                              'subscriptions':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                usersProfileUsersRecord
                                                                    .reference
                                                              ]),
                                                            };
                                                            await currentUserReference!
                                                                .update(
                                                                    usersUpdateData8);

                                                            final usersUpdateData9 =
                                                                {
                                                              'subscribers':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                currentUserReference
                                                              ]),
                                                            };
                                                            await usersProfileUsersRecord
                                                                .reference
                                                                .update(
                                                                    usersUpdateData9);
                                                          }

                                                          triggerPushNotification(
                                                            notificationTitle:
                                                                'Подписки',
                                                            notificationText:
                                                                'На вас подписался @${valueOrDefault(currentUserDocument?.tag, '')}',
                                                            notificationSound:
                                                                'default',
                                                            userRefs: [
                                                              widget.user!
                                                                  .reference
                                                            ],
                                                            initialPageName:
                                                                'HomePage',
                                                            parameterData: {},
                                                          );
                                                        }

                                                        setState(() {});
                                                      },
                                                      text: (currentUserDocument
                                                                          ?.subscriptions
                                                                          ?.toList() ??
                                                                      [])
                                                                  .contains(
                                                                      usersProfileUsersRecord
                                                                          .reference) &&
                                                              usersProfileUsersRecord
                                                                  .subscribers
                                                                  .contains(
                                                                      currentUserReference)
                                                          ? 'Вы подписаны'
                                                          : 'Подписаться',
                                                      icon: Icon(
                                                        Icons.person_add_alt,
                                                        color: (currentUserDocument
                                                                            ?.subscriptions
                                                                            ?.toList() ??
                                                                        [])
                                                                    .contains(
                                                                        usersProfileUsersRecord
                                                                            .reference) &&
                                                                usersProfileUsersRecord
                                                                    .subscribers
                                                                    .contains(
                                                                        currentUserReference)
                                                            ? Color(0xFFE1E1E1)
                                                            : Colors.white,
                                                        size: 15.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 155.0,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color: (currentUserDocument
                                                                            ?.subscriptions
                                                                            ?.toList() ??
                                                                        [])
                                                                    .contains(
                                                                        usersProfileUsersRecord
                                                                            .reference) &&
                                                                usersProfileUsersRecord
                                                                    .subscribers
                                                                    .contains(
                                                                        currentUserReference)
                                                            ? Color(0xFFE1E1E1)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'SF Pro Display',
                                                                  color: (currentUserDocument?.subscriptions?.toList() ?? []).contains(usersProfileUsersRecord
                                                                              .reference) &&
                                                                          usersProfileUsersRecord.subscribers.contains(
                                                                              currentUserReference)
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary
                                                                      : Colors
                                                                          .white,
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      false,
                                                                  lineHeight:
                                                                      1.3,
                                                                ),
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      showLoadingIndicator:
                                                          false,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        FFButtonWidget(
                                                      onPressed: () async {
                                                        if ((currentUserDocument
                                                                    ?.recommendedUsers
                                                                    ?.toList() ??
                                                                [])
                                                            .contains(
                                                                usersProfileUsersRecord
                                                                    .reference)) {
                                                          final usersUpdateData1 =
                                                              {
                                                            'recommendedUsers':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              usersProfileUsersRecord
                                                                  .reference
                                                            ]),
                                                          };
                                                          await currentUserReference!
                                                              .update(
                                                                  usersUpdateData1);
                                                        } else {
                                                          final usersUpdateData2 =
                                                              {
                                                            'recommendedUsers':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              usersProfileUsersRecord
                                                                  .reference
                                                            ]),
                                                          };
                                                          await currentUserReference!
                                                              .update(
                                                                  usersUpdateData2);
                                                        }
                                                      },
                                                      text: (currentUserDocument
                                                                      ?.recommendedUsers
                                                                      ?.toList() ??
                                                                  [])
                                                              .contains(
                                                                  usersProfileUsersRecord
                                                                      .reference)
                                                          ? 'Рекомендован'
                                                          : 'Рекомендовать',
                                                      options: FFButtonOptions(
                                                        width: 155.0,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color: (currentUserDocument
                                                                        ?.recommendedUsers
                                                                        ?.toList() ??
                                                                    [])
                                                                .contains(
                                                                    usersProfileUsersRecord
                                                                        .reference)
                                                            ? Color(0xFFE1E1E1)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .accent4,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'SF Pro Display',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .migomBlack,
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
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
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 45.0, 0.0, 0.0),
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/images/belyi-sveza-800x800.webp',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 0.0),
                              child: Container(
                                width: 90.0,
                                height: 90.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  usersProfileUsersRecord.photoUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 0.0, 0.0),
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
                        ],
                      ),
                    ),
                    StreamBuilder<List<RegistrationsRecord>>(
                      stream: queryRegistrationsRecord(
                        queryBuilder: (registrationsRecord) =>
                            registrationsRecord
                                .where('visited', isEqualTo: true)
                                .where('user', isEqualTo: currentUserReference)
                                .where('host',
                                    isEqualTo: widget.user!.reference),
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
                        List<RegistrationsRecord>
                            containerRegistrationsRecordList = snapshot.data!;
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Visibility(
                            visible:
                                containerRegistrationsRecordList.length > 0,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'ПОСЕЩЁННЫЕ МЕРОПРИЯТИЯ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Ermilov',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .migomBlack,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                              lineHeight: 1.3,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final recomented =
                                                containerRegistrationsRecordList
                                                    .toList();
                                            return SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    recomented.length,
                                                    (recomentedIndex) {
                                                  final recomentedItem =
                                                      recomented[
                                                          recomentedIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 4.0,
                                                                4.0, 4.0),
                                                    child: StreamBuilder<
                                                        EventsRecord>(
                                                      stream: EventsRecord
                                                          .getDocument(
                                                              recomentedItem
                                                                  .event!),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final containerEventsRecord =
                                                            snapshot.data!;
                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Stack(
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                    child: Image
                                                                        .network(
                                                                      containerEventsRecord
                                                                          .fotoPath,
                                                                      width:
                                                                          104.0,
                                                                      height:
                                                                          104.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            82.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          44.0,
                                                                      height:
                                                                          22.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .migomBlack,
                                                                        borderRadius:
                                                                            BorderRadius.circular(50.0),
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        dateTimeFormat(
                                                                            'Hm',
                                                                            containerEventsRecord.date!),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'SF Pro Display',
                                                                              color: FlutterFlowTheme.of(context).migomWhite,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Text(
                                                                containerEventsRecord
                                                                    .name,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'SF Pro Display',
                                                                      fontSize:
                                                                          16.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                              Text(
                                                                dateTimeFormat(
                                                                    'd/M/y',
                                                                    containerEventsRecord
                                                                        .date!),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'SF Pro Display',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .migomSecondaryText,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                }),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    if (usersProfileUsersRecord.recommendedUsers.length > 0)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'РЕКОМЕНДОВАННЫЕ ОРГАНИЗАТОРЫ',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Ermilov',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                        lineHeight: 1.3,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final recomUsers = widget
                                              .user!.recommendedUsers
                                              .toList();
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children:
                                                List.generate(recomUsers.length,
                                                    (recomUsersIndex) {
                                              final recomUsersItem =
                                                  recomUsers[recomUsersIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 5.0, 0.0),
                                                child:
                                                    StreamBuilder<UsersRecord>(
                                                  stream:
                                                      UsersRecord.getDocument(
                                                          recomUsersItem),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final containerUsersRecord =
                                                        snapshot.data!;
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'UsersProfile',
                                                          queryParams: {
                                                            'user':
                                                                serializeParam(
                                                              containerUsersRecord,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'user':
                                                                containerUsersRecord,
                                                          },
                                                        );
                                                      },
                                                      child: Container(
                                                        width: 76.0,
                                                        height: 98.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 76.0,
                                                              height: 76.0,
                                                              child: Stack(
                                                                children: [
                                                                  Container(
                                                                    width: 76.0,
                                                                    height:
                                                                        76.0,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Image
                                                                        .network(
                                                                      containerUsersRecord
                                                                          .photoUrl,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            56.2,
                                                                            56.7,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        ClipOval(
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            17.1,
                                                                        height:
                                                                            17.1,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Container(
                                                                              width: 9.5,
                                                                              height: 9.5,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFF4FF934),
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Text(
                                                              '@${containerUsersRecord.tag}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'SF Pro Display',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .migomBlack,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    StreamBuilder<List<EventsRecord>>(
                      stream: queryEventsRecord(
                        queryBuilder: (eventsRecord) => eventsRecord
                            .where('host', isEqualTo: widget.user!.reference),
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
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 50.0,
                                            height: 50.0,
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    widget.user!.photoUrl,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(35.61, 36.61,
                                                          0.0, 0.0),
                                                  child: Container(
                                                    width: 12.43,
                                                    height: 12.43,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  2.0,
                                                                  2.0,
                                                                  2.0,
                                                                  2.0),
                                                      child: Container(
                                                        width: 7.0,
                                                        height: 7.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFF4FF934),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      widget.user!.tag,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .migomBlack,
                                                                fontSize: 16.0,
                                                                useGoogleFonts:
                                                                    false,
                                                                lineHeight: 1.3,
                                                              ),
                                                    ),
                                                    if (widget.user!.isVerified)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 48.0,
                                                          height: 22.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .migomPrimary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        90.0),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'PRO',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'SF Pro Display',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent3,
                                                                  fontSize:
                                                                      16.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                  lineHeight:
                                                                      1.3,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                Text(
                                                  '${dateTimeFormat('d/M/y', columnEventsRecord.date)} в ${dateTimeFormat('Hm', columnEventsRecord.date)}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .migomSecondaryText,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 335.0,
                                        height: 188.0,
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                child: Image.network(
                                                  columnEventsRecord.fotoPath,
                                                  width: 335.0,
                                                  height: 188.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 5.0),
                                                    child: Container(
                                                      height: 22.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFF93448),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '${formatNumber(
                                                                columnEventsRecord
                                                                        .price *
                                                                    (100 -
                                                                        columnEventsRecord
                                                                            .discounts) /
                                                                    100,
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                format: '0',
                                                                locale: '',
                                                              )} ₽',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: Color(
                                                                        0xFFF8F8FA),
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: Text(
                                                              '${formatNumber(
                                                                columnEventsRecord
                                                                    .price,
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                format: '0',
                                                                locale: '',
                                                              )} ₽',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: Color(
                                                                        0x80FFFFFF),
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 5.0),
                                                    child: Container(
                                                      width: 58.0,
                                                      height: 22.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFFFDE31),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              '-${columnEventsRecord.discounts.toString()} %',
                                                              '-0 %',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'SF Pro Display',
                                                                  color: Color(
                                                                      0xFF09090A),
                                                                  fontSize:
                                                                      16.0,
                                                                  useGoogleFonts:
                                                                      false,
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            color: Colors.white,
                                            child: ExpandableNotifier(
                                              initialExpanded: false,
                                              child: ExpandablePanel(
                                                header: Text(
                                                  functions.toCaps(
                                                      columnEventsRecord.name),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'Ermilov',
                                                        color: Colors.black,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                collapsed: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Lorem ipsum dolor sit amet, consectetur adipiscing...',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          fontSize: 18.0,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.3,
                                                        ),
                                                  ),
                                                ),
                                                expanded: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      columnEventsRecord
                                                          .description,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                fontSize: 18.0,
                                                                useGoogleFonts:
                                                                    false,
                                                                lineHeight: 1.3,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                                theme: ExpandableThemeData(
                                                  tapHeaderToExpand: true,
                                                  tapBodyToExpand: true,
                                                  tapBodyToCollapse: true,
                                                  headerAlignment:
                                                      ExpandablePanelHeaderAlignment
                                                          .center,
                                                  hasIcon: true,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            context.pushNamed(
                                              'registration_event',
                                              queryParams: {
                                                'ev': serializeParam(
                                                  columnEventsRecord,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'ev': columnEventsRecord,
                                              },
                                            );
                                          },
                                          text: 'Хочу пойти!',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Colors.white,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Ermilov',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: false,
                                                ),
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 3.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
        );
      },
    );
  }
}
