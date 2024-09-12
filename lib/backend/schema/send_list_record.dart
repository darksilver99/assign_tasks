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

  // "reply" field.
  String? _reply;
  String get reply => _reply ?? '';
  bool hasReply() => _reply != null;

  // "image_reply_list" field.
  List<String>? _imageReplyList;
  List<String> get imageReplyList => _imageReplyList ?? const [];
  bool hasImageReplyList() => _imageReplyList != null;

  // "file_reply_list" field.
  List<String>? _fileReplyList;
  List<String> get fileReplyList => _fileReplyList ?? const [];
  bool hasFileReplyList() => _fileReplyList != null;

  // "reply_date" field.
  DateTime? _replyDate;
  DateTime? get replyDate => _replyDate;
  bool hasReplyDate() => _replyDate != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _remark = snapshotData['remark'] as String?;
    _imageList = getDataList(snapshotData['image_list']);
    _fileList = getDataList(snapshotData['file_list']);
    _sendDate = snapshotData['send_date'] as DateTime?;
    _reply = snapshotData['reply'] as String?;
    _imageReplyList = getDataList(snapshotData['image_reply_list']);
    _fileReplyList = getDataList(snapshotData['file_reply_list']);
    _replyDate = snapshotData['reply_date'] as DateTime?;
    _status = castToType<int>(snapshotData['status']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('send_list')
          : FirebaseFirestore.instance.collectionGroup('send_list');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('send_list').doc(id);

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
  String? reply,
  DateTime? replyDate,
  int? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'remark': remark,
      'send_date': sendDate,
      'reply': reply,
      'reply_date': replyDate,
      'status': status,
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
        e1?.sendDate == e2?.sendDate &&
        e1?.reply == e2?.reply &&
        listEquality.equals(e1?.imageReplyList, e2?.imageReplyList) &&
        listEquality.equals(e1?.fileReplyList, e2?.fileReplyList) &&
        e1?.replyDate == e2?.replyDate &&
        e1?.status == e2?.status;
  }

  @override
  int hash(SendListRecord? e) => const ListEquality().hash([
        e?.remark,
        e?.imageList,
        e?.fileList,
        e?.sendDate,
        e?.reply,
        e?.imageReplyList,
        e?.fileReplyList,
        e?.replyDate,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is SendListRecord;
}
