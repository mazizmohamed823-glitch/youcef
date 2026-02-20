import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RedemptionsRecord extends FirestoreRecord {
  RedemptionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "point_cost" field.
  int? _pointCost;
  int get pointCost => _pointCost ?? 0;
  bool hasPointCost() => _pointCost != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "voucher_code" field.
  String? _voucherCode;
  String get voucherCode => _voucherCode ?? '';
  bool hasVoucherCode() => _voucherCode != null;

  // "user_email" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "product_name" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _pointCost = castToType<int>(snapshotData['point_cost']);
    _status = snapshotData['status'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _voucherCode = snapshotData['voucher_code'] as String?;
    _userEmail = snapshotData['user_email'] as String?;
    _productName = snapshotData['product_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('redemptions');

  static Stream<RedemptionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RedemptionsRecord.fromSnapshot(s));

  static Future<RedemptionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RedemptionsRecord.fromSnapshot(s));

  static RedemptionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RedemptionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RedemptionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RedemptionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RedemptionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RedemptionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRedemptionsRecordData({
  DateTime? createdAt,
  int? pointCost,
  String? status,
  DocumentReference? userRef,
  String? voucherCode,
  String? userEmail,
  String? productName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'point_cost': pointCost,
      'status': status,
      'user_ref': userRef,
      'voucher_code': voucherCode,
      'user_email': userEmail,
      'product_name': productName,
    }.withoutNulls,
  );

  return firestoreData;
}

class RedemptionsRecordDocumentEquality implements Equality<RedemptionsRecord> {
  const RedemptionsRecordDocumentEquality();

  @override
  bool equals(RedemptionsRecord? e1, RedemptionsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.pointCost == e2?.pointCost &&
        e1?.status == e2?.status &&
        e1?.userRef == e2?.userRef &&
        e1?.voucherCode == e2?.voucherCode &&
        e1?.userEmail == e2?.userEmail &&
        e1?.productName == e2?.productName;
  }

  @override
  int hash(RedemptionsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.pointCost,
        e?.status,
        e?.userRef,
        e?.voucherCode,
        e?.userEmail,
        e?.productName
      ]);

  @override
  bool isValidKey(Object? o) => o is RedemptionsRecord;
}
