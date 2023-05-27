import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RegistrationsRecord extends FirestoreRecord {
  RegistrationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "host" field.
  DocumentReference? _host;
  DocumentReference? get host => _host;
  bool hasHost() => _host != null;

  // "event" field.
  DocumentReference? _event;
  DocumentReference? get event => _event;
  bool hasEvent() => _event != null;

  // "visited" field.
  bool? _visited;
  bool get visited => _visited ?? false;
  bool hasVisited() => _visited != null;

  // "passportPhotoUrl" field.
  String? _passportPhotoUrl;
  String get passportPhotoUrl => _passportPhotoUrl ?? '';
  bool hasPassportPhotoUrl() => _passportPhotoUrl != null;

  // "registeredName" field.
  String? _registeredName;
  String get registeredName => _registeredName ?? '';
  bool hasRegisteredName() => _registeredName != null;

  // "paid" field.
  bool? _paid;
  bool get paid => _paid ?? false;
  bool hasPaid() => _paid != null;

  // "contactPhone" field.
  String? _contactPhone;
  String get contactPhone => _contactPhone ?? '';
  bool hasContactPhone() => _contactPhone != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _host = snapshotData['host'] as DocumentReference?;
    _event = snapshotData['event'] as DocumentReference?;
    _visited = snapshotData['visited'] as bool?;
    _passportPhotoUrl = snapshotData['passportPhotoUrl'] as String?;
    _registeredName = snapshotData['registeredName'] as String?;
    _paid = snapshotData['paid'] as bool?;
    _contactPhone = snapshotData['contactPhone'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('registrations');

  static Stream<RegistrationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RegistrationsRecord.fromSnapshot(s));

  static Future<RegistrationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RegistrationsRecord.fromSnapshot(s));

  static RegistrationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RegistrationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RegistrationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RegistrationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RegistrationsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createRegistrationsRecordData({
  String? id,
  DocumentReference? user,
  DocumentReference? host,
  DocumentReference? event,
  bool? visited,
  String? passportPhotoUrl,
  String? registeredName,
  bool? paid,
  String? contactPhone,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'user': user,
      'host': host,
      'event': event,
      'visited': visited,
      'passportPhotoUrl': passportPhotoUrl,
      'registeredName': registeredName,
      'paid': paid,
      'contactPhone': contactPhone,
    }.withoutNulls,
  );

  return firestoreData;
}
