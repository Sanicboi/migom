import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "host" field.
  DocumentReference? _host;
  DocumentReference? get host => _host;
  bool hasHost() => _host != null;

  // "foto_path" field.
  String? _fotoPath;
  String get fotoPath => _fotoPath ?? '';
  bool hasFotoPath() => _fotoPath != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "isPaid" field.
  bool? _isPaid;
  bool get isPaid => _isPaid ?? false;
  bool hasIsPaid() => _isPaid != null;

  // "isOnline" field.
  bool? _isOnline;
  bool get isOnline => _isOnline ?? false;
  bool hasIsOnline() => _isOnline != null;

  // "isPrivate" field.
  bool? _isPrivate;
  bool get isPrivate => _isPrivate ?? false;
  bool hasIsPrivate() => _isPrivate != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "categories" field.
  List<DocumentReference>? _categories;
  List<DocumentReference> get categories => _categories ?? const [];
  bool hasCategories() => _categories != null;

  // "place" field.
  LatLng? _place;
  LatLng? get place => _place;
  bool hasPlace() => _place != null;

  // "lasts" field.
  int? _lasts;
  int get lasts => _lasts ?? 0;
  bool hasLasts() => _lasts != null;

  // "isAgeRestricted" field.
  bool? _isAgeRestricted;
  bool get isAgeRestricted => _isAgeRestricted ?? false;
  bool hasIsAgeRestricted() => _isAgeRestricted != null;

  // "restriction" field.
  String? _restriction;
  String get restriction => _restriction ?? '';
  bool hasRestriction() => _restriction != null;

  // "hasLimit" field.
  bool? _hasLimit;
  bool get hasLimit => _hasLimit ?? false;
  bool hasHasLimit() => _hasLimit != null;

  // "limit" field.
  int? _limit;
  int get limit => _limit ?? 0;
  bool hasLimitField() => _limit != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "discounts" field.
  int? _discounts;
  int get discounts => _discounts ?? 0;
  bool hasDiscounts() => _discounts != null;

  // "Registration_users" field.
  List<DocumentReference>? _registrationUsers;
  List<DocumentReference> get registrationUsers =>
      _registrationUsers ?? const [];
  bool hasRegistrationUsers() => _registrationUsers != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _host = snapshotData['host'] as DocumentReference?;
    _fotoPath = snapshotData['foto_path'] as String?;
    _description = snapshotData['description'] as String?;
    _isPaid = snapshotData['isPaid'] as bool?;
    _isOnline = snapshotData['isOnline'] as bool?;
    _isPrivate = snapshotData['isPrivate'] as bool?;
    _date = snapshotData['date'] as DateTime?;
    _categories = getDataList(snapshotData['categories']);
    _place = snapshotData['place'] as LatLng?;
    _lasts = snapshotData['lasts'] as int?;
    _isAgeRestricted = snapshotData['isAgeRestricted'] as bool?;
    _restriction = snapshotData['restriction'] as String?;
    _hasLimit = snapshotData['hasLimit'] as bool?;
    _limit = snapshotData['limit'] as int?;
    _createdDate = snapshotData['created_date'] as DateTime?;
    _price = castToType<double>(snapshotData['price']);
    _discounts = snapshotData['discounts'] as int?;
    _registrationUsers = getDataList(snapshotData['Registration_users']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createEventsRecordData({
  String? name,
  DocumentReference? host,
  String? fotoPath,
  String? description,
  bool? isPaid,
  bool? isOnline,
  bool? isPrivate,
  DateTime? date,
  LatLng? place,
  int? lasts,
  bool? isAgeRestricted,
  String? restriction,
  bool? hasLimit,
  int? limit,
  DateTime? createdDate,
  double? price,
  int? discounts,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'host': host,
      'foto_path': fotoPath,
      'description': description,
      'isPaid': isPaid,
      'isOnline': isOnline,
      'isPrivate': isPrivate,
      'date': date,
      'place': place,
      'lasts': lasts,
      'isAgeRestricted': isAgeRestricted,
      'restriction': restriction,
      'hasLimit': hasLimit,
      'limit': limit,
      'created_date': createdDate,
      'price': price,
      'discounts': discounts,
    }.withoutNulls,
  );

  return firestoreData;
}
