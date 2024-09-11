import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkerListRecord extends FirestoreRecord {
  WorkerListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "member_ref" field.
  DocumentReference? _memberRef;
  DocumentReference? get memberRef => _memberRef;
  bool hasMemberRef() => _memberRef != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _memberRef = snapshotData['member_ref'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('worker_list');

  static Stream<WorkerListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkerListRecord.fromSnapshot(s));

  static Future<WorkerListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkerListRecord.fromSnapshot(s));

  static WorkerListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkerListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkerListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkerListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkerListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkerListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkerListRecordData({
  DocumentReference? memberRef,
  int? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'member_ref': memberRef,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkerListRecordDocumentEquality implements Equality<WorkerListRecord> {
  const WorkerListRecordDocumentEquality();

  @override
  bool equals(WorkerListRecord? e1, WorkerListRecord? e2) {
    return e1?.memberRef == e2?.memberRef && e1?.status == e2?.status;
  }

  @override
  int hash(WorkerListRecord? e) =>
      const ListEquality().hash([e?.memberRef, e?.status]);

  @override
  bool isValidKey(Object? o) => o is WorkerListRecord;
}
