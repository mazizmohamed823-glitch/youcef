import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "craeted_at" field.
  DateTime? _craetedAt;
  DateTime? get craetedAt => _craetedAt;
  bool hasCraetedAt() => _craetedAt != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "userref" field.
  DocumentReference? _userref;
  DocumentReference? get userref => _userref;
  bool hasUserref() => _userref != null;

  // "videoref" field.
  DocumentReference? _videoref;
  DocumentReference? get videoref => _videoref;
  bool hasVideoref() => _videoref != null;

  void _initializeFields() {
    _craetedAt = snapshotData['craeted_at'] as DateTime?;
    _text = snapshotData['text'] as String?;
    _userref = snapshotData['userref'] as DocumentReference?;
    _videoref = snapshotData['videoref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comments');

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsRecordData({
  DateTime? craetedAt,
  String? text,
  DocumentReference? userref,
  DocumentReference? videoref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'craeted_at': craetedAt,
      'text': text,
      'userref': userref,
      'videoref': videoref,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    return e1?.craetedAt == e2?.craetedAt &&
        e1?.text == e2?.text &&
        e1?.userref == e2?.userref &&
        e1?.videoref == e2?.videoref;
  }

  @override
  int hash(CommentsRecord? e) => const ListEquality()
      .hash([e?.craetedAt, e?.text, e?.userref, e?.videoref]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}
