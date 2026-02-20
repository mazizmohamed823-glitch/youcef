import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideosRecord extends FirestoreRecord {
  VideosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "earnedMoney" field.
  double? _earnedMoney;
  double get earnedMoney => _earnedMoney ?? 0.0;
  bool hasEarnedMoney() => _earnedMoney != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "uploaderld" field.
  String? _uploaderld;
  String get uploaderld => _uploaderld ?? '';
  bool hasUploaderld() => _uploaderld != null;

  // "videoUrl" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  bool hasVideoUrl() => _videoUrl != null;

  // "likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  bool hasLikes() => _likes != null;

  // "views" field.
  int? _views;
  int get views => _views ?? 0;
  bool hasViews() => _views != null;

  // "creatorRef" field.
  DocumentReference? _creatorRef;
  DocumentReference? get creatorRef => _creatorRef;
  bool hasCreatorRef() => _creatorRef != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "liked_by" field.
  List<DocumentReference>? _likedBy;
  List<DocumentReference> get likedBy => _likedBy ?? const [];
  bool hasLikedBy() => _likedBy != null;

  // "Totalviews" field.
  int? _totalviews;
  int get totalviews => _totalviews ?? 0;
  bool hasTotalviews() => _totalviews != null;

  // "videoRef" field.
  DocumentReference? _videoRef;
  DocumentReference? get videoRef => _videoRef;
  bool hasVideoRef() => _videoRef != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "viewed_by_users" field.
  DocumentReference? _viewedByUsers;
  DocumentReference? get viewedByUsers => _viewedByUsers;
  bool hasViewedByUsers() => _viewedByUsers != null;

  void _initializeFields() {
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _description = snapshotData['description'] as String?;
    _earnedMoney = castToType<double>(snapshotData['earnedMoney']);
    _title = snapshotData['title'] as String?;
    _uploaderld = snapshotData['uploaderld'] as String?;
    _videoUrl = snapshotData['videoUrl'] as String?;
    _likes = castToType<int>(snapshotData['likes']);
    _views = castToType<int>(snapshotData['views']);
    _creatorRef = snapshotData['creatorRef'] as DocumentReference?;
    _uid = snapshotData['uid'] as String?;
    _likedBy = getDataList(snapshotData['liked_by']);
    _totalviews = castToType<int>(snapshotData['Totalviews']);
    _videoRef = snapshotData['videoRef'] as DocumentReference?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _viewedByUsers = snapshotData['viewed_by_users'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Videos');

  static Stream<VideosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideosRecord.fromSnapshot(s));

  static Future<VideosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideosRecord.fromSnapshot(s));

  static VideosRecord fromSnapshot(DocumentSnapshot snapshot) => VideosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideosRecordData({
  DateTime? createdAt,
  String? description,
  double? earnedMoney,
  String? title,
  String? uploaderld,
  String? videoUrl,
  int? likes,
  int? views,
  DocumentReference? creatorRef,
  String? uid,
  int? totalviews,
  DocumentReference? videoRef,
  DocumentReference? userRef,
  DocumentReference? viewedByUsers,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdAt': createdAt,
      'description': description,
      'earnedMoney': earnedMoney,
      'title': title,
      'uploaderld': uploaderld,
      'videoUrl': videoUrl,
      'likes': likes,
      'views': views,
      'creatorRef': creatorRef,
      'uid': uid,
      'Totalviews': totalviews,
      'videoRef': videoRef,
      'userRef': userRef,
      'viewed_by_users': viewedByUsers,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideosRecordDocumentEquality implements Equality<VideosRecord> {
  const VideosRecordDocumentEquality();

  @override
  bool equals(VideosRecord? e1, VideosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.description == e2?.description &&
        e1?.earnedMoney == e2?.earnedMoney &&
        e1?.title == e2?.title &&
        e1?.uploaderld == e2?.uploaderld &&
        e1?.videoUrl == e2?.videoUrl &&
        e1?.likes == e2?.likes &&
        e1?.views == e2?.views &&
        e1?.creatorRef == e2?.creatorRef &&
        e1?.uid == e2?.uid &&
        listEquality.equals(e1?.likedBy, e2?.likedBy) &&
        e1?.totalviews == e2?.totalviews &&
        e1?.videoRef == e2?.videoRef &&
        e1?.userRef == e2?.userRef &&
        e1?.viewedByUsers == e2?.viewedByUsers;
  }

  @override
  int hash(VideosRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.description,
        e?.earnedMoney,
        e?.title,
        e?.uploaderld,
        e?.videoUrl,
        e?.likes,
        e?.views,
        e?.creatorRef,
        e?.uid,
        e?.likedBy,
        e?.totalviews,
        e?.videoRef,
        e?.userRef,
        e?.viewedByUsers
      ]);

  @override
  bool isValidKey(Object? o) => o is VideosRecord;
}
