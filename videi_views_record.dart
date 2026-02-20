import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideiViewsRecord extends FirestoreRecord {
  VideiViewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "videoRef" field.
  DocumentReference? _videoRef;
  DocumentReference? get videoRef => _videoRef;
  bool hasVideoRef() => _videoRef != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _videoRef = snapshotData['videoRef'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('videiViews');

  static Stream<VideiViewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideiViewsRecord.fromSnapshot(s));

  static Future<VideiViewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideiViewsRecord.fromSnapshot(s));

  static VideiViewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VideiViewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideiViewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideiViewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideiViewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideiViewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideiViewsRecordData({
  DocumentReference? userRef,
  DocumentReference? videoRef,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'videoRef': videoRef,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideiViewsRecordDocumentEquality implements Equality<VideiViewsRecord> {
  const VideiViewsRecordDocumentEquality();

  @override
  bool equals(VideiViewsRecord? e1, VideiViewsRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.videoRef == e2?.videoRef &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(VideiViewsRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.videoRef, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is VideiViewsRecord;
}
