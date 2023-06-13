import 'package:flutter/material.dart';
import 'package:migom/flutter_flow/flutter_flow_util.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutHome extends StatefulWidget {
  const AboutHome({super.key});

  @override
  State<AboutHome> createState() => _AboutHomeState();
}

class _AboutHomeState extends State<AboutHome> {
  String version = '';
  @override
  Widget build(BuildContext context) {
    if (this.version.isEmpty) {
      PackageInfo.fromPlatform().then((value) => {
            setState(() {
              this.version = value.version;
            })
          });
    }
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              'О ПРИЛОЖЕНИИ',
                              style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                fontFamily: 'Ermilov',
                                fontSize:
                                    MediaQuery.of(context).size.width < 360
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  size: 24,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    'СПРАВКА',
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width >
                                                  365
                                              ? 18
                                              : 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Ermilov',
                                      height: 1.1,
                                      color: Color(0xff09090a),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.chevron_right_rounded,
                                size: 36,
                              ),
                              padding: EdgeInsets.zero,
                            )
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.chat_outlined,
                                  size: 24,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    'ОСТАВИТЬ ОТЗЫВ',
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width >
                                                  365
                                              ? 18
                                              : 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Ermilov',
                                      height: 1.1,
                                      color: Color(0xff09090a),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.chevron_right_rounded,
                                size: 36,
                              ),
                              padding: EdgeInsets.zero,
                            )
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.checklist,
                                  size: 24,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    'УСЛОВИЯ\nИСПОЛЬЗОВАНИЯ',
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width >
                                                  365
                                              ? 18
                                              : 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Ermilov',
                                      height: 1.1,
                                      color: Color(0xff09090a),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                context.pushNamed('eula2');
                              },
                              icon: Icon(
                                Icons.chevron_right_rounded,
                                size: 36,
                              ),
                              padding: EdgeInsets.zero,
                            )
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                // Icon(
                                //   Icons.info_outline_rounded,
                                //   size: 24,
                                // ),
                                // Padding(
                                //   padding: EdgeInsets.only(left: 10),
                                /*   child: */ Text(
                                  'ЛИЦЕНЗИЯ',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width > 365
                                            ? 18
                                            : 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Ermilov',
                                    height: 1.1,
                                    color: Color(0xff09090a),
                                  ),
                                ),
                                //     )
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.chevron_right_rounded,
                                size: 36,
                              ),
                              padding: EdgeInsets.zero,
                            )
                          ]),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 15, 20, 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ТЕКУЩАЯ ВЕРСИЯ ПРИЛОЖЕНИЯ',
                    style: TextStyle(
                      color: Color(0xff646464),
                      fontFamily: 'SF Pro Display',
                      fontSize:
                          MediaQuery.of(context).size.width > 365 ? 14 : 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    this.version,
                    style: TextStyle(
                      color: Color(0xff646464),
                      fontFamily: 'SF Pro Display',
                      fontSize:
                          MediaQuery.of(context).size.width > 365 ? 14 : 10,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
