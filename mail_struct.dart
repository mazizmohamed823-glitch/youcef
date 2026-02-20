// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MailStruct extends FFFirebaseStruct {
  MailStruct({
    String? subject,
    String? text,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _subject = subject,
        _text = text,
        super(firestoreUtilData);

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  set subject(String? val) => _subject = val;

  bool hasSubject() => _subject != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  static MailStruct fromMap(Map<String, dynamic> data) => MailStruct(
        subject: data['subject'] as String?,
        text: data['text'] as String?,
      );

  static MailStruct? maybeFromMap(dynamic data) =>
      data is Map ? MailStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'subject': _subject,
        'text': _text,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'subject': serializeParam(
          _subject,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
      }.withoutNulls;

  static MailStruct fromSerializableMap(Map<String, dynamic> data) =>
      MailStruct(
        subject: deserializeParam(
          data['subject'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MailStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MailStruct &&
        subject == other.subject &&
        text == other.text;
  }

  @override
  int get hashCode => const ListEquality().hash([subject, text]);
}

MailStruct createMailStruct({
  String? subject,
  String? text,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MailStruct(
      subject: subject,
      text: text,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MailStruct? updateMailStruct(
  MailStruct? mail, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    mail
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMailStructData(
  Map<String, dynamic> firestoreData,
  MailStruct? mail,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (mail == null) {
    return;
  }
  if (mail.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && mail.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mailData = getMailFirestoreData(mail, forFieldValue);
  final nestedData = mailData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = mail.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMailFirestoreData(
  MailStruct? mail, [
  bool forFieldValue = false,
]) {
  if (mail == null) {
    return {};
  }
  final firestoreData = mapToFirestore(mail.toMap());

  // Add any Firestore field values
  mail.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMailListFirestoreData(
  List<MailStruct>? mails,
) =>
    mails?.map((e) => getMailFirestoreData(e, true)).toList() ?? [];
