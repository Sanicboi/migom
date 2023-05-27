import 'package:flutter/material.dart';

class FriendsWidget extends StatefulWidget {
  const FriendsWidget({super.key});

  @override
  State<FriendsWidget> createState() => _FriendsWidgetState();
}

class _FriendsWidgetState extends State<FriendsWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          child: Column(children: [Container()]),
          color: const Color(0xf5f5f5),
        ));
  }
}
