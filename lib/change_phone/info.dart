import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:migom/flutter_flow/flutter_flow_util.dart';

class ChangeInfo extends StatefulWidget {
  const ChangeInfo({super.key});

  @override
  State<ChangeInfo> createState() => _ChangeInfoState();
}

class _ChangeInfoState extends State<ChangeInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              context.pop();
                            },
                            icon: Icon(Icons.arrow_back),
                            padding: EdgeInsets.all(8.0),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                            child: Text(
                              'УДАЛЕНИЕ',
                              style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                fontFamily: 'Ermilov',
                                fontSize:
                                    MediaQuery.of(context).size.width < 350
                                        ? 14
                                        : 18,
                                fontWeight: FontWeight.bold,
                                height: 1.3,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                      )),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(15.0)),
                    color: Colors.white,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 44),
                    child: Column(
                      children: [
                        Text(
                          'Текущий номер',
                          style: TextStyle(
                            height: 1.3,
                            fontFamily: 'SF Pro Display',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff646464),
                          ),
                        ),
                        Text(
                          valueOrDefault(
                            FirebaseAuth.instance.currentUser?.phoneNumber,
                            'Неизвестный номер',
                          ),
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xfff93448),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'Здесь вы можете сменить номер\nтелефона. Ваш аккаунт и все данные\n(сообщения, медиа, контакты и т. д.)\nбудут перенесены на новый номер',
                            style: TextStyle(
                              color: Color(0xff646464),
                              fontFamily: 'SF Pro Display',
                              height: 1.3,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Icon(
                              Icons.arrow_drop_down_rounded,
                              size: 48,
                            ))
                      ],
                    )),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: TextButton(
                      child: Text(
                        'Изменить номер',
                        style: TextStyle(
                          color: Color(0xff09090a),
                          fontFamily: 'SF Pro Display',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                        ),
                      ),
                      onPressed: () {
                        context.pushNamed('changephone');
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.resolveWith(
                            (states) => EdgeInsets.symmetric(vertical: 9.5)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Color(0xffe1e1e1),
                              width: 2,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}
