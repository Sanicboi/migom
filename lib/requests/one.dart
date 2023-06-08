import 'package:flutter/material.dart';
import 'package:migom/flutter_flow/flutter_flow_util.dart';

class OneRequest extends StatefulWidget {
  const OneRequest({
    super.key,
    required this.photo_url,
    required this.display_name,
    required this.tag,
    required this.isVerififed,
    required this.registeredName,
    required this.contactPhone,
    required this.passportPhotoUrl,
    required this.reference,
  });
  final String photo_url;
  final String display_name;
  final String tag;
  final bool isVerififed;
  final String registeredName;
  final String contactPhone;
  final String passportPhotoUrl;
  final DocumentReference reference;
  @override
  State<OneRequest> createState() => _OneRequestState();
}

class _OneRequestState extends State<OneRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                          'ЗАЯВКА',
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
              padding: EdgeInsets.only(top: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(children: [
                    CircleAvatar(
                      foregroundImage: NetworkImage(
                        widget.photo_url,
                      ),
                      radius: 25,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.display_name,
                                style: TextStyle(
                                  color: Color(0xff09090a),
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1.3,
                                ),
                              ),
                              widget.isVerififed
                                  ? Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xfff93448),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: Padding(
                                          child: Text(
                                            'PRO',
                                            style: TextStyle(
                                              fontFamily: 'SF Pro Display',
                                              color: Color(0xffffffff),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              height: 1.3,
                                            ),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 0.5),
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          ),
                          Text(
                            '@${widget.tag}',
                            style: TextStyle(
                              color: Color(0xff646464),
                              fontFamily: 'SF Pro Display',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
              child: Text(
                'ИНФОРМАЦИЯ О ПОЛЬЗОВАТЕЛЕ',
                style: TextStyle(
                  color: Color(0xff646464),
                  fontFamily: 'SF Pro Display',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ИМЯ ФАМИЛИЯ',
                          style: TextStyle(
                            fontFamily: 'Ermilov',
                            color: Color(0xff09090a),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xffe1e1e1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                widget.registeredName,
                                style: TextStyle(
                                  color: Color(0xff09090a),
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1.3,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'НОМЕР ТЕЛЕФОНА',
                            style: TextStyle(
                              fontFamily: 'Ermilov',
                              color: Color(0xff09090a),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              height: 1.3,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xffe1e1e1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                widget.contactPhone,
                                style: TextStyle(
                                  color: Color(0xff09090a),
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1.3,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
              child: Text(
                'ФОТО ПАСПОРТА',
                style: TextStyle(
                  color: Color(0xff646464),
                  fontFamily: 'SF Pro Display',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.passportPhotoUrl,
                    fit: BoxFit.scaleDown,
                  ),
                  // child: Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     color: Colors.blue,
                  //   ),
                  //   width: MediaQuery.of(context).size.width,
                  //   height: 300,
                  // ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
              child: Text(
                'РЕШЕНИЕ',
                style: TextStyle(
                  color: Color(0xff646464),
                  fontFamily: 'SF Pro Display',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color(0xff4ff934),
                            ),
                            side: MaterialStateProperty.all(BorderSide.none),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ))),
                        onPressed: () async {
                          await widget.reference.delete();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 35,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.stop_circle_outlined),
                              Text(
                                'Отклонить',
                                style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  color: Color(0xff09090a),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1.3,
                                ),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color(0xff4ff934),
                            ),
                            side: MaterialStateProperty.all(BorderSide.none),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ))),
                        onPressed: () async {
                          await widget.reference.set({
                            'approved': true,
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 35,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.check_circle_outline),
                              Text(
                                'Отклонить',
                                style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  color: Color(0xff09090a),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1.3,
                                ),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
