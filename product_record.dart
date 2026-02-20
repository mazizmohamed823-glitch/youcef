import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductRecord extends FirestoreRecord {
  ProductRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "imag_url" field.
  String? _imagUrl;
  String get imagUrl => _imagUrl ?? '';
  bool hasImagUrl() => _imagUrl != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "priceInPoints" field.
  int? _priceInPoints;
  int get priceInPoints => _priceInPoints ?? 0;
  bool hasPriceInPoints() => _priceInPoints != null;

  void _initializeFields() {
    _imagUrl = snapshotData['imag_url'] as String?;
    _description = snapshotData['description'] as String?;
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _priceInPoints = castToType<int>(snapshotData['priceInPoints']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('product');

  static Stream<ProductRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductRecord.fromSnapshot(s));

  static Future<ProductRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductRecord.fromSnapshot(s));

  static ProductRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductRecordData({
  String? imagUrl,
  String? description,
  String? id,
  String? name,
  int? priceInPoints,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'imag_url': imagUrl,
      'description': description,
      'id': id,
      'name': name,
      'priceInPoints': priceInPoints,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductRecordDocumentEquality implements Equality<ProductRecord> {
  const ProductRecordDocumentEquality();

  @override
  bool equals(ProductRecord? e1, ProductRecord? e2) {
    return e1?.imagUrl == e2?.imagUrl &&
        e1?.description == e2?.description &&
        e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.priceInPoints == e2?.priceInPoints;
  }

  @override
  int hash(ProductRecord? e) => const ListEquality()
      .hash([e?.imagUrl, e?.description, e?.id, e?.name, e?.priceInPoints]);

  @override
  bool isValidKey(Object? o) => o is ProductRecord;
}
