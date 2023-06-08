

import 'package:flutter/material.dart';
import 'package:migom/auth/firebase_auth/auth_util.dart';
import 'package:migom/backend/backend.dart';
import 'package:migom/flutter_flow/custom_functions.dart';
import 'package:migom/flutter_flow/flutter_flow_util.dart';
import '../pages/users_profile/users_profile_widget.dart';
import './one.dart';

class RequestsHome extends StatefulWidget {
  const RequestsHome({super.key, required this.eventRef});
  final DocumentReference eventRef;
  @override
  State<RequestsHome> createState() => _RequestsHomeState();
}

class _RequestsHomeState extends State<RequestsHome> {
  bool chosen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: SingleChildScrollView(
        child: Column(
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
                          'ЗАЯВКИ',
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
              padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
              child: Row(children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      this.chosen = false;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        'Заявки',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: this.chosen
                              ? Color(0xff09090a)
                              : Color(0xfff93448),
                        ),
                      ),
                      Container(
                        height: 2,
                        color:
                            this.chosen ? Color(0x00ffffff) : Color(0xfff93448),
                        width: 100,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        this.chosen = true;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Принятые',
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: !this.chosen
                                ? Color(0xff09090a)
                                : Color(0xfff93448),
                          ),
                        ),
                        Container(
                          height: 2,
                          color: !this.chosen
                              ? Color(0x00ffffff)
                              : Color(0xfff93448),
                          width: 120,
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('registrations')
                  .where('host', isEqualTo: currentUserReference)
                  .where('event', isEqualTo: widget.eventRef.path)
                  .get()
                  .asStream(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Text('Ошибка');
                debugPrint('No error');
                debugPrint(snapshot.data?.docs?.length.toString());

                return Column(
                  children: List.generate(
                      snapshot.data!.docs
                          .where((element) => this.chosen
                              ? element['approved']
                              : !element['approved'])
                          .toList()
                          .length, (index) {
                    final current = snapshot.data!.docs
                        .where((element) => this.chosen
                            ? element['approved']
                            : !element['approved'])
                        .toList()[index];
                    DocumentReference userRef = current['user'];
                    DocumentReference eventRef = current['event'];
                    return Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffffffff),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              FutureBuilder(
                                future: userRef.get(),
                                builder: (BuildContext context,
                                    AsyncSnapshot userSnapshot) {
                                  if (!userSnapshot.hasData)
                                    return const Text('No data');
                                  return Row(
                                    children: [
                                      CircleAvatar(
                                        foregroundImage: NetworkImage(
                                          userSnapshot.data!['photo_url'],
                                        ),
                                        radius: 25,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 10,
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  userSnapshot
                                                      .data!['display_name'],
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'SF Pro Display',
                                                    color: Color(0xff09090a),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.3,
                                                  ),
                                                ),
                                                userSnapshot.data!['isVerified']
                                                    ? Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 5),
                                                        child: Container(
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              vertical: 0.5,
                                                              horizontal: 8,
                                                            ),
                                                            child: Text(
                                                              'PRO',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                height: 1.3,
                                                              ),
                                                            ),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xfff93448),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                          ),
                                                        ),
                                                      )
                                                    : SizedBox(),
                                              ],
                                            ),
                                            Text(
                                              '@${userSnapshot.data!['tag']}',
                                              style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Color(0xff646464),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Container(
                                  color: Color(
                                    0xffe1e1e1,
                                  ),
                                  height: 2,
                                  width: MediaQuery.of(context).size.width - 40,
                                ),
                              ),
                              FutureBuilder(
                                future: eventRef.get(),
                                builder: (BuildContext context,
                                    AsyncSnapshot eventSnapshot) {
                                  if (!snapshot.hasData)
                                    return Text('No event');
                                  Timestamp eventTime =
                                      eventSnapshot.data!['date'];
                                  return Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      eventSnapshot
                                                          .data!['name'],
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        color:
                                                            Color(0xff09090a),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    eventSnapshot.data![
                                                            'isAgeRestricted']
                                                        ? Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 5),
                                                            child: Container(
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                  vertical: 0.5,
                                                                  horizontal: 8,
                                                                ),
                                                                child: Text(
                                                                  eventSnapshot
                                                                          .data![
                                                                      'restriction'],
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'SF Pro Display',
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    height: 1.3,
                                                                  ),
                                                                ),
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xfff93448),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6),
                                                              ),
                                                            ),
                                                          )
                                                        : SizedBox(),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 10),
                                                  child: Text(
                                                    '${eventTime.toDate().day}.${eventTime.toDate().month}.${eventTime.toDate().year} в ${eventTime.toDate().hour}:${eventTime.toDate().minute >= 10 ? '' : '0'}${eventTime.toDate().minute}',
                                                    style: TextStyle(
                                                      color: Color(
                                                        0xff646464,
                                                      ),
                                                      fontFamily:
                                                          'SF Pro Display',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Text(
                                                'Мест: ${eventSnapshot.data!['hasLimit'] ? '${eventSnapshot.data!['limit'] - snapshot.data!.docs.length} из ${eventSnapshot.data!['limit']}' : 'не ограничено'}')
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              eventSnapshot.data!['foto_path'],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              DocumentSnapshot userSnapshot =
                                                  await userRef.get();
                                              if (!userSnapshot.exists) return;
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          UsersProfileWidget(
                                                              user: UsersRecord
                                                                  .fromSnapshot(
                                                                      userSnapshot))));
                                            },
                                            child: Text(
                                              'О участнике',
                                              style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                color: Color(0xff09090a),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                height: 1.3,
                                              ),
                                            ),
                                            style: ButtonStyle(
                                              elevation:
                                                  MaterialStatePropertyAll(0),
                                              side: MaterialStatePropertyAll(
                                                BorderSide(
                                                  color: Color(
                                                    0xffe1e1e1,
                                                  ),
                                                  width: 2,
                                                ),
                                              ),
                                              shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                Color(0xffffffff),
                                              ),
                                              padding: MaterialStatePropertyAll(
                                                EdgeInsets.symmetric(
                                                  vertical: 10,
                                                  horizontal: 12,
                                                ),
                                              ),
                                              fixedSize:
                                                  MaterialStatePropertyAll(
                                                Size.fromWidth(
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width -
                                                        40),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              DocumentSnapshot user =
                                                  await userRef.get();
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      OneRequest(
                                                    photo_url:
                                                        user['photo_url'],
                                                    display_name:
                                                        user['display_name'],
                                                    isVerififed:
                                                        user['isVerified'],
                                                    tag: user['tag'],
                                                    contactPhone:
                                                        current['contactPhone'],
                                                    passportPhotoUrl: current[
                                                        'passportPhotoUrl'],
                                                    registeredName:
                                                        current[index]
                                                            ['registeredName'],
                                                    reference:
                                                        current.reference,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              'О заявке',
                                              style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                color: Color(0xff09090a),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                height: 1.3,
                                              ),
                                            ),
                                            style: ButtonStyle(
                                              elevation:
                                                  MaterialStatePropertyAll(0),
                                              side: MaterialStatePropertyAll(
                                                BorderSide(
                                                  color: Color(
                                                    0xffe1e1e1,
                                                  ),
                                                  width: 2,
                                                ),
                                              ),
                                              shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                Color(0xffffffff),
                                              ),
                                              padding: MaterialStatePropertyAll(
                                                EdgeInsets.symmetric(
                                                  vertical: 10,
                                                  horizontal: 12,
                                                ),
                                              ),
                                              fixedSize:
                                                  MaterialStatePropertyAll(
                                                Size.fromWidth(
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width -
                                                        40),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
