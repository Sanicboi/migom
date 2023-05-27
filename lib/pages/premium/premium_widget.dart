import 'package:firebase_auth/firebase_auth.dart';
import 'package:migom/auth/auth_manager.dart';
import 'package:migom/auth/firebase_auth/auth_util.dart';
import 'package:url_launcher/url_launcher.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'premium_model.dart';
export 'premium_model.dart';

class PremiumWidget extends StatefulWidget {
  const PremiumWidget({Key? key}) : super(key: key);

  @override
  _PremiumWidgetState createState() => _PremiumWidgetState();
}

class _PremiumWidgetState extends State<PremiumWidget> {
  late PremiumModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PremiumModel());

    _model.textController ??= TextEditingController();
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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
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
                      Container(
                        width: double.infinity,
                        height: 442.5,
                        decoration: BoxDecoration(
                          color: Color(0xFFF93448),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Mask_group.png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 40.0, 0.0, 0.0),
                        child: Container(
                          width: 44.0,
                          height: 44.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.white, Color(0x1AFFFFFF)],
                              stops: [0.0, 1.0],
                              begin: AlignmentDirectional(0.0, -1.0),
                              end: AlignmentDirectional(0, 1.0),
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 44.0,
                            icon: Icon(
                              Icons.chevron_left,
                              color: FlutterFlowTheme.of(context).migomWhite,
                              size: 24.0,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 49.0, 0.0, 0.0),
                          child: Container(
                            width: 104.0,
                            height: 104.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.white, Color(0x33FFFFFF)],
                                stops: [0.0, 1.0],
                                begin: AlignmentDirectional(0.0, -1.0),
                                end: AlignmentDirectional(0, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              child: Image.asset(
                                'assets/images/photo_2023-04-22_21-07-01_1.png',
                                width: 80.23,
                                height: 80.0,
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 170.0, 0.0, 0.0),
                          child: Text(
                            'MIGOM PRO',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Ermilov',
                                  color:
                                      FlutterFlowTheme.of(context).migomWhite,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              40.0, 200.0, 40.0, 0.0),
                          child: Text(
                            'Для облегчения продвижения мероприятий, дополнительные мероприятия в комплекте, уникальные функции "Migom PRO" и значек PRO около имени',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'SF Pro Display',
                                  color:
                                      FlutterFlowTheme.of(context).migomWhite,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 270.0, 20.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 375.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        shape: CircleBorder(),
                                                      ),
                                                      unselectedWidgetColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .checkboxValue1 ??=
                                                          true,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                .checkboxValue1 =
                                                            newValue!);
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Ежегодно',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .migomBlack,
                                                          fontSize: 18.0,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.3,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 10.0,
                                                                8.0, 10.0),
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
                                                            '- 25%',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                '259Р в месяц',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .migomSecondaryText,
                                                          fontSize: 18.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: 'Вместо  ',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF646464),
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: '3108Р ',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF646464),
                                                          fontSize: 14.0,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: '---',
                                                        style: TextStyle(),
                                                      ),
                                                      TextSpan(
                                                        text: '2200Р в год',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF646464),
                                                          fontSize: 14.0,
                                                        ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          color:
                                                              Color(0xFF646464),
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 10.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 2.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .migomBGGrey,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Theme(
                                                data: ThemeData(
                                                  checkboxTheme:
                                                      CheckboxThemeData(
                                                    shape: CircleBorder(),
                                                  ),
                                                  unselectedWidgetColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent2,
                                                ),
                                                child: Checkbox(
                                                  value:
                                                      !_model.checkboxValue1!,
                                                  onChanged: (newValue) async {
                                                    setState(() =>
                                                        _model.checkboxValue1 =
                                                            !newValue!);
                                                  },
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                ),
                                              ),
                                              Text(
                                                'Ежемесячно',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .migomBlack,
                                                          fontSize: 18.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '359Р в месяц',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'SF Pro Display',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .migomSecondaryText,
                                                  fontSize: 18.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
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
                                        '30 ДОПОЛНИТЕЛЬНЫХ МЕРОПРИЯТИЙ',
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
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Text(
                                          'При покупке подписки "Migom PRO" вам автоматически начисляется 30 мероприятий, однако если вы считаете что этого недостаточно вы можете докупить их',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'SF Pro Display',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .migomSecondaryText,
                                                fontSize: 16.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Switch(
                                              value: _model.switchValue ??=
                                                  true,
                                              onChanged: (newValue) async {
                                                setState(() => _model
                                                    .switchValue = newValue!);
                                              },
                                              activeColor: Color(0xFFF8F8FA),
                                              activeTrackColor:
                                                  Color(0xFFF93448),
                                              inactiveTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .migomBGGrey,
                                              inactiveThumbColor:
                                                  Color(0xFFF93448),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'ДОБАВИТЬ ЕЩЕ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Ermilov',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .migomBlack,
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      8.0, 10.0, 8.0, 10.0),
                                              child: Container(
                                                width: 58.0,
                                                height: 22.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFFDE31),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '- 10%',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                fontSize: 16.0,
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: TextFormField(
                                          controller: _model.textController,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'от 10 до 50',
                                            hintStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'SF Pro Display',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .migomSecondaryText,
                                                  fontSize: 16.0,
                                                  useGoogleFonts: false,
                                                ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .migomBGGrey,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'SF Pro Display',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .migomSecondaryText,
                                                fontSize: 16.0,
                                                useGoogleFonts: false,
                                              ),
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Вместо ',
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text: '+1135Р ',
                                                style: TextStyle(
                                                  color: Color(0xFF646464),
                                                  fontSize: 14.0,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '--- ',
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text: '+1025Р в год',
                                                style: TextStyle(
                                                  color: Color(0xFF646464),
                                                  fontSize: 14.0,
                                                ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'SF Pro Display',
                                                  color: Color(0xFF646464),
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          'Вы можете добавить к тарифу еще дополнительных мероприятий  и получить скидку в размере 10%.',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'SF Pro Display',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .migomSecondaryText,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: false,
                                              ),
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
                      Container(
                        width: double.infinity,
                        height: 40.0,
                        decoration: BoxDecoration(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      final user = FirebaseAuth.instance.currentUser;
                      final token = await user?.getIdToken();
                      var params = {
                        'token': token,
                      };
                      var uri = new Uri(
                          scheme: 'http',
                          host: 'migom.app',
                          path: '/premium',
                          queryParameters: params);
                      await launchUrl(uri);
                    },
                    text: 'Подключить за Р в год',
                    options: FFButtonOptions(
                      width: 335.0,
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
        ),
      ),
    );
  }
}
