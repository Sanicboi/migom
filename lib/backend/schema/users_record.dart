import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "friends" field.
  List<DocumentReference>? _friends;
  List<DocumentReference> get friends => _friends ?? const [];
  bool hasFriends() => _friends != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "subscribers" field.
  List<DocumentReference>? _subscribers;
  List<DocumentReference> get subscribers => _subscribers ?? const [];
  bool hasSubscribers() => _subscribers != null;

  // "subscriptions" field.
  List<DocumentReference>? _subscriptions;
  List<DocumentReference> get subscriptions => _subscriptions ?? const [];
  bool hasSubscriptions() => _subscriptions != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "showEvents" field.
  bool? _showEvents;
  bool get showEvents => _showEvents ?? false;
  bool hasShowEvents() => _showEvents != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "recommendedUsers" field.
  List<DocumentReference>? _recommendedUsers;
  List<DocumentReference> get recommendedUsers => _recommendedUsers ?? const [];
  bool hasRecommendedUsers() => _recommendedUsers != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  bool hasTag() => _tag != null;

  // "isVerified" field.
  bool? _isVerified;
  bool get isVerified => _isVerified ?? false;
  bool hasIsVerified() => _isVerified != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "Image_2" field.
  String? _image2;
  String get image2 => _image2 ?? '';
  bool hasImage2() => _image2 != null;

  // "profileFilled" field.
  bool? _profileFilled;
  bool get profileFilled => _profileFilled ?? false;
  bool hasProfileFilled() => _profileFilled != null;

  // "interests" field.
  List<DocumentReference>? _interests;
  List<DocumentReference> get interests => _interests ?? const [];
  bool hasInterests() => _interests != null;

  void _initializeFields() {
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _friends = getDataList(snapshotData['friends']);
    _type = snapshotData['type'] as String?;
    _subscribers = getDataList(snapshotData['subscribers']);
    _subscriptions = getDataList(snapshotData['subscriptions']);
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _showEvents = snapshotData['showEvents'] as bool?;
    _description = snapshotData['description'] as String?;
    _recommendedUsers = getDataList(snapshotData['recommendedUsers']);
    _tag = snapshotData['tag'] as String?;
    _isVerified = snapshotData['isVerified'] as bool?;
    _email = snapshotData['email'] as String?;
    _image2 = snapshotData['Image_2'] as String?;
    _profileFilled = snapshotData['profileFilled'] as bool?;
    _interests = getDataList(snapshotData['interests']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createUsersRecordData({
  String? photoUrl,
  DateTime? createdTime,
  String? phoneNumber,
  String? type,
  String? displayName,
  String? uid,
  bool? showEvents,
  String? description,
  String? tag,
  bool? isVerified,
  String? email,
  String? image2,
  bool? profileFilled,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'photo_url': photoUrl,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'type': type,
      'display_name': displayName,
      'uid': uid,
      'showEvents': showEvents,
      'description': description,
      'tag': tag,
      'isVerified': isVerified,
      'email': email,
      'Image_2': image2,
      'profileFilled': profileFilled,
    }.withoutNulls,
  );

  return firestoreData;
}
