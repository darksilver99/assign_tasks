import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SendListRecord extends FirestoreRecord {
  SendListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "remark" field.
  String? _remark;
  String get remark => _remark ?? '';
  bool hasRemark() => _remark != null;

  // "image_list" field.
  List<String>? _imageList;
  List<String> get imageList => _imageList ?? const [];
  bool hasImageList() => _imageList != null;

  // "file_list" field.
  List<String>? _fileList;
  List<String> get fileList => _fileList ?? const [];
  bool hasFileList() => _fileList != null;

  // "send_date" field.
  DateTime? _sendDate;
  DateTime? get sendDate => _sendDate;
  bool hasSendDate() => _sendDate != null;

  void _initializeFields() {
    _remark = snapshotData['remark'] as String?;
    _imageList = getDataList(snapshotData['image_list']);
    _fileList = getDataList(snapshotData['file_list']);
    _sendDate = snapshotData['send_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('${FFAppState().customerData.customerRef!.path}');

  static Stream<SendListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SendListRecord.fromSnapshot(s));

  static Future<SendListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SendListRecord.fromSnapshot(s));

  static SendListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SendListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SendListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SendListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SendListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SendListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSendListRecordData({
  String? remark,
  DateTime? sendDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'remark': remark,
      'send_date': sendDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class SendListRecordDocumentEquality implements Equality<SendListRecord> {
  const SendListRecordDocumentEquality();

  @override
  bool equals(SendListRecord? e1, SendListRecord? e2) {
    const listEquality = ListEquality();
    return e1?.remark == e2?.remark &&
        listEquality.equals(e1?.imageList, e2?.imageList) &&
        listEquality.equals(e1?.fileList, e2?.fileList) &&
        e1?.sendDate == e2?.sendDate;
  }

  @override
  int hash(SendListRecord? e) => const ListEquality()
      .hash([e?.remark, e?.imageList, e?.fileList, e?.sendDate]);

  @override
  bool isValidKey(Object? o) => o is SendListRecord;
}
