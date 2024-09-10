import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReplyListRecord extends FirestoreRecord {
  ReplyListRecord._(
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

  // "reply_date" field.
  DateTime? _replyDate;
  DateTime? get replyDate => _replyDate;
  bool hasReplyDate() => _replyDate != null;

  // "reply_by" field.
  DocumentReference? _replyBy;
  DocumentReference? get replyBy => _replyBy;
  bool hasReplyBy() => _replyBy != null;

  void _initializeFields() {
    _remark = snapshotData['remark'] as String?;
    _imageList = getDataList(snapshotData['image_list']);
    _fileList = getDataList(snapshotData['file_list']);
    _replyDate = snapshotData['reply_date'] as DateTime?;
    _replyBy = snapshotData['reply_by'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reply_list');

  static Stream<ReplyListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReplyListRecord.fromSnapshot(s));

  static Future<ReplyListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReplyListRecord.fromSnapshot(s));

  static ReplyListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReplyListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReplyListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReplyListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReplyListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReplyListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReplyListRecordData({
  String? remark,
  DateTime? replyDate,
  DocumentReference? replyBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'remark': remark,
      'reply_date': replyDate,
      'reply_by': replyBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReplyListRecordDocumentEquality implements Equality<ReplyListRecord> {
  const ReplyListRecordDocumentEquality();

  @override
  bool equals(ReplyListRecord? e1, ReplyListRecord? e2) {
    const listEquality = ListEquality();
    return e1?.remark == e2?.remark &&
        listEquality.equals(e1?.imageList, e2?.imageList) &&
        listEquality.equals(e1?.fileList, e2?.fileList) &&
        e1?.replyDate == e2?.replyDate &&
        e1?.replyBy == e2?.replyBy;
  }

  @override
  int hash(ReplyListRecord? e) => const ListEquality()
      .hash([e?.remark, e?.imageList, e?.fileList, e?.replyDate, e?.replyBy]);

  @override
  bool isValidKey(Object? o) => o is ReplyListRecord;
}
