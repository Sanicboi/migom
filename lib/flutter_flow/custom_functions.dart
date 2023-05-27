import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

bool checkphonenumber(String phone) {
  // check if string length is 12
  int len = phone.length;

  if (len != 12)
    return false;
  else {
    return true;
  }
}

bool photoisempty(String photo) {
  // If image is empty its true
  if (photo?.isEmpty ?? true)
    return true;
  else
    return false;
}

String convertNameToTag(String name) {
  return name + '@';
}

String convertTimeStampToString(DateTime dateTime) {
  return dateTime.year.toString() +
      '-' +
      dateTime.month.toString() +
      '-' +
      dateTime.day.toString() +
      ' ' +
      dateTime.hour.toString() +
      '.' +
      dateTime.minute.toString();
}

String toCaps(String str) {
  return str.toUpperCase();
}

int getDifference(
  int int1,
  int int2,
) {
  return int1 - int2;
}

DateTime? datalist(List<DateTime>? time) {
  // Show the first if the list has the same date
  if (time == null) {
    return null;
  }
  if (time.length == 0) {
    return null;
  }
  if (time.length == 1) {
    return time[0];
  }
  DateTime? first = time[0];
  for (int i = 1; i < time.length; i++) {
    if (time[i].day != first!.day) {
      return null;
    }
  }
  return first;
}
