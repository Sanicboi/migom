import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          params: parameterData.params,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              color: FlutterFlowTheme.of(context).primary,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get params => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'StartPage111': ParameterData.none(),
  'SMSpage111': ParameterData.none(),
  'MyProfile': ParameterData.none(),
  'AddEvent': ParameterData.none(),
  'HomePage': ParameterData.none(),
  'SingleEventPage': (data) async => ParameterData(
        allParams: {
          'ev': await getDocumentParameter<EventsRecord>(
              data, 'ev', EventsRecord.fromSnapshot),
        },
      ),
  'CategoriesPage': ParameterData.none(),
  'SingleCatPage': (data) async => ParameterData(
        allParams: {
          'cat': await getDocumentParameter<CategoriesRecord>(
              data, 'cat', CategoriesRecord.fromSnapshot),
        },
      ),
  'Settings': ParameterData.none(),
  'CreateProfile': ParameterData.none(),
  'Calendar': ParameterData.none(),
  'eula': ParameterData.none(),
  'UsersProfile': (data) async => ParameterData(
        allParams: {
          'user': await getDocumentParameter<UsersRecord>(
              data, 'user', UsersRecord.fromSnapshot),
        },
      ),
  'Confidentiality': ParameterData.none(),
  'Notifications': ParameterData.none(),
  'Premium': ParameterData.none(),
  'Safety': ParameterData.none(),
  'Support': ParameterData.none(),
  'Support_1': ParameterData.none(),
  'Payment': ParameterData.none(),
  'registration_event': (data) async => ParameterData(
        allParams: {
          'ev': await getDocumentParameter<EventsRecord>(
              data, 'ev', EventsRecord.fromSnapshot),
        },
      ),
  'chat': ParameterData.none(),
  'onlain': ParameterData.none(),
  'offline': ParameterData.none(),
  'interese': (data) async => ParameterData(
        allParams: {
          'photo': getParameter<String>(data, 'photo'),
          'teg': getParameter<String>(data, 'teg'),
          'name': getParameter<String>(data, 'name'),
          'photo2': getParameter<String>(data, 'photo2'),
          'description': getParameter<String>(data, 'description'),
        },
      ),
  'ChangeEvent': (data) async => ParameterData(
        allParams: {
          'change': await getDocumentParameter<EventsRecord>(
              data, 'change', EventsRecord.fromSnapshot),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
