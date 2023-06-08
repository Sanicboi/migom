import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:migom/auth/firebase_auth/auth_util.dart';
import 'package:migom/flutter_flow/flutter_flow_util.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';

class FriendsWidget extends StatefulWidget {
  const FriendsWidget({super.key});

  @override
  State<FriendsWidget> createState() => _FriendsWidgetState();
}

class _FriendsWidgetState extends State<FriendsWidget> {
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
                            'ПРИГЛАСИТЬ ДРУЗЕЙ',
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
                      BorderRadius.vertical(bottom: Radius.circular(15.0)),
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 42.5),
                child: Container(
                  child: Image(
                    image: NetworkImage(
                      // TODO: add my qr code
                      /* No need to set aspect ratio since we control qr codes */
                      'http:/95.163.240.236/api/qr/${currentUser!.uid}',
                    ),
                    fit: BoxFit.scaleDown,
                  ),
                  constraints: BoxConstraints(maxHeight: 300, maxWidth: 300),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                ),
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              MediaQuery.of(context).size.width > 330
                                  ? Text(
                                      'http://95.163.240.236/add/${currentUser!.uid}',
                                      style: TextStyle(
                                        color: Color(0xff646464),
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        height: 1.3,
                                      ),
                                    )
                                  : const Text(
                                      'Копировать',
                                      style: TextStyle(
                                        color: Color(0xff646464),
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        height: 1.3,
                                      ),
                                    ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(Icons.copy),
                                  onPressed: () async {
                                    await Clipboard.setData(
                                      ClipboardData(
                                        text:
                                            'http://95.163.240.236/add/${currentUser!.uid}',
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffe1e1e1),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              side: MaterialStateProperty.all(
                                BorderSide(
                                  color: Color(0xffe1e1e1),
                                  width: 2,
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                Color(0xffffffff),
                              ),
                              padding: MaterialStateProperty.all(
                                EdgeInsets.all(20),
                              ),
                            ),
                            onPressed: () {
                              Share.share(
                                'Добавь меня в друзья в Migom: https://migom.app/add/your-user-id',
                                subject: 'Migom',
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.share,
                                  color: Color(0xff09090a),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Поделиться',
                                    style: TextStyle(
                                      color: Color(0xff09090a),
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      height: 1.3,
                                    ),
                                  ),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
