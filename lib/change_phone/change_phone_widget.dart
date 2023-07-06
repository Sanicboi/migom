import 'package:firebase_auth/firebase_auth.dart';
import 'package:masked_text/masked_text.dart';

import 'package:flutter/material.dart';
import 'package:migom/flutter_flow/flutter_flow_util.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import './change_phone_final.dart';

class ChangePhone extends StatefulWidget {
  const ChangePhone({super.key});

  @override
  State<ChangePhone> createState() => _ChangePhoneState();
}

class _ChangePhoneState extends State<ChangePhone> {
  String newPhone = '';
  String verificationId = '';
  bool valid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                  padding: EdgeInsets.fromLTRB(20, 15, 0, 15),
                  child: Text(
                    'НОВЫЙ НОМЕР ТЕЛЕФОНА',
                    style: TextStyle(
                      color: Color(0xff646464),
                      fontSize: 14,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: MaskedTextField(
                      keyboardType: TextInputType.phone,
                      style: TextStyle(
                        color: Color(0xff09090a),
                        fontFamily: 'SF Pro Display',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        height: 1.3,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0xffe1e1e1),
                      ),
                      mask: '+# (###) ###-##-##',
                      onChanged: (value) {
                        this.newPhone = value;
                        if (value.length == 18) {
                          setState(() {
                            this.valid = true;
                          });
                        }
                        if (value.length != 18 && this.valid) {
                          setState(() {
                            this.valid = false;
                          });
                        }
                      },
                    ),
                  ),
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            Container(
              color: Color(0xffffffff),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xffffffff),
                    ),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.sms_outlined,
                        color: Color(this.valid ? 0xff09090a : 0xffcccccc),
                        size: 24,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Отправить код',
                          style: TextStyle(
                            color: Color(this.valid ? 0xff09090a : 0xffcccccc),
                            fontFamily: 'SF Pro Display',
                            fontSize: 16,
                            height: 1.3,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                  onPressed: () async {
                    if (!this.valid) return;
                    await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: this.newPhone,
                        verificationCompleted:
                            (PhoneAuthCredential credential) async {
                          await FirebaseAuth.instance.currentUser
                              ?.updatePhoneNumber(credential);
                          context.pushNamed('_initialize');
                        },
                        verificationFailed: (FirebaseException ex) {
                          debugPrint(ex.message);
                        },
                        codeSent: (String verifId, int? resendToken) {
                          this.verificationId = verifId;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ChangePhoneConfirm(
                                  verId: this.verificationId)));
                        },
                        codeAutoRetrievalTimeout: (String verifId) {
                          this.verificationId = verifId;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ChangePhoneConfirm(
                                  verId: this.verificationId)));
                        });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
