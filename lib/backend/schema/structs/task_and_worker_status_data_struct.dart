// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskAndWorkerStatusDataStruct extends FFFirebaseStruct {
  TaskAndWorkerStatusDataStruct({
    int? status,
    DocumentReference? taskReference,
    String? subject,
    String? detail,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _status = status,
        _taskReference = taskReference,
        _subject = subject,
        _detail = detail,
        super(firestoreUtilData);

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  set status(int? val) => _status = val;

  void incrementStatus(int amount) => status = status + amount;

  bool hasStatus() => _status != null;

  // "taskReference" field.
  DocumentReference? _taskReference;
  DocumentReference? get taskReference => _taskReference;
  set taskReference(DocumentReference? val) => _taskReference = val;

  bool hasTaskReference() => _taskReference != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  set subject(String? val) => _subject = val;

  bool hasSubject() => _subject != null;

  // "detail" field.
  String? _detail;
  String get detail => _detail ?? '';
  set detail(String? val) => _detail = val;

  bool hasDetail() => _detail != null;

  static TaskAndWorkerStatusDataStruct fromMap(Map<String, dynamic> data) =>
      TaskAndWorkerStatusDataStruct(
        status: castToType<int>(data['status']),
        taskReference: data['taskReference'] as DocumentReference?,
        subject: data['subject'] as String?,
        detail: data['detail'] as String?,
      );

  static TaskAndWorkerStatusDataStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? TaskAndWorkerStatusDataStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'taskReference': _taskReference,
        'subject': _subject,
        'detail': _detail,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.int,
        ),
        'taskReference': serializeParam(
          _taskReference,
          ParamType.DocumentReference,
        ),
        'subject': serializeParam(
          _subject,
          ParamType.String,
        ),
        'detail': serializeParam(
          _detail,
          ParamType.String,
        ),
      }.withoutNulls;

  static TaskAndWorkerStatusDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TaskAndWorkerStatusDataStruct(
        status: deserializeParam(
          data['status'],
          ParamType.int,
          false,
        ),
        taskReference: deserializeParam(
          data['taskReference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['customer_name', 'task_list'],
        ),
        subject: deserializeParam(
          data['subject'],
          ParamType.String,
          false,
        ),
        detail: deserializeParam(
          data['detail'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TaskAndWorkerStatusDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TaskAndWorkerStatusDataStruct &&
        status == other.status &&
        taskReference == other.taskReference &&
        subject == other.subject &&
        detail == other.detail;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([status, taskReference, subject, detail]);
}

TaskAndWorkerStatusDataStruct createTaskAndWorkerStatusDataStruct({
  int? status,
  DocumentReference? taskReference,
  String? subject,
  String? detail,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TaskAndWorkerStatusDataStruct(
      status: status,
      taskReference: taskReference,
      subject: subject,
      detail: detail,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TaskAndWorkerStatusDataStruct? updateTaskAndWorkerStatusDataStruct(
  TaskAndWorkerStatusDataStruct? taskAndWorkerStatusData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    taskAndWorkerStatusData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTaskAndWorkerStatusDataStructData(
  Map<String, dynamic> firestoreData,
  TaskAndWorkerStatusDataStruct? taskAndWorkerStatusData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (taskAndWorkerStatusData == null) {
    return;
  }
  if (taskAndWorkerStatusData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      taskAndWorkerStatusData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final taskAndWorkerStatusDataData = getTaskAndWorkerStatusDataFirestoreData(
      taskAndWorkerStatusData, forFieldValue);
  final nestedData =
      taskAndWorkerStatusDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      taskAndWorkerStatusData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTaskAndWorkerStatusDataFirestoreData(
  TaskAndWorkerStatusDataStruct? taskAndWorkerStatusData, [
  bool forFieldValue = false,
]) {
  if (taskAndWorkerStatusData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(taskAndWorkerStatusData.toMap());

  // Add any Firestore field values
  taskAndWorkerStatusData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTaskAndWorkerStatusDataListFirestoreData(
  List<TaskAndWorkerStatusDataStruct>? taskAndWorkerStatusDatas,
) =>
    taskAndWorkerStatusDatas
        ?.map((e) => getTaskAndWorkerStatusDataFirestoreData(e, true))
        .toList() ??
    [];
