import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:migom/auth/firebase_auth/auth_util.dart';
import 'package:migom/flutter_flow/flutter_flow_util.dart';

class FriendsWidget extends StatefulWidget {
  const FriendsWidget({super.key});

  @override
  State<FriendsWidget> createState() => _FriendsWidgetState();
}

class _FriendsWidgetState extends State<FriendsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Container(child: BackButton(
                      onPressed: () {
                        context.pop();
                      },
                    )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                      child: Text(
                        'ПРИГЛАСИТЬ ДРУГА',
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
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(20.0)),
              color: Colors.white,
            ),
          ),
          Padding(
            child: Column(
              children: [
                const Text(
                  'Ваш QR код',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                    color: Color.fromARGB(255, 18, 18, 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: FadeInImage(
                        image: NetworkImage(valueOrDefault(
                            FirebaseAuth.instance.currentUser?.photoURL, '')),
                        placeholder: AssetImage('Avatar.png'),
                      ),
                    ),
                    width: 148,
                    height: 148,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color(0xfff5f5f5)),
                  ),
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            padding: EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 0.0),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
      color: Colors.black12,
    ));
  }
}
