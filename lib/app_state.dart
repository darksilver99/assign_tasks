import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _appVersion = '';
  String get appVersion => _appVersion;
  set appVersion(String value) {
    _appVersion = value;
  }

  int _appBuildVersion = 0;
  int get appBuildVersion => _appBuildVersion;
  set appBuildVersion(int value) {
    _appBuildVersion = value;
  }

  CustomerDataStruct _customerData = CustomerDataStruct();
  CustomerDataStruct get customerData => _customerData;
  set customerData(CustomerDataStruct value) {
    _customerData = value;
  }

  void updateCustomerDataStruct(Function(CustomerDataStruct) updateFn) {
    updateFn(_customerData);
  }

  ConfigDataStruct _configData = ConfigDataStruct();
  ConfigDataStruct get configData => _configData;
  set configData(ConfigDataStruct value) {
    _configData = value;
  }

  void updateConfigDataStruct(Function(ConfigDataStruct) updateFn) {
    updateFn(_configData);
  }

  DocumentReference? _memberReference;
  DocumentReference? get memberReference => _memberReference;
  set memberReference(DocumentReference? value) {
    _memberReference = value;
  }

  List<DocumentReference> _memberReferenceSelected = [];
  List<DocumentReference> get memberReferenceSelected =>
      _memberReferenceSelected;
  set memberReferenceSelected(List<DocumentReference> value) {
    _memberReferenceSelected = value;
  }

  void addToMemberReferenceSelected(DocumentReference value) {
    memberReferenceSelected.add(value);
  }

  void removeFromMemberReferenceSelected(DocumentReference value) {
    memberReferenceSelected.remove(value);
  }

  void removeAtIndexFromMemberReferenceSelected(int index) {
    memberReferenceSelected.removeAt(index);
  }

  void updateMemberReferenceSelectedAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    memberReferenceSelected[index] = updateFn(_memberReferenceSelected[index]);
  }

  void insertAtIndexInMemberReferenceSelected(
      int index, DocumentReference value) {
    memberReferenceSelected.insert(index, value);
  }

  List<DataStatusStruct> _taskWorkerStatusList = [
    DataStatusStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"0\",\"subject\":\"กำลังทำงาน\"}')),
    DataStatusStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"1\",\"subject\":\"รอตรวจสอบ\"}')),
    DataStatusStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"3\",\"subject\":\"เสร็จสิ้น\"}')),
    DataStatusStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"4\",\"subject\":\"ยังไม่ผ่าน\"}')),
    DataStatusStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"5\",\"subject\":\"ยกเลิกงาน\"}'))
  ];
  List<DataStatusStruct> get taskWorkerStatusList => _taskWorkerStatusList;
  set taskWorkerStatusList(List<DataStatusStruct> value) {
    _taskWorkerStatusList = value;
  }

  void addToTaskWorkerStatusList(DataStatusStruct value) {
    taskWorkerStatusList.add(value);
  }

  void removeFromTaskWorkerStatusList(DataStatusStruct value) {
    taskWorkerStatusList.remove(value);
  }

  void removeAtIndexFromTaskWorkerStatusList(int index) {
    taskWorkerStatusList.removeAt(index);
  }

  void updateTaskWorkerStatusListAtIndex(
    int index,
    DataStatusStruct Function(DataStatusStruct) updateFn,
  ) {
    taskWorkerStatusList[index] = updateFn(_taskWorkerStatusList[index]);
  }

  void insertAtIndexInTaskWorkerStatusList(int index, DataStatusStruct value) {
    taskWorkerStatusList.insert(index, value);
  }

  List<DataStatusStruct> _taskStatusList = [
    DataStatusStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"0\",\"subject\":\"กำลังดำเนินการ\"}')),
    DataStatusStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"1\",\"subject\":\"เสร็จสิ้น\"}'))
  ];
  List<DataStatusStruct> get taskStatusList => _taskStatusList;
  set taskStatusList(List<DataStatusStruct> value) {
    _taskStatusList = value;
  }

  void addToTaskStatusList(DataStatusStruct value) {
    taskStatusList.add(value);
  }

  void removeFromTaskStatusList(DataStatusStruct value) {
    taskStatusList.remove(value);
  }

  void removeAtIndexFromTaskStatusList(int index) {
    taskStatusList.removeAt(index);
  }

  void updateTaskStatusListAtIndex(
    int index,
    DataStatusStruct Function(DataStatusStruct) updateFn,
  ) {
    taskStatusList[index] = updateFn(_taskStatusList[index]);
  }

  void insertAtIndexInTaskStatusList(int index, DataStatusStruct value) {
    taskStatusList.insert(index, value);
  }

  DocumentReference? _tmpTaskReference;
  DocumentReference? get tmpTaskReference => _tmpTaskReference;
  set tmpTaskReference(DocumentReference? value) {
    _tmpTaskReference = value;
  }

  List<MonthDataStruct> _monthList = [
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"1\",\"name\":\"มกราคม\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"2\",\"name\":\"กุมภาพันธ์\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"3\",\"name\":\"มีนาคม\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"4\",\"name\":\"เมษายน\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"5\",\"name\":\"พฤษภาคม\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"6\",\"name\":\"มิถุนายน\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"7\",\"name\":\"กรกฎาคม\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"8\",\"name\":\"สิงหาคม\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"9\",\"name\":\"กันยายน\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"10\",\"name\":\"ตุลาคม\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"11\",\"name\":\"พฤศจิกายน\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"12\",\"name\":\"ธันวาคม\"}'))
  ];
  List<MonthDataStruct> get monthList => _monthList;
  set monthList(List<MonthDataStruct> value) {
    _monthList = value;
  }

  void addToMonthList(MonthDataStruct value) {
    monthList.add(value);
  }

  void removeFromMonthList(MonthDataStruct value) {
    monthList.remove(value);
  }

  void removeAtIndexFromMonthList(int index) {
    monthList.removeAt(index);
  }

  void updateMonthListAtIndex(
    int index,
    MonthDataStruct Function(MonthDataStruct) updateFn,
  ) {
    monthList[index] = updateFn(_monthList[index]);
  }

  void insertAtIndexInMonthList(int index, MonthDataStruct value) {
    monthList.insert(index, value);
  }
}
