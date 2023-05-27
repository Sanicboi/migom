import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'interese_model.dart';
export 'interese_model.dart';

class IntereseWidget extends StatefulWidget {
  const IntereseWidget({
    Key? key,
    required this.photo,
    required this.teg,
    required this.name,
    required this.photo2,
    required this.description,
  }) : super(key: key);

  final String? photo;
  final String? teg;
  final String? name;
  final String? photo2;
  final String? description;

  @override
  _IntereseWidgetState createState() => _IntereseWidgetState();
}

class _IntereseWidgetState extends State<IntereseWidget> {
  late IntereseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IntereseModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.interests =
            (currentUserDocument?.interests?.toList() ?? []).toList();
      });
    });
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  height: 63.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/images/Avatar.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'ВЫБЕРИТЕ СВОИ\nИНТЕРЕСЫ',
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'Ermilov',
                                      useGoogleFonts: false,
                                      lineHeight: 1.3,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F5F5),
                            shape: BoxShape.circle,
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 0.5,
                            buttonSize: 44.0,
                            fillColor: Color(0xFFF5F5F5),
                            icon: Icon(
                              Icons.search_sharp,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 24.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: StreamBuilder<List<InterestsRecord>>(
                          stream: queryInterestsRecord(),
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
                            List<InterestsRecord> gridViewInterestsRecordList =
                                snapshot.data!;
                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 12.0,
                                mainAxisSpacing: 20.0,
                                childAspectRatio: 0.69,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: gridViewInterestsRecordList.length,
                              itemBuilder: (context, gridViewIndex) {
                                final gridViewInterestsRecord =
                                    gridViewInterestsRecordList[gridViewIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.interests.contains(
                                        gridViewInterestsRecord.reference)) {
                                      setState(() {
                                        _model.removeFromInterests(
                                            gridViewInterestsRecord.reference);
                                      });
                                    } else {
                                      setState(() {
                                        _model.addToInterests(
                                            gridViewInterestsRecord.reference);
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: 104.0,
                                    height: 150.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15.0),
                                      border: Border.all(
                                        color: _model.interests.contains(
                                                gridViewInterestsRecord
                                                    .reference)
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : Color(0x00000000),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.network(
                                            gridViewInterestsRecord.photoUrl,
                                            width: 104.0,
                                            height: 104.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                gridViewInterestsRecord.name,
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .migomBlack,
                                                          fontSize: 16.0,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.3,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: StreamBuilder<List<CategoriesRecord>>(
                    stream: queryCategoriesRecord(),
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
                      List<CategoriesRecord> buttonCategoriesRecordList =
                          snapshot.data!;
                      return FFButtonWidget(
                        onPressed: () async {
                          final usersUpdateData = {
                            ...createUsersRecordData(
                              photoUrl: widget.photo,
                              tag: widget.teg,
                              displayName: widget.name,
                              description: widget.description,
                              image2: widget.photo2,
                              profileFilled: true,
                            ),
                            'interests': _model.interests,
                          };
                          await currentUserReference!.update(usersUpdateData);

                          context.goNamed('MyProfile');
                        },
                        text: 'СОХРАНИТЬ',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).migomWhite,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Ermilov',
                                    color: FlutterFlowTheme.of(context).primary,
                                    useGoogleFonts: false,
                                  ),
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).migomPrimary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
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
    );
  }
}
