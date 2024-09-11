// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MemberSelectDataStruct extends FFFirebaseStruct {
  MemberSelectDataStruct({
    DocumentReference? memberRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _memberRef = memberRef,
        super(firestoreUtilData);

  // "member_ref" field.
  DocumentReference? _memberRef;
  DocumentReference? get memberRef => _memberRef;
  set memberRef(DocumentReference? val) => _memberRef = val;

  bool hasMemberRef() => _memberRef != null;

  static MemberSelectDataStruct fromMap(Map<String, dynamic> data) =>
      MemberSelectDataStruct(
        memberRef: data['member_ref'] as DocumentReference?,
      );

  static MemberSelectDataStruct? maybeFromMap(dynamic data) => data is Map
      ? MemberSelectDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'member_ref': _memberRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'member_ref': serializeParam(
          _memberRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static MemberSelectDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MemberSelectDataStruct(
        memberRef: deserializeParam(
          data['member_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['customer_name', 'member_list'],
        ),
      );

  @override
  String toString() => 'MemberSelectDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MemberSelectDataStruct && memberRef == other.memberRef;
  }

  @override
  int get hashCode => const ListEquality().hash([memberRef]);
}

MemberSelectDataStruct createMemberSelectDataStruct({
  DocumentReference? memberRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MemberSelectDataStruct(
      memberRef: memberRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MemberSelectDataStruct? updateMemberSelectDataStruct(
  MemberSelectDataStruct? memberSelectData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    memberSelectData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMemberSelectDataStructData(
  Map<String, dynamic> firestoreData,
  MemberSelectDataStruct? memberSelectData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (memberSelectData == null) {
    return;
  }
  if (memberSelectData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && memberSelectData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final memberSelectDataData =
      getMemberSelectDataFirestoreData(memberSelectData, forFieldValue);
  final nestedData =
      memberSelectDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = memberSelectData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMemberSelectDataFirestoreData(
  MemberSelectDataStruct? memberSelectData, [
  bool forFieldValue = false,
]) {
  if (memberSelectData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(memberSelectData.toMap());

  // Add any Firestore field values
  memberSelectData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMemberSelectDataListFirestoreData(
  List<MemberSelectDataStruct>? memberSelectDatas,
) =>
    memberSelectDatas
        ?.map((e) => getMemberSelectDataFirestoreData(e, true))
        .toList() ??
    [];
