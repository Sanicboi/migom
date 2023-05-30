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
        backgroundColor: Color(0xffd5d5d5),
        body: Column(
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
                          'ИЗМЕНИТЬ НОМЕР',
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontFamily: 'Ermilov',
                            fontSize: MediaQuery.of(context).size.width < 350
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
                    BorderRadius.vertical(bottom: Radius.circular(20.0)),
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 300),
              child: Column(
                children: [
                  const Text(
                    'Текущий номер',
                    style: TextStyle(
                      color: Color(0xff646464),
                      fontFamily: 'SF Pro Display',
                      fontSize: 16,
                      height: 1.3,
                    ),
                  ),
                  Text(
                    valueOrDefault(
                        FirebaseAuth.instance.currentUser?.phoneNumber,
                        'Неизвестный номер'),
                    style: TextStyle(
                      color: Color(0xfff93448),
                      fontFamily: 'SF Pro Display',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Здесь вы можете сменить номер\nтелефона. Ваш аккаунт и все данные\n(сообщения, медиа, контакты и т. д.)\n будут перенесены на новый номер',
                      style: TextStyle(
                        color: Color(0xff646464),
                        fontFamily: 'SF Pro Display',
                        fontSize: 16,
                        height: 1.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Icon(
                        Icons.arrow_downward_sharp,
                      )),
                  Padding(
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                      child: SizedBox(
                        child: TextButton(
                          child: Text(
                            'ИЗМЕНИТЬ НОМЕР',
                            style: TextStyle(
                                color: Color(0xff09090a),
                                fontFamily: 'SF Pro Display',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 1.3),
                          ),
                          onPressed: () {
                            context.pushNamed('changephone');
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Color(0xffffffff)),
                              padding: MaterialStateProperty.resolveWith(
                                  (states) =>
                                      EdgeInsets.fromLTRB(0, 9.5, 0, 9.5)),
                              shape: MaterialStateProperty.resolveWith(
                                  (states) => RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)))),
                        ),
                        height: 40,
                        width: 200,
                      ))
                ],
              ),
            )
          ],
        ));
  }
}
