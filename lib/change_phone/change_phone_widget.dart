import 'package:firebase_auth/firebase_auth.dart';
import 'package:masked_text/masked_text.dart';
// import 'package:expandable/expandable.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:migom/auth/auth_manager.dart';
// import 'package:migom/auth/firebase_auth/auth_util.dart';
// import 'package:migom/flutter_flow/flutter_flow_util.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import './model.dart';
// import '../main.dart';

// class ChangePhone extends StatefulWidget {
//   ChangePhone({super.key});
//   @override
//   State<ChangePhone> createState() => _ChangePhoneState();
// }

// class _ChangePhoneState extends State<ChangePhone> {
//   TextEditingController controller = new TextEditingController(text: '+');
//   String newPhone = '';
//   String smsCode = '';
//   bool sentCode = false;
//   String verificationId = '';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color(0xffd5d5d5),
//         body: Container(
//           height: MediaQuery.of(context).size.height,
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Container(
//                 child: Padding(
//                     padding: EdgeInsets.all(20.0),
//                     child: Row(
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             context.pop();
//                           },
//                           icon: Icon(Icons.arrow_back),
//                           padding: EdgeInsets.all(8.0),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
//                           child: Text(
//                             'ИЗМЕНИТЬ НОМЕР',
//                             style: TextStyle(
//                               color: Colors.black,
//                               decoration: TextDecoration.none,
//                               fontFamily: 'Ermilov',
//                               fontSize: MediaQuery.of(context).size.width < 350
//                                   ? 14
//                                   : 18,
//                               fontWeight: FontWeight.bold,
//                               height: 1.3,
//                             ),
//                             textAlign: TextAlign.left,
//                           ),
//                         )
//                       ],
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                     )),
//                 decoration: BoxDecoration(
//                   borderRadius:
//                       BorderRadius.vertical(bottom: Radius.circular(20.0)),
//                   color: Colors.white,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.fromLTRB(0, 15.0, 0, 0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.,
//                   children: [
//                     Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         mainAxisSize: MainAxisSize.max,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
//                             child: const Text(
//                               'НОВЫЙ НОМЕР ТЕЛЕФОНА',
//                               style: TextStyle(
//                                 fontFamily: 'SF Pro Display',
//                                 fontSize: 14,
//                                 height: 1.3,
//                               ),
//                             ),
//                           ),
//                         ]),
//                     Padding(
//                       padding: EdgeInsets.only(top: 10),
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: Color(0xfff5f5f5),
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(20.0))),
//                         child: Padding(
//                           padding: EdgeInsets.all(20),
//                           child: TextField(
//                             decoration: InputDecoration(
//                               hintText: 'Новый номер телефона',
//                               fillColor: Color(0xffd5d5d5),
//                               filled: true,
//                               border: InputBorder.none,
//                             ),
//                             keyboardType: TextInputType.phone,
//                             controller: this.controller,
//                             inputFormatters: [],
//                             onChanged: (value) {
//                               this.newPhone = value;
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Padding(
//                             padding: EdgeInsets.only(top: 20.0),
//                             child: TextButton(
//                               child: const Text(
//                                 'ОТПРАВИТЬ КОД',
//                                 style: TextStyle(
//                                     fontFamily: 'Ermilov',
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 18,
//                                     height: 1.3,
//                                     color: Color(0xff09090a)),
//                               ),
//                               onPressed: () async {
//                                 FirebaseAuth.instance.verifyPhoneNumber(
//                                   phoneNumber: newPhone,
//                                   timeout: const Duration(minutes: 2),
//                                   verificationCompleted: (credential) async {
//                                     await FirebaseAuth.instance.currentUser
//                                         ?.updatePhoneNumber(credential);
//                                   },
//                                   verificationFailed: (ex) {},
//                                   codeAutoRetrievalTimeout: (param) {},
//                                   codeSent: (verificationId,
//                                       [forceResendingToken]) async {
//                                     this.verificationId = verificationId;
//                                     this.sentCode = true;
//                                   },
//                                 );
//                               },
//                               style: ButtonStyle(
//                                   backgroundColor:
//                                       MaterialStateColor.resolveWith(
//                                           (states) => Color(0xffffffff)),
//                                   padding: MaterialStateProperty.resolveWith(
//                                       (states) =>
//                                           EdgeInsets.fromLTRB(20, 20, 20, 20))),
//                             )),
//                       ]),
//                         Padding(
//                           padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
//                           child: const Text(
//                             'КОД ИЗ СМС',
//                             style: TextStyle(
//                               fontFamily: 'SF Pro Display',
//                               fontSize: 14,
//                               height: 1.3,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(top: 10),
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 color: Color(0xfff5f5f5),
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(20.0))),
//                             child: Padding(
//                               padding: EdgeInsets.all(20),
//                               child: PinCodeTextField(
//                                 length: 6,
//                                 onChanged: (value) {
//                                   this.smsCode = value;
//                                 },
//                                 appContext: context,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                   padding: EdgeInsets.only(top: 20.0),
//                   child: TextButton(
//                     child: const Text(
//                       'ИЗМЕНИТЬ НОМЕР',
//                       style: TextStyle(
//                           fontFamily: 'Ermilov',
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                           height: 1.3,
//                           color: Color(0xff09090a)),
//                     ),
//                     onPressed: () async {
//                       if (this.sentCode) {
//                         final credential = PhoneAuthProvider.credential(
//                             verificationId: verificationId,
//                             smsCode: this.smsCode);
//                         await FirebaseAuth.instance.currentUser
//                             ?.updatePhoneNumber(credential);
//                       } else {
//                         debugPrint('Code not sent');
//                       }
//                     },
//                     style: ButtonStyle(
//                         backgroundColor: MaterialStateColor.resolveWith(
//                             (states) => Color(0xffffffff)),
//                         padding: MaterialStateProperty.resolveWith(
//                             (states) => EdgeInsets.fromLTRB(20, 20, 20, 20))),
//                   ))
//             ],
//           ),
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:migom/flutter_flow/flutter_flow_util.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ChangePhone extends StatefulWidget {
  const ChangePhone({super.key});

  @override
  State<ChangePhone> createState() => _ChangePhoneState();
}

class _ChangePhoneState extends State<ChangePhone> {
  TextEditingController controller = new TextEditingController(text: '+');
  String newPhone = '';
  String smsCode = '';
  bool sentCode = false;
  String verificationId = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
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
                            MediaQuery.of(context).size.width < 350 ? 14 : 18,
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
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0)),
            color: Colors.white,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
              child: const Text(
                'НОВЫЙ НОМЕР ТЕЛЕФОНА',
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 14,
                  height: 1.3,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: MaskedTextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xffe1e1e1),
                    ),
                    style: TextStyle(),
                    keyboardType: TextInputType.phone,
                    // controller: this.controller,
                    mask: '+# (###) ###-##-##',
                  ),
                ),
              ),
            )
          ],
        ),
        Padding(
            padding: EdgeInsets.only(top: 20),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextButton(
                child: Text(
                  'Отправить код',
                  style: TextStyle(
                      fontFamily: 'Ermilov',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      height: 1.3,
                      color: Color(0xff09090a)),
                ),
                onPressed: () async {
                  FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: newPhone,
                    timeout: const Duration(minutes: 2),
                    verificationCompleted: (credential) async {
                      await FirebaseAuth.instance.currentUser
                          ?.updatePhoneNumber(credential);
                    },
                    verificationFailed: (ex) {},
                    codeAutoRetrievalTimeout: (param) {},
                    codeSent: (verificationId, [forceResendingToken]) async {
                      this.verificationId = verificationId;
                      this.sentCode = true;
                    },
                  );
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Color(0xffffffff)),
                    padding: MaterialStateProperty.resolveWith(
                        (states) => EdgeInsets.fromLTRB(20, 20, 20, 20)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)))),
              ),
            )),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                child: const Text(
                  'КОД ИЗ СМС',
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 14,
                    height: 1.3,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: PinCodeTextField(
                        appContext: context,
                        length: 6,
                        onChanged: (value) {
                          this.smsCode = value;
                        },
                      )),
                ),
              )
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(top: 20),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextButton(
                child: Text(
                  'ИЗМЕНИТЬ',
                  style: TextStyle(
                      fontFamily: 'Ermilov',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      height: 1.3,
                      color: Color(0xff09090a)),
                ),
                onPressed: () async {
                  if (this.sentCode) {
                    final credential = PhoneAuthProvider.credential(
                        verificationId: verificationId, smsCode: this.smsCode);
                    await FirebaseAuth.instance.currentUser
                        ?.updatePhoneNumber(credential);
                  } else {
                    debugPrint('Code not sent');
                  }
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Color(0xffffffff)),
                    padding: MaterialStateProperty.resolveWith(
                        (states) => EdgeInsets.fromLTRB(20, 20, 20, 20)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)))),
              ),
            )),
      ]),
    );
  }
}
