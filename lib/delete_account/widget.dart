import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:migom/auth/firebase_auth/auth_util.dart';
import 'package:migom/flutter_flow/flutter_flow_util.dart';
import "package:masked_text/masked_text.dart";
import 'package:firebase_auth/firebase_auth.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({super.key});

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  String phone = '';
  bool isOk = false;
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
              Column(
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
                    padding: EdgeInsets.only(top: 15),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Color(0x1bff0922),
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15))),
                        child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Container(
                                  child: Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Icon(
                                        Icons.warning_rounded,
                                        size: 24,
                                        color: Color(0xffffffff),
                                      )),
                                  decoration: BoxDecoration(
                                      color: Color(0xffff0922),
                                      shape: BoxShape.circle),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    'УДАЛЕНИЕ УЧЕТНОЙ\nЗАПИСИ ПОДРАЗУМЕВАЕТ',
                                    style: TextStyle(
                                      fontFamily: 'Ermilov',
                                      fontSize:
                                          MediaQuery.of(context).size.width >
                                                  365
                                              ? 18
                                              : 14,
                                      fontWeight: FontWeight.bold,
                                      height: 1.3,
                                    ),
                                  ),
                                )
                              ],
                            ))),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Удаление вашей учетной записи и фото профиля',
                        style: TextStyle(
                          color: Color(0xff646464),
                          fontFamily: 'SF Pro Display',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                        ),
                        // textAlign: TextAlign.center,
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(20),
                        ),
                        color: Color(0xffffffff)),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 15, 0, 15),
                        child: Text(
                          'ВВЕДИТЕ СВОЙ НОМЕР ТЕЛЕФОНА',
                          style: TextStyle(
                            color: Color(0xff646464),
                            fontSize: 14,
                            fontFamily: 'SF Pro Display',
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Container(
                              child: MaskedTextField(
                                onChanged: (value) {
                                  this.phone = value;
                                  if (value.length == 18) {
                                    setState(() {
                                      this.isOk = true;
                                    });
                                  }
                                  if (isOk && value.length != 18) {
                                    setState(() {
                                      this.isOk = false;
                                    });
                                  }
                                },
                                keyboardType: TextInputType.phone,
                                mask: '+# (###) ###-##-##',
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffe1e1e1),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                style: TextStyle(
                                  color: Color(0xff09090a),
                                  fontSize: 16,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            )),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  )
                ],
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.resolveWith(
                        (states) => EdgeInsets.all(20),
                      ),
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Color(0xffffffff))),
                  onPressed: () async {
                    if (!this.isOk) return;
                    final normal = this
                        .phone
                        .replaceAll(r' ', '')
                        .replaceAll(r'(', '')
                        .replaceAll(r')', '')
                        .replaceAll(r'-', '');
                    if (normal !=
                        FirebaseAuth.instance.currentUser?.phoneNumber) {
                      return showSnackbar(context, 'Неверный номер телефона');
                    }
                    await FirebaseAuth.instance.currentUser?.delete();
                    context.pushNamed('_initialize');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.delete,
                        color:
                            this.isOk ? Color(0xff09090a) : Color(0x3a09090a),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Удалить аккаунт',
                          style: TextStyle(
                            color: this.isOk
                                ? Color(0xff09090a)
                                : Color(0x3a09090a),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  )),
            ],
          )),
    );
  }
}
