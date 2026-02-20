import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Points_used" field.
  int? _pointsUsed;
  int get pointsUsed => _pointsUsed ?? 0;
  bool hasPointsUsed() => _pointsUsed != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "product_id" field.
  String? _productId;
  String get productId => _productId ?? '';
  bool hasProductId() => _productId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _pointsUsed = castToType<int>(snapshotData['Points_used']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _productId = snapshotData['product_id'] as String?;
    _status = snapshotData['status'] as String?;
    _userId = snapshotData['user_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  int? pointsUsed,
  DateTime? createdAt,
  String? productId,
  String? status,
  String? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Points_used': pointsUsed,
      'created_at': createdAt,
      'product_id': productId,
      'status': status,
      'user_id': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    return e1?.pointsUsed == e2?.pointsUsed &&
        e1?.createdAt == e2?.createdAt &&
        e1?.productId == e2?.productId &&
        e1?.status == e2?.status &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality()
      .hash([e?.pointsUsed, e?.createdAt, e?.productId, e?.status, e?.userId]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
