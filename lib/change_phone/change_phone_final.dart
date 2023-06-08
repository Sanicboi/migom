import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:migom/flutter_flow/flutter_flow_util.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ChangePhoneConfirm extends StatefulWidget {
  const ChangePhoneConfirm({super.key, required this.verId});
  final String verId;
  @override
  State<ChangePhoneConfirm> createState() => _ChangePhoneConfirmState();
}

class _ChangePhoneConfirmState extends State<ChangePhoneConfirm> {
  String pinCode = '';
  bool valid = false;
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    'КОД ИЗ СМС',
                    style: TextStyle(
                      color: Color(0xff646464),
                      fontFamily: 'SF Pro Display',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: PinCodeTextField(
                      appContext: context,
                      length: 6,
                      onChanged: (value) {
                        this.pinCode = value;
                        if (value.length == 6) {
                          setState(() {
                            this.valid = true;
                          });
                        }
                        if (value.length != 6 && this.valid) {
                          setState(() {
                            this.valid = false;
                          });
                        }
                      },
                      hintCharacter: '●',
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffffffff),
                  ),
                ),
              ],
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
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Изменить номер',
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
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: widget.verId,
                            smsCode: this.pinCode);
                    final result = await FirebaseAuth.instance.currentUser
                        ?.updatePhoneNumber(credential)
                        .onError((FirebaseAuthException error, stackTrace) {
                      showSnackbar(context, valueOrDefault(error.message, ''));
                    });
                    context.pushNamed('_initialize');
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
