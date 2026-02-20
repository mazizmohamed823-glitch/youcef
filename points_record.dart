import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PointsRecord extends FirestoreRecord {
  PointsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "points" field.
  int? _points;
  int get points => _points ?? 0;
  bool hasPoints() => _points != null;

  void _initializeFields() {
    _points = castToType<int>(snapshotData['points']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Points');

  static Stream<PointsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PointsRecord.fromSnapshot(s));

  static Future<PointsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PointsRecord.fromSnapshot(s));

  static PointsRecord fromSnapshot(DocumentSnapshot snapshot) => PointsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PointsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PointsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PointsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PointsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPointsRecordData({
  int? points,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'points': points,
    }.withoutNulls,
  );

  return firestoreData;
}

class PointsRecordDocumentEquality implements Equality<PointsRecord> {
  const PointsRecordDocumentEquality();

  @override
  bool equals(PointsRecord? e1, PointsRecord? e2) {
    return e1?.points == e2?.points;
  }

  @override
  int hash(PointsRecord? e) => const ListEquality().hash([e?.points]);

  @override
  bool isValidKey(Object? o) => o is PointsRecord;
}
